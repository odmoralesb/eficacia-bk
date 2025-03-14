using AutoMapper;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using TQ.Proveedores.Application.Helpers;
using TQ.Proveedores.Application.Parametros.Queries;
using TQ.Proveedores.Domain.Enums;
using TQ.Proveedores.Domain.Evaluaciones;
using TQ.Proveedores.Domain.OrdenesDeCompra;
using TQ.Proveedores.Domain.Parametros;
using TQ.Repository.Abstractions;
using TQ.Util.MediatRUtils;
using TQ.Utils.AutoMapperUtils;

namespace TQ.Proveedores.Application.Evaluaciones.Commands
{
    public class CreateEvaluacionCommand : IRequest<ResponseBase<bool>>, IMapFrom<Evaluacion>
    {
        public string NombrePeriodo { get; set; }
        public bool Inicializacion { get; set; } = false;
    }

    public class CreateEvaluacionCommandHandler : IRequestHandler<CreateEvaluacionCommand, ResponseBase<bool>>
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IRepository<Evaluacion> _repositoryEvaluacion;
        private readonly IRepository<Evento> _repositoryEvento;
        private readonly IRepository<Parametro> _repositoryParametro;
        private readonly IMapper _mapper;
        private bool inicializacion = false;

        public CreateEvaluacionCommandHandler(IUnitOfWork unitOfWork,
                                              IRepository<Evaluacion> repositoryEvaluacion,
                                              IRepository<Evento> repositoryEvento,
                                              IRepository<Parametro> repositoryParametro,
                                              IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _repositoryEvaluacion = repositoryEvaluacion;
            _repositoryEvento = repositoryEvento;
            _repositoryParametro = repositoryParametro;
            _mapper = mapper;
        }

        public async Task<ResponseBase<bool>> Handle(CreateEvaluacionCommand request, CancellationToken cancellationToken)
        {
            this.inicializacion = request.Inicializacion;

            var listaEventos = GetEventos(request.NombrePeriodo);
            if (!this.inicializacion) {
                await SumarCantidadesAsync(listaEventos, cancellationToken);
            }
            
            var parametroIndicadores = GetParametroIndicadores();

            _repositoryEvaluacion.Delete(x => x.NombrePeriodo.ToUpper() == request.NombrePeriodo.ToUpper());

            var resultados = await CalcularIndicadoresAsync(listaEventos, parametroIndicadores, cancellationToken);

            await InsertEvaluacionesAsync(resultados, request.NombrePeriodo, listaEventos, cancellationToken);

            return new ResponseBase<bool>(true);
        }

        private List<Evento> GetEventos(string nombrePeriodo)
        {
            return _repositoryEvento.Table
                .Where(x => x.Periodo.ToUpper() == nombrePeriodo.ToUpper())
                .OrderByDescending(x => x.OrdenCompraId)
                .ThenBy(x => x.FechaRecepcion)
                .ToList();
        }

        private List<ParametroDTO> GetParametroIndicadores()
        {
            return _repositoryParametro.TableNoTracking
                .Where(x => x.Nombre.Contains("Indicador") || x.Nombre.Contains("Calificacion Minima"))
                .Select(x => new ParametroDTO
                {
                    Id = x.Id,
                    Nombre = x.Nombre.ToUpper(),
                    Descripcion = x.Descripcion,
                    OrganizacionId = x.OrganizacionId,
                    Detalles = _mapper.Map<List<ParametroDetalleDTO>>(x.Detalles),
                    Valores = _mapper.Map<List<ParametroValorDTO>>(x.Valores)
                })
                .ToList();
        }

        private async Task<bool> SumarCantidadesAsync(List<Evento> listaEventos, CancellationToken cancellationToken)
        {
            int batchSize = 100;
            int j = 0;
            List<Guid> eventosBorrar = new List<Guid>();
            for (int i = 0; i < listaEventos.Count - 1; i++)
            {
                if (((listaEventos.ElementAt(i + 1).FechaRecepcion - listaEventos.ElementAt(i).FechaRecepcion).TotalDays >= -2 &&
                    (listaEventos.ElementAt(i + 1).FechaRecepcion - listaEventos.ElementAt(i).FechaRecepcion).TotalDays <= 2)
                    && (listaEventos.ElementAt(i).OrdenCompraId == listaEventos.ElementAt(i + 1).OrdenCompraId)
                    && (listaEventos.ElementAt(i).CodigoCalidad == listaEventos.ElementAt(i + 1).CodigoCalidad))
                {
                    listaEventos.ElementAt(i).CantidadAceptada += listaEventos.ElementAt(i + 1).CantidadAceptada;
                    listaEventos.ElementAt(i).CantidadDevuelta += listaEventos.ElementAt(i + 1).CantidadDevuelta;
                    listaEventos.ElementAt(i).CantidadRechazada += listaEventos.ElementAt(i + 1).CantidadRechazada;
                    listaEventos.ElementAt(i).CantidadRecibida += listaEventos.ElementAt(i + 1).CantidadRecibida;

                    eventosBorrar.Add(listaEventos.ElementAt(i + 1).Id);
                    i++;

                    _repositoryEvento.Update(listaEventos.ElementAt(i));
                }

                if ((++j % batchSize) == 0)
                {
                    await _unitOfWork.CommitAsync(cancellationToken);
                }
            }

            _repositoryEvento.Delete(x => eventosBorrar.Contains(x.Id));

            await _unitOfWork.CommitAsync(cancellationToken);

            return await Task.FromResult(true);
        }

        private async Task<Dictionary<Guid, (decimal Fecha, decimal Cantidad, decimal Calidad, decimal Cumplimiento)>> CalcularIndicadoresAsync(
            List<Evento> eventos, List<ParametroDTO> parametroIndicadores, CancellationToken cancellationToken)
        {
            var resultados = new Dictionary<Guid, (decimal Fecha, decimal Cantidad, decimal Calidad, decimal Cumplimiento, int Count)>();

            foreach (var evento in eventos)
            {
                if (!this.inicializacion)
                {
                    (decimal indicadorFechaSys, decimal indicadorFecha) = CalcularIndicadorFecha(evento, parametroIndicadores);
                    (decimal indicadorCantidadSys, decimal indicadorCantidad) = CalcularIndicadorCantidad(evento, parametroIndicadores);
                    (decimal indicadorCalidadSys, decimal indicadorCalidad) = CalcularIndicadorCalidad(evento, parametroIndicadores);
                    (decimal indicadorCumplimiento, decimal indicadorCumplimientoDefinitivo) = CalcularIndicadorCumplimiento(evento, parametroIndicadores, indicadorFecha, indicadorCantidad, indicadorCalidad);

                    if (resultados.ContainsKey(evento.OrdenCompraId))
                    {
                        var existing = resultados[evento.OrdenCompraId];
                        resultados[evento.OrdenCompraId] = (
                            Fecha: existing.Fecha + indicadorFecha,
                            Cantidad: existing.Cantidad + indicadorCantidad,
                            Calidad: existing.Calidad + indicadorCalidad,
                            Cumplimiento: existing.Cumplimiento + indicadorCumplimientoDefinitivo,
                            Count: existing.Count + 1
                        );
                    }
                    else
                    {
                        resultados[evento.OrdenCompraId] = (indicadorFecha, indicadorCantidad, indicadorCalidad, indicadorCumplimientoDefinitivo, 1);
                    }

                    evento.IndicadorFechaSys = indicadorFechaSys;
                    evento.IndicadorFecha = indicadorFecha;
                    evento.IndicadorCantidadSys = indicadorCantidadSys;
                    evento.IndicadorCantidad = indicadorCantidad;
                    evento.IndicadorCalidadSys = indicadorCalidadSys;
                    evento.IndicadorCalidad = indicadorCalidad;
                    evento.IndicadorCumplimiento = indicadorCumplimiento;
                    evento.IndicadorCumplimientoDefinitivo = indicadorCumplimientoDefinitivo;

                    _repositoryEvento.Update(evento);

                }
                else
                {
                    resultados[evento.OrdenCompraId] = (evento.IndicadorFecha, evento.IndicadorCantidad, evento.IndicadorCalidad, evento.IndicadorCumplimientoDefinitivo, 1);
                }
                
            }

            await _unitOfWork.CommitAsync(cancellationToken);
            var averagedResultados = resultados.ToDictionary(
                kvp => kvp.Key,
                kvp => (
                    Fecha: kvp.Value.Fecha / kvp.Value.Count,
                    Cantidad: kvp.Value.Cantidad / kvp.Value.Count,
                    Calidad: kvp.Value.Calidad / kvp.Value.Count,
                    Cumplimiento: kvp.Value.Cumplimiento / kvp.Value.Count
                )
            );

            return averagedResultados;
        }

        private (decimal, decimal) CalcularIndicadorCumplimiento(Evento evento, List<ParametroDTO> parametroIndicadores, decimal indicadorFecha, decimal indicadorCantidad, decimal indicadorCalidad)
        {
            decimal valor = indicadorCalidad + indicadorCantidad + indicadorFecha;
            decimal umbral = ParametrizacionHelper.ObtenerValorParametrizado(parametroIndicadores, "Calificacion Minima de recibido", "TIPO INSUMO", evento.OrdenCompra.TipoOC);
            return (valor, valor >= umbral ? valor : 0);
        }

        private (decimal, decimal) CalcularIndicadorCalidad(Evento evento, List<ParametroDTO> parametroIndicadores)
        {
            decimal valor = (evento.CantidadAceptada / evento.CantidadRecibida);
            decimal calificacion = ParametrizacionHelper.ObtenerValorParametrizado(parametroIndicadores, "Indicador Calidad", "ESTADO", evento.CodigoCalidad) * valor;

            if (evento.IndicadorCalidadSys == evento.IndicadorCalidad)
            {
                return (calificacion, calificacion);
            }

            return (calificacion, evento.IndicadorCalidad);
        }

        private (decimal, decimal) CalcularIndicadorCantidad(Evento evento, List<ParametroDTO> parametroIndicadores)
        {
            decimal valor = (evento.CantidadRecibida / evento.CantidadSolicitada) * 100;
            decimal calificacion = ParametrizacionHelper.ObtenerValorParametrizado(parametroIndicadores, "Indicador Cantidad", valor);

            if (evento.IndicadorCantidadSys == evento.IndicadorCantidad)
            {
                return (calificacion, calificacion);
            }

            return (calificacion, evento.IndicadorCantidad);
        }

        private (decimal, decimal) CalcularIndicadorFecha(Evento evento, List<ParametroDTO> parametroIndicadores)
        {
            bool casoRaro = evento.Urgencia && (evento.LeadTimeReal < evento.LeadTimeMaestra);
            decimal calificacion = ParametrizacionHelper.ObtenerValorParametrizado(parametroIndicadores, "Indicador Fecha Oportuna", evento.Dias, evento.OrdenCompra.TipoOC, casoRaro);

            if (evento.IndicadorFechaSys == evento.IndicadorFecha)
            {
                return (calificacion, calificacion);
            }

            return (calificacion, evento.IndicadorFecha);
        }

        private async Task InsertEvaluacionesAsync(
            Dictionary<Guid, (decimal Fecha, decimal Cantidad, decimal Calidad, decimal Cumplimiento)> resultados,
            string nombrePeriodo,
            List<Evento> listaEventos,
            CancellationToken cancellationToken)
        {
            const int batchSize = 100;
            var count = 0;

            foreach (var (ordenCompraId, indicadores) in resultados)
            {
                var evaluacion = new Evaluacion
                {
                    IndicadorFecha = indicadores.Fecha,
                    IndicadorCantidad = indicadores.Cantidad,
                    IndicadorCalidad = indicadores.Calidad,
                    IndicadorCumplimiento = indicadores.Cumplimiento,
                    NombrePeriodo = nombrePeriodo.ToUpper(),
                    Estado = (int)EstadoEvaluacion.PENDIENTE_APROBACION,
                    OrdenesCompra = { listaEventos.First(x => x.OrdenCompraId == ordenCompraId).OrdenCompra }
                };

                _repositoryEvaluacion.Insert(evaluacion);

                if (++count % batchSize == 0)
                {
                    await _unitOfWork.CommitAsync(cancellationToken);
                }
            }

            if (count % batchSize != 0)
            {
                await _unitOfWork.CommitAsync(cancellationToken);
            }
        }
    }
}

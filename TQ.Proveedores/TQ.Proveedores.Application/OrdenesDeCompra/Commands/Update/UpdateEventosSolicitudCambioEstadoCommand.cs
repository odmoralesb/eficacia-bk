using AutoMapper;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using TQ.Proveedores.Application.Exceptions;
using TQ.Proveedores.Application.Helpers;
using TQ.Proveedores.Application.Parametros.Queries;
using TQ.Proveedores.Application.ServiceAgents.Interfaces;
using TQ.Proveedores.Domain.Configuracion;
using TQ.Proveedores.Domain.Enums;
using TQ.Proveedores.Domain.Evaluaciones;
using TQ.Proveedores.Domain.Maestras;
using TQ.Proveedores.Domain.OrdenesDeCompra;
using TQ.Proveedores.Domain.Parametros;
using TQ.Repository.Abstractions;
using TQ.Util.MediatRUtils;

namespace TQ.Proveedores.Application.OrdenesDeCompra.Commands
{
    public class EvaluacionEstadoActualizado
    {
        public Guid Id { get; set; }
        public string NumOc { get; set; }
        public string NumeroLote { get; set; }
        public decimal? IndicadorFecha { get; set; }
        public decimal IndicadorFechaSys { get; set; }
        public decimal? IndicadorCantidad { get; set; }
        public decimal IndicadorCantidadSys { get; set; }
        public decimal? IndicadorCalidad { get; set; }
        public decimal IndicadorCalidadSys { get; set; }
        public int? CodigoCausal { get; set; }
        public string Comentario { get; set; }
        public Guid OrdenCompraId { get; set; }
        public string Periodo { get; set; }
        public bool CompraDesarrollo { get; set; }
        public int Estado { get; set; }
    }

    public class UpdateEventosSolicitudCambioEstadoCommand : IRequest<ResponseBase<bool>>
    {
        public Guid SolicitudCambioEstadoId { get; set; }
        public IEnumerable<EvaluacionEstadoActualizado> EvaluacionesEstadoActualizado { get; set; }
    }

    public class UpdateEventosSolicitudCambioEstadoCommandHandler : IRequestHandler<UpdateEventosSolicitudCambioEstadoCommand, ResponseBase<bool>>
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IRepository<Evaluacion> _repositoryEvaluacion;
        private readonly IRepository<OrdenCompra> _repositoryOrdenCompra;
        private readonly IRepository<Evento> _repositoryEvento;
        private readonly IRepository<Causal> _repositoryCausal;
        private readonly IRepository<Parametro> _repositoryParametro;
        private readonly IRepository<Usuario> _repositoryUsuario;
        private readonly IRepository<ParametroValor> _repositoryParametroValor;
        private readonly IEmailSender _emailSender;
        private readonly IMapper _mapper;

        public UpdateEventosSolicitudCambioEstadoCommandHandler(IUnitOfWork unitOfWork, IRepository<Evaluacion> repositoryEvaluacion, IRepository<OrdenCompra> repositoryOrdenCompra, IRepository<Evento> repositoryEvento, IRepository<Causal> repositoryCausal, IRepository<Parametro> repositoryParametro, IRepository<Usuario> repositoryUsuario, IRepository<ParametroValor> repositoryParametroValor, IEmailSender emailSender, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _repositoryEvaluacion = repositoryEvaluacion;
            _repositoryOrdenCompra = repositoryOrdenCompra;
            _repositoryEvento = repositoryEvento;
            _repositoryCausal = repositoryCausal;
            _repositoryParametro = repositoryParametro;
            _repositoryUsuario = repositoryUsuario;
            _repositoryParametroValor = repositoryParametroValor;
            _emailSender = emailSender;
            _mapper = mapper;
        }

        public async Task<ResponseBase<bool>> Handle(UpdateEventosSolicitudCambioEstadoCommand request, CancellationToken cancellationToken)
        {
            List<ParametroDTO> parametroIndicadores = GetParametroIndicadores();
            var errores = new List<string>();

            foreach (var item in request.EvaluacionesEstadoActualizado)
            {
                var evento = _repositoryEvento.GetById(item.Id) ?? throw new NotFoundException("El recibido no existe", item.Id);
                evento.IndicadorCalidad = item.IndicadorCalidad ?? 0;
                evento.IndicadorCantidad = item.IndicadorCantidad ?? 0;
                evento.IndicadorFecha = item.IndicadorFecha ?? 0;
                evento.IndicadorCumplimiento = (item.IndicadorFecha ?? 0) + (item.IndicadorCantidad ?? 0) + (item.IndicadorCalidad ?? 0);
                decimal umbral = ParametrizacionHelper.ObtenerValorParametrizado(parametroIndicadores, "Calificacion Minima de recibido", "TIPO INSUMO", evento.OrdenCompra.TipoOC);
                evento.IndicadorCumplimientoDefinitivo = evento.IndicadorCumplimiento >= umbral ? evento.IndicadorCumplimiento : 0;

                if (evento.IndicadorCumplimientoDefinitivo == 0 && item.CodigoCausal == null)
                {
                    errores.Add($"La OC: {item.NumOc} con el Lote {item.NumeroLote}: La causal es requerida debido a que no pasó el puntaje mínimo.");
                    continue;
                }

                evento.CausalId = _repositoryCausal.Get(x => x.CodigoCausal == (item.CodigoCausal ?? 0))?.Id;
                evento.Comentario = item.Comentario;

                var responeIndicadorCantidad = ValidarRangoIndicador("Indicador Cantidad", evento.IndicadorCantidad);
                if (!responeIndicadorCantidad.existeEnRango)
                {
                    errores.Add($"La OC: {item.NumOc} con el Lote {item.NumeroLote}: El indicador de cantidad no está en el rango en que está parametrizado. El valor máximo permitido es " + responeIndicadorCantidad.mayorNumero);
                    continue;
                }

                var responeIndicadorCalidad = ValidarRangoIndicador("Indicador Calidad", evento.IndicadorCalidad);
                if (!responeIndicadorCalidad.existeEnRango)
                {
                    errores.Add($"La OC: {item.NumOc} con el Lote {item.NumeroLote}: El indicador de calidad no está en el rango en que está parametrizado. El valor máximo permitido es " + responeIndicadorCalidad.mayorNumero);
                    continue;
                }

                var responeFecha = ValidarRangoIndicador("Indicador Fecha Oportuna Nacional", evento.IndicadorFecha);
                if (!responeFecha.existeEnRango)
                {
                    errores.Add($"La OC: {item.NumOc} con el Lote {item.NumeroLote}: El indicador de fecha oportuna no está en el rango en que está parametrizado. El valor máximo permitido es " + responeFecha.mayorNumero);
                    continue;
                }

                evento.Estado = (int)EstadoEvaluacion.APROBADO;
                _repositoryEvento.Update(evento);

                var ordenCompra = _repositoryOrdenCompra.GetById(item.OrdenCompraId);
                ordenCompra.CompraDesarrollo = item.CompraDesarrollo;
                _repositoryOrdenCompra.Update(ordenCompra);

                await _unitOfWork.CommitAsync(cancellationToken);

                var recalculo = _repositoryEvento.TableNoTracking.Where(x => x.Periodo.ToUpper() == item.Periodo.ToUpper()).GroupBy(x => x.OrdenCompraId).Select(g => new
                {
                    OrdenCompraId = g.Key,
                    IndicadorFecha = g.Average(e => e.IndicadorFecha),
                    IndicadorCantidad = g.Average(e => e.IndicadorCantidad),
                    IndicadorCalidad = g.Average(e => e.IndicadorCalidad),
                    IndicadorCumplimientoDefinitivo = g.Average(e => e.IndicadorCumplimientoDefinitivo),
                }).First(x => x.OrdenCompraId == item.OrdenCompraId);

                var evaluacion = _repositoryEvaluacion.Get(x => x.OrdenesCompra.Any(x => x.Id == item.OrdenCompraId) && x.NombrePeriodo == item.Periodo);
                evaluacion.IndicadorFecha = recalculo.IndicadorFecha;
                evaluacion.IndicadorCantidad = recalculo.IndicadorCantidad;
                evaluacion.IndicadorCalidad = recalculo.IndicadorCalidad;
                evaluacion.IndicadorCumplimiento = recalculo.IndicadorCumplimientoDefinitivo;
                evaluacion.Estado = (int)EstadoEvaluacion.APROBADO;

                _repositoryEvaluacion.Update(evaluacion);
                await _unitOfWork.CommitAsync(cancellationToken);

                int ocAprobadas = _repositoryEvaluacion.TableNoTracking.Where(x => (x.NombrePeriodo == item.Periodo) && x.OrdenesCompra.Any(x => x.CompradorId == ordenCompra.CompradorId) && (x.Estado == (int)EstadoEvaluacion.APROBADO)).Count();
                var totalOcs = _repositoryOrdenCompra.GetMany(x => (x.CompradorId == ordenCompra.CompradorId) && x.Eventos.Any(x => x.Periodo == item.Periodo)).Count();

                if (ocAprobadas == totalOcs)
                {
                    await EnviarCorreoAprobacion(ordenCompra.CompradorId, item.Periodo, cancellationToken);
                }
            }

            if (errores.Any())
            {
                throw new Exception(string.Join(Environment.NewLine, errores));
            }

            return await Task.FromResult(new ResponseBase<bool>(true));
        }

        private async Task EnviarCorreoAprobacion(Guid compradorId, string periodo = "", CancellationToken cancellationToken = default)
        {
            Usuario comprador = _repositoryUsuario.Get(x => x.Id == compradorId);
            if (comprador == null)
            {
                throw new Exception("El comprador no existe.");
            }

            string[] admins = _repositoryUsuario.TableNoTracking.Where(x => x.Rol.Nombre == "Administrador").Select(x => x.CorreoElectronico).ToArray();
            Usuario jefeDirecto = _repositoryUsuario.Get(x => x.Id == comprador.JefeDirectoId);
            await _emailSender.EnviarCorreoAprobacionAsync(comprador.GetNombreCompleto(), periodo, jefeDirecto.CorreoElectronico, admins, cancellationToken);
        }

        private List<ParametroDTO> GetParametroIndicadores()
        {
            return _repositoryParametro.TableNoTracking.Where(x => x.Nombre.Contains("Indicador") || x.Nombre.Contains("Calificacion Minima")).Select(x => new ParametroDTO
            {
                Id = x.Id,
                Nombre = x.Nombre.ToUpper(),
                Descripcion = x.Descripcion,
                OrganizacionId = x.OrganizacionId,
                Detalles = _mapper.Map<List<ParametroDetalleDTO>>(x.Detalles),
                Valores = _mapper.Map<List<ParametroValorDTO>>(x.Valores)
            }).ToList();
        }

        private (bool existeEnRango, int mayorNumero) ValidarRangoIndicador(string nombre, decimal indicador)
        {
            var resultado = _repositoryParametro.TableNoTracking.Where(ep => ep.Nombre == nombre).Join(_repositoryParametroValor.TableNoTracking, ep => ep.Id, epv => epv.ParametroId, (ep, epv) => new
            {
                ep.Nombre,
                epv.Campo1,
                epv.Campo3,
                epv.Campo5,
                epv.Campo6
            }).ToList();

            var mayor = resultado.Select(r =>
            {
                int? valorConvertido = null;
                if (r.Nombre == "Indicador Calidad")
                {
                    valorConvertido = int.TryParse(r.Campo3, out var valorCampo3) ? valorCampo3 : 0;
                }
                else if (r.Nombre == "Indicador Fecha Oportuna Nacional")
                {
                    valorConvertido = int.TryParse(r.Campo6, out var valorCampo6) ? valorCampo6 : 0;
                }
                else if (r.Nombre == "Indicador Cantidad")
                {
                    valorConvertido = int.TryParse(r.Campo5, out var valorCampo5) ? valorCampo5 : 0;
                }
                return valorConvertido;
            }).Max();

            var existeEnRango = resultado.Any(r =>
            {
                if (r.Nombre == "Indicador Calidad")
                {
                    return int.TryParse(r.Campo3, out var valorCampo3) && indicador <= valorCampo3;
                }
                else if (r.Nombre == "Indicador Fecha Oportuna Nacional")
                {
                    return int.TryParse(r.Campo6, out var valorCampo6) && indicador <= valorCampo6;
                }
                else
                {
                    return int.TryParse(r.Campo5, out var valorCampo5) && indicador <= valorCampo5;
                }
            });

            return (existeEnRango, (int)mayor);
        }
    }
}
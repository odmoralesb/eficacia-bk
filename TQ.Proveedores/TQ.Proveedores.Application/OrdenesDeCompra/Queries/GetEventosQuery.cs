using AutoMapper;
using AutoMapper.QueryableExtensions;
using DocumentFormat.OpenXml.Spreadsheet;
using DocumentFormat.OpenXml.Wordprocessing;
using MediatR;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using TQ.Proveedores.Application.Configuracion.Queries;
using TQ.Proveedores.Application.Evaluaciones.Queries;
using TQ.Proveedores.Domain.Configuracion;
using TQ.Proveedores.Domain.Maestras;
using TQ.Proveedores.Domain.OrdenesDeCompra;
using TQ.Repository.Abstractions;
using TQ.Util.MediatRUtils;

namespace TQ.Proveedores.Application.OrdenesDeCompra.Queries
{
    public class GetEventosQuery : IRequest<ResponseBase<List<EventosDTO>>>
    {
        public string UserName { get; set; }
        public List<Guid>? CompradorIds { get; set; }
        public List<Guid>? ProveedorIds { get; set; }
        public List<string> Periodo { get; set; }
        public string UnidadProductiva { get; set; }
        public decimal? IndicadorCalidad { get; set; }
        public decimal? IndicadorCantidad { get; set; }
        public decimal? IndicadorDesempeno { get; set; }
        public decimal? IndicadorFecha { get; set; }
        public string Consignado { get; set; }
        public string operador {  get; set; }
        public string TipoOc { get; set; }

        public List<string> Oc { get; set; }
        public List<string> CodigoInsumo { get; set; }


    }

    public class GetEventosQueryHandler : IRequestHandler<GetEventosQuery, ResponseBase<List<EventosDTO>>>
    {
        private readonly IRepository<Evento> _repositoryEvento;
        private readonly IRepository<Usuario> _repositoryUsuario;
        private readonly IRepository<OrdenCompra> _repositoryOrdenCompra;
        private readonly IMapper _mapper;
        private readonly ILogger<GetEventosQueryHandler> _logger;
        private readonly IRepository<CalendarioTQ> _repositoryCalendario;

        public GetEventosQueryHandler(IRepository<Evento> repositoryEvento, 
            IMapper mapper, 
            IRepository<Usuario> repositoryUsuario,
            IRepository<OrdenCompra> repositoryOrdenCompra,
            IRepository<CalendarioTQ> repositoryCalendario,
            ILogger<GetEventosQueryHandler> logger)
        {
            _repositoryEvento = repositoryEvento;
            _repositoryUsuario = repositoryUsuario;
            _repositoryOrdenCompra = repositoryOrdenCompra;
            _repositoryCalendario = repositoryCalendario;
            _logger = logger;
            _mapper = mapper;
        }

        public Task<ResponseBase<List<EventosDTO>>> Handle(GetEventosQuery request, CancellationToken cancellationToken)
        {
            // Obtener los datos según el usuario en sesión.
           UsuarioDTO usuario = _repositoryUsuario.TableNoTracking
                                            .ProjectTo<UsuarioDTO>(_mapper.ConfigurationProvider)
                                            .FirstOrDefault(x => x.NombreUsuario.ToUpper() == request.UserName.ToUpper());
            if (usuario == null)
            {
                throw new Exception("Usuario inválido");
            }

            if (request.CompradorIds == null || !request.CompradorIds.Any())
            {
                if (usuario.Rol.Nombre == "Administrador")
                {
                    request.CompradorIds = _repositoryUsuario.TableNoTracking.Select(x => x.Id).ToList();
                }
                else if (usuario.Rol.Nombre == "Jefe de Abastecimiento")
                {
                    request.CompradorIds = _repositoryUsuario.TableNoTracking.Where(x => x.JefeDirectoId == usuario.Id).Select(x => x.Id).ToList();
                }
                else
                {
                    request.CompradorIds = new List<Guid> { usuario.Id };
                }
            }

            // Obtener datos si no hay periodo
            if (request.Periodo == null || !request.Periodo.Any(p => !string.IsNullOrWhiteSpace(p)))
            {
                return Task.FromResult(new ResponseBase<List<EventosDTO>>(new List<EventosDTO>()));
            }

            IQueryable<OrdenCompra> query = _repositoryOrdenCompra.TableNoTracking.AsQueryable();
            query = query.Where(x => request.CompradorIds.Contains(x.CompradorId));
            //query = query.Where(x => x.Eventos.Any(y => y.Periodo.ToUpper() == request.Periodo.ToUpper()));
            query = query.Where(x => x.Eventos.Any(y => request.Periodo.Contains(y.Periodo)));


            if (request.ProveedorIds != null && request.ProveedorIds.Any())
            {
                query = query.Where(x => request.ProveedorIds.Contains(x.ProveedorId));
            }

            if (!String.IsNullOrEmpty(request.UnidadProductiva))
            {
                query = query.Where(y => y.UnidadProductiva.ToUpper() == request.UnidadProductiva.ToUpper());
            }

            try
            {

                IQueryable<EventosDTO> result = query.SelectMany(oc => oc.Eventos
                    .Where(x => request.Periodo.Contains(x.Periodo))
                    .DefaultIfEmpty(), (oc, ev) => new EventosDTO
                    {
                        Id = ev.Id,
                        Seleccionado = false,
                        Proveedor = oc.Proveedor.RazonSocial,
                        ProveedorId = oc.ProveedorId,
                        CodigoInsumo = oc.CodInsumoServ,
                        DescripcionInsumo = oc.DescInsumoServ,
                        NumOc = oc.NumOC,
                        Comprador = oc.Comprador.GetNombreCompleto(),
                        CompradorId = oc.CompradorId,
                        Periodo = ev.Periodo,
                        UnidadProductiva = oc.UnidadProductiva,
                        FechaCreacion = oc.FechaCreacion,
                        LTM = ev.LeadTimeMaestra,
                        LTC = ev.LeadTimeCalculado,
                        LTR = ev.LeadTimeReal,
                        Dias = ev.Dias,
                        DiasAtraso = ev.DiasAtraso,
                        IndicadorFecha = ev.IndicadorFecha,
                        IndicadorFechaSys = ev.IndicadorFechaSys,
                        CantidadPedida = ev.CantidadSolicitada,
                        CantidadRecibida = ev.CantidadRecibida,
                        IndicadorCalidad = ev.IndicadorCalidad,
                        IndicadorCalidadSys = ev.IndicadorCalidadSys,
                        EstadoLote = ev.CodigoCalidad,
                        NumeroLote = ev.NumLote,
                        IndicadorCantidad = ev.IndicadorCantidad,
                        IndicadorCantidadSys = ev.IndicadorCantidadSys,
                        IndicadorCumplimiento = ev.IndicadorCumplimientoDefinitivo,
                        Estado = ev != null ? ev.Estado : null,
                        OrdenCompraId = oc.Id,
                        CodigoCausal = ev.Causal != null ? ev.Causal.CodigoCausal : null,
                        Comentario = ev.Comentario,
                        CompraDesarrollo = oc.CompraDesarrollo,
                        Consignado = ev != null && ev.Consignado ? "SI" : "NO",
                        TipoOc = oc.TipoOC
                    });

                if (request.IndicadorCalidad != null)
                {
                    result = result.Where(x => x.IndicadorCalidad == request.IndicadorCalidad);
                }

                if (request.IndicadorCantidad != null)
                {
                    result = result.Where(x => x.IndicadorCantidad == request.IndicadorCantidad);
                }

                if (request.IndicadorDesempeno != null)
                {
                    if(request.operador == ">")
                    {
                        result = result.Where(x => x.IndicadorCumplimiento >= request.IndicadorDesempeno && x.TipoOc == request.TipoOc);
                    }
                    else
                    {
                        result = result.Where(x => x.IndicadorCumplimiento < request.IndicadorDesempeno && x.TipoOc == request.TipoOc);
                    }
                    
                }

                if (request.IndicadorFecha != null)
                {
                    result = result.Where(x => x.IndicadorFecha == request.IndicadorFecha && x.TipoOc == request.TipoOc);
                }

                if (!String.IsNullOrEmpty(request.Consignado))
                {
                    result = result.Where(x => x.Consignado == request.Consignado);
                }

                if (request.Oc != null && request.Oc.Any())
                {
                    result = result.Where(x => request.Oc.Contains(x.NumOc));
                }

                if (request.CodigoInsumo != null && request.CodigoInsumo.Any())
                {
                    result = result.Where(x => request.CodigoInsumo.Contains(x.CodigoInsumo));
                }

                return Task.FromResult(new ResponseBase<List<EventosDTO>>(result.ToList()));
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.StackTrace);
                throw new Exception("No se logró obtener los resultados con los parámetros dados.");
            }

        }
    }
}

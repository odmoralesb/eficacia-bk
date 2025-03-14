using AutoMapper;
using AutoMapper.QueryableExtensions;
using MediatR;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using TQ.Proveedores.Application.Configuracion.Queries;
using TQ.Proveedores.Domain.Configuracion;
using TQ.Proveedores.Domain.Evaluaciones;
using TQ.Proveedores.Domain.OrdenesDeCompra;
using TQ.Repository.Abstractions;
using TQ.Util.MediatRUtils;

namespace TQ.Proveedores.Application.OrdenesDeCompra.Queries
{
    public class GetEventosSolicitudCambioEstadoQuery : IRequest<ResponseBase<List<EventosDTO>>>
    {
        public Guid SolicitudCambioEstadoId { get; set; }
    }

    public class GetEventosSolicitudCambioEstadoQueryHandler : IRequestHandler<GetEventosSolicitudCambioEstadoQuery, ResponseBase<List<EventosDTO>>>
    {
        private readonly IRepository<Usuario> _repositoryUsuario;
        private readonly IRepository<OrdenCompra> _repositoryOrdenCompra;
        private readonly IMapper _mapper;
        private readonly ILogger<GetEventosSolicitudCambioEstadoQueryHandler> _logger;
        private readonly ICurrentUserService _currentUserService;
        private readonly IRepository<SolicitudCambioEstado> _repositorySolicitudCambioEstado;

        public GetEventosSolicitudCambioEstadoQueryHandler(IMapper mapper, 
            IRepository<Usuario> repositoryUsuario,
            IRepository<OrdenCompra> repositoryOrdenCompra,
            ILogger<GetEventosSolicitudCambioEstadoQueryHandler> logger,
            ICurrentUserService currentUserService,
            IRepository<SolicitudCambioEstado> repositorySolicitudCambioEstado)
        {
            _repositoryUsuario = repositoryUsuario;
            _repositoryOrdenCompra = repositoryOrdenCompra;
            _logger = logger;
            _mapper = mapper;
            _currentUserService = currentUserService;
            _repositorySolicitudCambioEstado = repositorySolicitudCambioEstado;
        }

        public Task<ResponseBase<List<EventosDTO>>> Handle(GetEventosSolicitudCambioEstadoQuery request, CancellationToken cancellationToken)
        {
            User user = _currentUserService.GetUserAsync().Result;
            UsuarioDTO usuario = _repositoryUsuario.TableNoTracking.ProjectTo<UsuarioDTO>(_mapper.ConfigurationProvider).FirstOrDefault(x => x.NombreUsuario.ToUpper() == user.Name.ToUpper()) ?? throw new Exception("Usuario inválido");
            SolicitudCambioEstado solicitudCambioEstado = _repositorySolicitudCambioEstado.Table.FirstOrDefault(x => x.Id == request.SolicitudCambioEstadoId) ?? throw new Exception("Solicitud de cambio de estado inválida");
            IQueryable<OrdenCompra> query = _repositoryOrdenCompra.TableNoTracking.AsQueryable();
            Guid CompradorId = solicitudCambioEstado.CompradorId;
            query = query.Where(x => x.CompradorId == CompradorId);

            string Periodo = solicitudCambioEstado.Periodo;
            query = query.Where(x => x.Eventos.Any(y => y.Periodo == Periodo));

            Guid ProveedorId = solicitudCambioEstado.ProveedorId;
            query = query.Where(x => x.ProveedorId == ProveedorId);

            try
            {
                IQueryable<EventosDTO> result = query.SelectMany(oc => oc.Eventos.Where(x => x.Periodo == Periodo).DefaultIfEmpty(), (oc, ev) => new EventosDTO
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

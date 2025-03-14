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
using TQ.Proveedores.Domain.Maestras;
using TQ.Proveedores.Domain.OrdenesDeCompra;
using TQ.Repository.Abstractions;
using TQ.Util.MediatRUtils;

namespace TQ.Proveedores.Application.Evaluaciones.Queries
{
    public class GetEvaluacionQuery : IRequest<ResponseBase<List<EvaluacionDTO>>>
    {
        public string UserName { get; set; }
        public List<Guid>? CompradorIds { get; set; }
        public List<Guid>? ProveedorIds { get; set; }
        public string Periodo {  get; set; }
        public string UnidadProductiva { get; set; }
    }

    public class GetEvaluacionQueryHandler : IRequestHandler<GetEvaluacionQuery, ResponseBase<List<EvaluacionDTO>>>
    {
        private readonly IRepository<CalendarioTQ> _repositoryCalendario;
        private readonly IRepository<OrdenCompra> _repositoryOrdenCompra;
        private readonly IRepository<Usuario> _repositoryUsuario;
        private readonly ILogger<GetEvaluacionQueryHandler> _logger;
        private readonly IMapper _mapper;

        public GetEvaluacionQueryHandler(IRepository<CalendarioTQ> repositoryCalendario,
                                         IRepository<OrdenCompra> repositoryOrdenCompra,
                                         IRepository<Usuario> repositoryUsuario,
                                         ILogger<GetEvaluacionQueryHandler> logger,
                                         IMapper mapper)
        {
            _repositoryCalendario = repositoryCalendario;
            _repositoryOrdenCompra = repositoryOrdenCompra;
            _repositoryUsuario = repositoryUsuario;
            _logger = logger;
            _mapper = mapper;
        }

        public Task<ResponseBase<List<EvaluacionDTO>>> Handle(GetEvaluacionQuery request, CancellationToken cancellationToken)
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
            if (String.IsNullOrEmpty(request.Periodo))
            {
                CalendarioTQ periodoTQ = _repositoryCalendario.TableNoTracking.OrderByDescending(x => x.FechaFin).FirstOrDefault(x => x.FechaFin < DateTime.Now);
                if (periodoTQ != null)
                {
                    request.Periodo = periodoTQ.NombrePeriodo;
                }
                else
                {
                    throw new Exception("El periodo ingresado no es válido");
                }
            }

            IQueryable<OrdenCompra> query = _repositoryOrdenCompra.TableNoTracking.AsQueryable();
            query = query.Where(x => request.CompradorIds.Contains(x.CompradorId));
            query = query.Where(x => x.Evaluaciones.Any(y => y.NombrePeriodo.ToUpper() == request.Periodo.ToUpper()));

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
                IQueryable<EvaluacionDTO> result = query.SelectMany(oc => oc.Evaluaciones.Where(x => x.NombrePeriodo.ToUpper() == request.Periodo.ToUpper()).DefaultIfEmpty(), (oc, ev) => new EvaluacionDTO
                {
                    UnidadProductiva = oc.UnidadProductiva,
                    Comprador = oc.Comprador.GetNombreCompleto(),
                    CompradorId = oc.CompradorId,
                    Proveedor = oc.Proveedor.RazonSocial,
                    ProveedorId = oc.ProveedorId,
                    Periodo = ev != null ? ev.NombrePeriodo : null,
                    NumOc = oc.NumOC,
                    IndicadorFecha = ev != null ? ev.IndicadorFecha : 0,
                    IndicadorCantidad = ev != null ? ev.IndicadorCantidad : 0,
                    IndicadorCalidad = ev != null ? ev.IndicadorCalidad : 0,
                    IndicadorCumplimiento = ev != null ? ev.IndicadorCumplimiento : 0,
                    Estado = ev != null ? ev.Estado : null,
                    OrdenCompraId = oc.Id,
                    EvaluacionId = ev != null ? ev.Id : null
                });

                return Task.FromResult(new ResponseBase<List<EvaluacionDTO>>(result.ToList()));
            } catch (Exception ex)
            {
                _logger.LogError(ex.StackTrace);
                throw new Exception("No se logró obtener los resultados con los parámetros dados.");
            }
        }
    }
}

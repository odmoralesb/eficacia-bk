using AutoMapper;
using MediatR;
using Microsoft.Extensions.Logging;
using System;
using System.Threading.Tasks;
using System.Threading;
using TQ.Proveedores.Domain.Maestras;
using TQ.Repository.Abstractions;
using TQ.Util.MediatRUtils;
using System.Linq;
using TQ.Proveedores.Domain.Evaluaciones;
using System.Net;
using System.Text.RegularExpressions;
using TQ.Pagination;

namespace TQ.Proveedores.Application.PlanesDeAccion.Queries
{
    public class GetPlanesAccionesQuery : IRequest<ResponseBase<PagedResult<PlanAccionDTO>>>
    {
        public Guid ProveedorIds { get; set; }
        public int Trimestre { get; set; }
        public int Anio { get; set; }
        public string Term { get; set; } = "";
        public int Page { get; set; } = 1;
        public int PageSize { get; set; } = 10;
        public string UserName { get; set; }
    }

    public class GetEvaluacionQueryHandler : IRequestHandler<GetPlanesAccionesQuery, ResponseBase<PagedResult<PlanAccionDTO>>>
    {
        private readonly IMapper _mapper;
        private readonly ILogger<GetEvaluacionQueryHandler> _logger;
        private readonly IRepository<PlanAccion> _repositoryPlanAccion;
        public GetEvaluacionQueryHandler(
            IRepository<PlanAccion> repositoryPlanAccion,
            IRepository<Proveedor> repositoryProveedor,
            IMapper mapper, 
            ILogger<GetEvaluacionQueryHandler> logger            
            )
        {
            _repositoryPlanAccion = repositoryPlanAccion;
            _mapper = mapper;
            _logger = logger;
            
        }

        public Task<ResponseBase<PagedResult<PlanAccionDTO>>> Handle(GetPlanesAccionesQuery request, CancellationToken cancellationToken)
        {
            try
            {
                var query = _repositoryPlanAccion.TableNoTracking.Where(x => (x.Trimestre == request.Trimestre
                                                                    && x.Anio == request.Anio && x.ProveedorId == request.ProveedorIds && x.CreatedBy != request.UserName) 
                                                                    && (x.CreatedBy.Contains(request.Term)))
                                                                    .OrderBy(x => x.CreateTime.Date)
                                                                    .ThenBy(x => x.CreatedBy)
                                                                    .Select(x => new PlanAccionDTO
                                                                    {
                                                                        Comprador = x.CreatedBy,
                                                                        Accion = x.Accion != null ? x.Accion.ToString() : string.Empty,
                                                                        Comentario = Regex.Replace(WebUtility.HtmlDecode(x.Comentario ?? string.Empty), "<.*?>", string.Empty),
                                                                        FechaCreacion = x.CreateTime
                                                                    });

                return Task.FromResult(
                        new ResponseBase<PagedResult<PlanAccionDTO>>(
                                query.ToList().GetPaged(request.Page, request.PageSize)
                            )
                    );
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.StackTrace);
                throw new Exception("No se logró obtener los resultados con los parámetros dados.");
            }
        }
    }
}

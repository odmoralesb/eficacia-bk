using AutoMapper;
using AutoMapper.QueryableExtensions;
using DocumentFormat.OpenXml.Office2010.Excel;
using MediatR;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using TQ.Pagination;
using TQ.Proveedores.Application.Configuracion.Queries;
using TQ.Proveedores.Domain.Maestras;
using TQ.Repository.Abstractions;
using TQ.Util.MediatRUtils;

namespace TQ.Proveedores.Application.Causales.Queries
{
    public class GetCausalQuery : IRequest<ResponseBase<PagedResult<CausalDTO>>>
    {
        public int Page { get; set; }
        public int PageSize { get; set; }
        public string Term { get; set; }

        public GetCausalQuery()
        {
            Term = "";
            Page = 1;
            PageSize = 10;
        }
    }

    public class GetCausalQueryHandler : IRequestHandler<GetCausalQuery, ResponseBase<PagedResult<CausalDTO>>>
    {
        private readonly IRepository<Causal> _repository;
        private readonly IMapper _mapper;

        public GetCausalQueryHandler(IRepository<Causal> repository, IMapper mapper)
        {
            _mapper = mapper;
            _repository = repository;
        }

        public Task<ResponseBase<PagedResult<CausalDTO>>> Handle(GetCausalQuery request, CancellationToken cancellationToken)
        {
            IQueryable<CausalDTO> causalDTOs = _repository.TableNoTracking.ProjectTo<CausalDTO>(_mapper.ConfigurationProvider).Where(x => x.Nombre.ToUpper().Contains(request.Term.ToUpper()) || x.Descripcion.ToUpper().Contains(request.Term.ToUpper())).Select(x => new CausalDTO
            {
                Id = x.Id,
                CodigoCausal = x.CodigoCausal,
                Nombre = x.Nombre,
                Descripcion = x.Descripcion,
                Activo = x.Activo
            });

            return Task.FromResult(new ResponseBase<PagedResult<CausalDTO>>(causalDTOs.ToList().OrderBy(x => x.CodigoCausal).GetPaged(request.Page, request.PageSize)));
        }
    }
}

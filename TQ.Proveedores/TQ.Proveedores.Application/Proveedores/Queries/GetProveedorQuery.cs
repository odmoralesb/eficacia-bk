using AutoMapper;
using AutoMapper.QueryableExtensions;
using MediatR;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using TQ.Pagination;
using TQ.Proveedores.Domain.Maestras;
using TQ.Repository.Abstractions;
using TQ.Util.MediatRUtils;

namespace TQ.Proveedores.Application.Proveedores.Queries
{
    public class GetProveedorQuery : IRequest<ResponseBase<PagedResult<ProveedorDTO>>>
    {
        public GetProveedorQuery()
        {
            Term = "";
            Page = 1;
            PageSize = 10;
        }

        public string Term { get; set; }
        public int Page { get; set; }
        public int PageSize { get; set; }
    }

    public class GetProveedorQueryHandler : IRequestHandler<GetProveedorQuery, ResponseBase<PagedResult<ProveedorDTO>>>
    {
        private readonly IRepository<Proveedor> _repository;
        private readonly IMapper _mapper;

        public GetProveedorQueryHandler(IRepository<Proveedor> repository, IMapper mapper)
        {
            _repository = repository;
            _mapper = mapper;
        }
        public Task<ResponseBase<PagedResult<ProveedorDTO>>> Handle(GetProveedorQuery request, CancellationToken cancellationToken)
        {
            var dto = _repository.TableNoTracking.ProjectTo<ProveedorDTO>(_mapper.ConfigurationProvider)
                                                 .Where(x => 
                                                            (x.RazonSocial.ToUpper().Contains(request.Term.ToUpper()))
                                                            || (x.Nit.ToUpper().Contains(request.Term.ToUpper()))
                                                        );
            return Task.FromResult(
                new ResponseBase<PagedResult<ProveedorDTO>>(
                    dto.ToList()
                        .OrderBy(x => x.RazonSocial)
                        .GetPaged(request.Page, request.PageSize)
                    )
                );

        }
    }
}

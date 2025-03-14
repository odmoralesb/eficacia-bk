using AutoMapper;
using MediatR;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using TQ.Proveedores.Domain.Configuracion;
using TQ.Repository.Abstractions;
using TQ.Util.MediatRUtils;

namespace TQ.Proveedores.Application.Usuarios.Queries
{
    public class GetRolesQuery : IRequest<ResponseBase<RolDTO[]>>
    {
    }

    public class RolDTO
    {
        public string Id { get; set; }
        public string Nombre { get; set; }
    }

    public class GetRolesQueryHandler : IRequestHandler<GetRolesQuery, ResponseBase<RolDTO[]>>
    {
        private readonly IRepository<Rol> _repository;

        public GetRolesQueryHandler(IRepository<Rol> repository)
        {
            _repository = repository;
        }

        public Task<ResponseBase<RolDTO[]>> Handle(GetRolesQuery request, CancellationToken cancellationToken)
        {
            var roles = _repository.TableNoTracking
                .Select(x => new RolDTO
                {
                    Id = x.Id.ToString(),
                    Nombre = x.Nombre
                })
                .OrderBy(x => x.Nombre)
                .ToArray();

            return Task.FromResult(new ResponseBase<RolDTO[]>(roles));
        }
    }
}
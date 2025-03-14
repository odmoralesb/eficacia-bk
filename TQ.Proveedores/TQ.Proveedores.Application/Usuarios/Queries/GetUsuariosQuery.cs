using AutoMapper;
using MediatR;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using TQ.Pagination;
using TQ.Proveedores.Domain.Configuracion;
using TQ.Repository.Abstractions;
using TQ.Util.MediatRUtils;

namespace TQ.Proveedores.Application.Usuarios.Queries
{
    public class GetUsuariosQuery : IRequest<ResponseBase<PagedResult<UsuarioDTO>>>
    {
        public int Page { get; set; }
        public int PageSize { get; set; }
        public string Term { get; set; }

        public GetUsuariosQuery()
        {
            Term = "";
            Page = 1;
            PageSize = 10;
        }
    }

    public class GetUsuariosQueryHandler : IRequestHandler<GetUsuariosQuery, ResponseBase<PagedResult<UsuarioDTO>>>
    {
        private readonly IRepository<Usuario> _repository;
        private readonly IMapper _mapper;

        public GetUsuariosQueryHandler(IRepository<Usuario> repository, IMapper mapper)
        {
            _mapper = mapper;
            _repository = repository;
        }

        public Task<ResponseBase<PagedResult<UsuarioDTO>>> Handle(GetUsuariosQuery request, CancellationToken cancellationToken)
        {
            IQueryable<UsuarioDTO> usuarios = _repository.TableNoTracking
                .Select(x => new UsuarioDTO
                {
                    Id = x.Id.ToString(),
                    NombreUsuario = x.NombreUsuario,
                    Nombre = x.Nombre,
                    Apellido = x.Apellido,
                    CorreoElectronico = x.CorreoElectronico,
                    RolId = x.RolId.ToString(),
                    JefeDirectoId = x.JefeDirectoId.HasValue ? x.JefeDirectoId.Value.ToString() : null,
                    // Concatenar directamente en vez de usar el método
                    NombreCompleto = x.Nombre + " " + x.Apellido,
                    Rol = new { id = x.RolId.ToString(), nombre = x.Rol.Nombre },
                    JefeDirecto = x.JefeDirecto == null ? null : new
                    {
                        id = x.JefeDirectoId.ToString(),
                        // Concatenar directamente también para el jefe
                        nombreCompleto = x.JefeDirecto.Nombre + " " + x.JefeDirecto.Apellido
                    }
                });

            if (!string.IsNullOrEmpty(request.Term))
            {
                string termLower = request.Term.ToLower();
                usuarios = usuarios.Where(x =>
                    x.NombreUsuario.ToLower().Contains(termLower) ||
                    // Usar la concatenación directa también en el filtro
                    (x.Nombre + " " + x.Apellido).ToLower().Contains(termLower) ||
                    x.CorreoElectronico.ToLower().Contains(termLower)
                );
            }

            return Task.FromResult(new ResponseBase<PagedResult<UsuarioDTO>>(
                usuarios.OrderBy(x => x.Nombre + " " + x.Apellido)
                    .GetPaged(request.Page, request.PageSize)
            ));
        }
    }
}
using AutoMapper;
using AutoMapper.QueryableExtensions;
using MediatR;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using TQ.Proveedores.Domain.Configuracion;
using TQ.Proveedores.Domain.OrdenesDeCompra;
using TQ.Repository.Abstractions;
using TQ.Util.MediatRUtils;

namespace TQ.Proveedores.Application.Configuracion.Queries
{
    public class GetCompradoresQuery : IRequest<ResponseBase<List<UsuarioDTO>>>
    {
    }

    public class GetCompradoresQueryHandler : IRequestHandler<GetCompradoresQuery, ResponseBase<List<UsuarioDTO>>>
    {
        private readonly IRepository<Usuario> _repositoryUsuario;
        private readonly IMapper _mapper;

        public GetCompradoresQueryHandler(IRepository<Usuario> repositoryUsuario,
                                          IMapper mapper)
        {
            _repositoryUsuario = repositoryUsuario;
            _mapper = mapper;
        }
        public Task<ResponseBase<List<UsuarioDTO>>> Handle(GetCompradoresQuery request, CancellationToken cancellationToken)
        {
            List<UsuarioDTO> compradores = _repositoryUsuario.TableNoTracking.ProjectTo<UsuarioDTO>(_mapper.ConfigurationProvider)
                                                                             .Where(x => (x.JefeDirectoId != null) && (x.Rol.Nombre.ToUpper() == "Comprador"))
                                                                             .OrderBy(x => x.Nombre)
                                                                             .ToList();
            return Task.FromResult(new ResponseBase<List<UsuarioDTO>>(compradores));
        }
    }
}

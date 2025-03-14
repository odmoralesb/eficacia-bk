using AutoMapper;
using MediatR;
using System;
using System.Data;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using TQ.Proveedores.Domain.Configuracion;
using TQ.Repository.Abstractions;
using TQ.Util.MediatRUtils;
using TQ.Utils.AutoMapperUtils;

namespace TQ.Proveedores.Application.Usuarios.Commands.Create
{
    public class CreateUsuarioCommand : IRequest<ResponseBase<Guid>>, IMapFrom<Usuario>
    {
        public string NombreUsuario { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string CorreoElectronico { get; set; }
        public Guid RolId { get; set; }
        public Guid? JefeDirectoId { get; set; }
    }

    public class CreateUsuarioCommandHandler : IRequestHandler<CreateUsuarioCommand, ResponseBase<Guid>>
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IRepository<Usuario> _repository;
        private readonly IMapper _mapper;

        public CreateUsuarioCommandHandler(IUnitOfWork unitOfWork, IRepository<Usuario> repository, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _repository = repository;
            _mapper = mapper;
        }

        public async Task<ResponseBase<Guid>> Handle(CreateUsuarioCommand request, CancellationToken cancellationToken)
        {
            // Validar que no exista otro usuario con el mismo nombre de usuario
            bool existeUsuario = _repository.Count(x => x.NombreUsuario.ToUpper() == request.NombreUsuario.ToUpper()) > 0;
            if (existeUsuario)
            {
                throw new DataException($"Ya existe un usuario con el nombre de usuario {request.NombreUsuario}");
            }

            // Validar que no exista otro usuario con el mismo correo
            existeUsuario = _repository.Count(x => x.CorreoElectronico.ToUpper() == request.CorreoElectronico.ToUpper()) > 0;
            if (existeUsuario)
            {
                throw new DataException($"Ya existe un usuario con el correo electrónico {request.CorreoElectronico}");
            }

            var usuario = _mapper.Map<Usuario>(request);
            _repository.Insert(usuario);
            await _unitOfWork.CommitAsync(cancellationToken);

            return new ResponseBase<Guid>(usuario.Id);
        }
    }
}
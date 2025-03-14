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

namespace TQ.Proveedores.Application.Usuarios.Commands.Update
{
    public class UpdateUsuarioCommand : IRequest<ResponseBase<Guid>>
    {
        public Guid Id { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string CorreoElectronico { get; set; }
        public Guid RolId { get; set; }
        public Guid? JefeDirectoId { get; set; }
    }

    public class UpdateUsuarioCommandHandler : IRequestHandler<UpdateUsuarioCommand, ResponseBase<Guid>>
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IRepository<Usuario> _repository;

        public UpdateUsuarioCommandHandler(IUnitOfWork unitOfWork, IRepository<Usuario> repository)
        {
            _unitOfWork = unitOfWork;
            _repository = repository;
        }

        public async Task<ResponseBase<Guid>> Handle(UpdateUsuarioCommand request, CancellationToken cancellationToken)
        {
            var usuario = _repository.Table.FirstOrDefault(x => x.Id == request.Id);
            if (usuario == null)
            {
                throw new DataException($"No existe el usuario con Id {request.Id}");
            }

            // Validar que no exista otro usuario con el mismo correo
            bool existeUsuario = _repository.Count(x => 
                x.Id != request.Id && 
                x.CorreoElectronico.ToUpper() == request.CorreoElectronico.ToUpper()
            ) > 0;

            if (existeUsuario)
            {
                throw new DataException($"Ya existe un usuario con el correo electrónico {request.CorreoElectronico}");
            }

            // Validar que el JefeDirectoId no sea el mismo usuario
            if (request.JefeDirectoId == request.Id)
            {
                throw new DataException("Un usuario no puede ser su propio jefe directo");
            }

            // Actualizar propiedades
            usuario.Nombre = request.Nombre;
            usuario.Apellido = request.Apellido;
            usuario.CorreoElectronico = request.CorreoElectronico;
            usuario.RolId = request.RolId;
            usuario.JefeDirectoId = request.JefeDirectoId;

            _repository.Update(usuario);
            await _unitOfWork.CommitAsync(cancellationToken);

            return new ResponseBase<Guid>(usuario.Id);
        }
    }
}
using MediatR;
using System;
using System.Data;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using TQ.Proveedores.Domain.Configuracion;
using TQ.Repository.Abstractions;
using TQ.Util.MediatRUtils;

namespace TQ.Proveedores.Application.Usuarios.Commands.Delete
{
    public class DeleteUsuarioCommand : IRequest<ResponseBase<Guid>>
    {
        public Guid Id { get; set; }
    }

    public class DeleteUsuarioCommandHandler : IRequestHandler<DeleteUsuarioCommand, ResponseBase<Guid>>
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IRepository<Usuario> _repository;

        public DeleteUsuarioCommandHandler(IUnitOfWork unitOfWork, IRepository<Usuario> repository)
        {
            _unitOfWork = unitOfWork;
            _repository = repository;
        }

        public async Task<ResponseBase<Guid>> Handle(DeleteUsuarioCommand request, CancellationToken cancellationToken)
        {
            var usuario = _repository.Table.FirstOrDefault(x => x.Id == request.Id);
            if (usuario == null)
            {
                throw new DataException($"No existe el usuario con Id {request.Id}");
            }

            // Validar si hay usuarios que tienen a este usuario como jefe directo
            bool tieneSubordinados = _repository.Count(x => x.JefeDirectoId == request.Id) > 0;
            if (tieneSubordinados)
            {
                throw new DataException("No se puede eliminar el usuario porque tiene subordinados asignados");
            }

            _repository.Delete(usuario);
            await _unitOfWork.CommitAsync(cancellationToken);

            return new ResponseBase<Guid>(usuario.Id);
        }
    }
}
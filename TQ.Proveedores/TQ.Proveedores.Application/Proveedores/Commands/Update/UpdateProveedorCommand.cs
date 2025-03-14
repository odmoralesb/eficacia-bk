using MediatR;
using System;
using System.Data;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using TQ.Proveedores.Domain.Maestras;
using TQ.Repository.Abstractions;
using TQ.Util.MediatRUtils;
using TQ.Utils.AutoMapperUtils;

namespace TQ.Proveedores.Application.Proveedores.Commands
{
    public class UpdateProveedorCommand : IRequest<ResponseBase<Guid>>, IMapFrom<Proveedor>
    {
        public Guid Id { get; set; }
        public string[] listaCorreoElectronico { get; set; }
    }

    public class UpdateProveedorCommandHandler : IRequestHandler<UpdateProveedorCommand, ResponseBase<Guid>>
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IRepository<Proveedor> _repository;

        public UpdateProveedorCommandHandler(IUnitOfWork unitOfWork, IRepository<Proveedor> repository)
        {
            _unitOfWork = unitOfWork;
            _repository = repository;
        }
        public async Task<ResponseBase<Guid>> Handle(UpdateProveedorCommand request, CancellationToken cancellationToken)
        {
            Proveedor proveedor = _repository.GetById(request.Id);
            if (proveedor == null)
            {
                throw new DataException("El proveedor que intenta actualizar no existe.");
            }

            request.listaCorreoElectronico = request.listaCorreoElectronico.Select(x => x.ToLowerInvariant()).ToArray();
            request.listaCorreoElectronico = request.listaCorreoElectronico.Distinct().ToArray();

            proveedor.ListaCorreoElectronico = string.Join(';', request.listaCorreoElectronico);

            _repository.Update(proveedor);
            await _unitOfWork.CommitAsync(cancellationToken);

            return new ResponseBase<Guid>(proveedor.Id);
        }
    }
}

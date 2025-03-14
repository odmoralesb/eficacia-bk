using MediatR;
using System;
using System.Data;
using System.Threading;
using System.Threading.Tasks;
using TQ.Proveedores.Application.Exceptions;
using TQ.Proveedores.Domain.Maestras;
using TQ.Repository.Abstractions;
using TQ.Util.MediatRUtils;
using TQ.Utils.AutoMapperUtils;

namespace TQ.Proveedores.Application.Causales.Commands
{
    public class UpdateCausalCommand : IRequest<ResponseBase<Guid>>, IMapFrom<Causal>
    {
        public Guid Id { get; set; }
        public int? CodigoCausal { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public bool Activo { get; set; } = true;
    }

    public class UpdateCausalCommandHandler : IRequestHandler<UpdateCausalCommand, ResponseBase<Guid>>
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IRepository<Causal> _repository;

        public UpdateCausalCommandHandler(IUnitOfWork unitOfWork, IRepository<Causal> repository)
        {
            _unitOfWork = unitOfWork;
            _repository = repository;
        }

        public async Task<ResponseBase<Guid>> Handle(UpdateCausalCommand request, CancellationToken cancellationToken)
        {
            bool existCausal = _repository.Count(x => x.CodigoCausal == request.CodigoCausal && x.Id != request.Id) > 0;
            if (existCausal)
            {
                throw new DataException($"La causal con código {request.CodigoCausal} ya se encuentra creada");
            }

            Causal causal = _repository.GetById(request.Id);
            if (causal == null)
            {
                throw new NotFoundException("La causal que intenta actualizar no existe", request.Id);
            }
            else
            {
                causal.CodigoCausal = (int)request.CodigoCausal;
                causal.Nombre = request.Nombre;
                causal.Descripcion = request.Descripcion;
                causal.Activo = request.Activo;
                _repository.Update(causal);

                await _unitOfWork.CommitAsync(cancellationToken);
            }

            return new ResponseBase<Guid>(request.Id);
        }
    }
}

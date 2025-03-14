using AutoMapper;
using MediatR;
using System;
using System.Data;
using System.Threading;
using System.Threading.Tasks;
using TQ.Proveedores.Domain.Maestras;
using TQ.Repository.Abstractions;
using TQ.Util.MediatRUtils;
using TQ.Utils.AutoMapperUtils;

namespace TQ.Proveedores.Application.Causales.Commands
{
    public class CreateCausalCommand:IRequest<ResponseBase<Guid>>, IMapFrom<Causal>
    {
        public int? CodigoCausal { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public bool Activo { get; set; } = true;
    }

    public class CreateCausalCommandHandler : IRequestHandler<CreateCausalCommand, ResponseBase<Guid>>
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IRepository<Causal> _repository;
        private readonly IMapper _mapper;

        public CreateCausalCommandHandler(IUnitOfWork unitOfWork, IRepository<Causal> repository, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _repository = repository;
            _mapper = mapper;
        }

        public async Task<ResponseBase<Guid>> Handle(CreateCausalCommand request, CancellationToken cancellationToken)
        {
            bool existCausal = _repository.Count(x => x.CodigoCausal == request.CodigoCausal) > 0;
            if (existCausal)
            {
                throw new DataException($"La causal con código {request.CodigoCausal} ya se encuentra creada");
            }
            Causal causal = _mapper.Map<Causal>(request);
            _repository.Insert(causal);
            await _unitOfWork.CommitAsync(cancellationToken);

            return new ResponseBase<Guid>(causal.Id);
        }
    }
}

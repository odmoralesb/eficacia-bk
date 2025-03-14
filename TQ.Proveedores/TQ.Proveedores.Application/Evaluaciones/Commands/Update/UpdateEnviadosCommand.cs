using MediatR;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using TQ.Proveedores.Application.ServiceAgents.Interfaces;
using TQ.Proveedores.Domain.Configuracion;
using TQ.Proveedores.Domain.Enums;
using TQ.Proveedores.Domain.Evaluaciones;
using TQ.Proveedores.Domain.OrdenesDeCompra;
using TQ.Repository.Abstractions;
using TQ.Util.MediatRUtils;

namespace TQ.Proveedores.Application.Evaluaciones.Commands
{
    public class UpdateEnviadosCommand : IRequest<ResponseBase<bool>>
    {
        public List<Guid> EvaluacionesId { get; set; }
    }

    public class UpdateEnviadosCommandHandler : IRequestHandler<UpdateEnviadosCommand, ResponseBase<bool>>
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IRepository<Evaluacion> _evaluacionRepository;
        private readonly IRepository<Evento> _repositoryEvento;

        public UpdateEnviadosCommandHandler(IUnitOfWork unitOfWork, IRepository<Evaluacion> evaluacionRepository, IRepository<Evento> repositoryEvento)
        {
            _unitOfWork = unitOfWork;
            _evaluacionRepository = evaluacionRepository;
            _repositoryEvento = repositoryEvento;
        }

        public async Task<ResponseBase<bool>> Handle(UpdateEnviadosCommand request, CancellationToken cancellationToken)
        {
            var evaluaciones = _evaluacionRepository.GetMany(x => request.EvaluacionesId.Contains(x.Id) && x.Estado != (int)EstadoEvaluacion.PENDIENTE_APROBACION).ToList();

            var numOrdenesCompras = _evaluacionRepository.Table.Where(x => request.EvaluacionesId.Contains(x.Id) && x.Estado != (int)EstadoEvaluacion.PENDIENTE_APROBACION)
                                                                  .SelectMany(e => e.OrdenesCompra)
                                                                  .Select(e => e.NumOC)
                                                                  .Distinct();

            var eventos = _repositoryEvento.GetMany(x => numOrdenesCompras.Contains(x.NumOC) && x.Estado != (int)EstadoEvaluacion.PENDIENTE_APROBACION).ToList();

            int i = 0;
            int batchSize = 100;

            foreach (var ev in eventos)
            {
                ev.Estado = (int)EstadoEvaluacion.ENVIADO;
                _repositoryEvento.Update(ev);

                if ((++i % batchSize) == 0)
                {
                    await _unitOfWork.CommitAsync(cancellationToken);
                }
            }

            if (i % batchSize != 0)
            {
                await _unitOfWork.CommitAsync(cancellationToken);
            }

            i = 0;
            batchSize = 100;

            foreach (var eva in evaluaciones)
            {
                eva.Estado = (int)EstadoEvaluacion.ENVIADO;
                _evaluacionRepository.Update(eva);

                if ((++i % batchSize) == 0)
                {
                    await _unitOfWork.CommitAsync(cancellationToken);
                }
            }

            if (i % batchSize != 0)
            {
                await _unitOfWork.CommitAsync(cancellationToken);
            }

            return await Task.FromResult(new ResponseBase<bool>(true));
        }
    }
}

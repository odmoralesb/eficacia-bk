using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using TQ.Proveedores.Domain.Enums;
using TQ.Proveedores.Domain.Evaluaciones;
using TQ.Proveedores.Domain.OrdenesDeCompra;
using TQ.Repository.Abstractions;
using TQ.Util.MediatRUtils;

namespace TQ.Proveedores.Application.Evaluaciones.Commands
{
    public class UpdateEstadoCommand : IRequest<ResponseBase<bool>>
    {
        public Guid? CompradorId { get; set; }
        public Guid? ProveedorId { get; set; }
        public string? Periodo { get; set; }
    }

    public class UpdateEstadoCommandHandler : IRequestHandler<UpdateEstadoCommand, ResponseBase<bool>>
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IRepository<Evaluacion> _repositoryEvaluacion;
        private readonly IRepository<Evento> _repositoryEvento;

        public UpdateEstadoCommandHandler(IUnitOfWork unitOfWork, IRepository<Evaluacion> repositoryEvaluacion, IRepository<Evento> repositoryEvento)
        {
            _unitOfWork = unitOfWork;
            _repositoryEvaluacion = repositoryEvaluacion;
            _repositoryEvento = repositoryEvento;
        }

        public async Task<ResponseBase<bool>> Handle(UpdateEstadoCommand request, CancellationToken cancellationToken)
        {
            List<Evaluacion> evaluaciones = _repositoryEvaluacion.GetMany(x => x.OrdenesCompra.Any(y => (y.ProveedorId == request.ProveedorId) && (!request.CompradorId.HasValue || y.CompradorId == request.CompradorId)) && (x.NombrePeriodo == request.Periodo) && (x.Estado == (int)EstadoEvaluacion.ENVIADO)).ToList();

            if (evaluaciones.Count == 0)
            {
                IDictionary<string, string[]> errors = new Dictionary<string, string[]>
                {
                    { "evaluaciones", new string[] { "No se encontraron evaluaciones enviadas con la información suministrada" } },
                };
                return await Task.FromResult(new ResponseBase<bool>(errors: errors));
            }

            int i = 0;
            int batchSize = 100;
            List<string> numeroOC = new List<string>();
            foreach (var eva in evaluaciones)
            {
                var numOrdenesCompras = _repositoryEvaluacion.Table.Where(x => x.Id == eva.Id && x.Estado == (int)EstadoEvaluacion.ENVIADO).SelectMany(e => e.OrdenesCompra).Select(e => e.NumOC).Distinct().ToList();
                numeroOC.AddRange(numOrdenesCompras);
                eva.Estado = (int)EstadoEvaluacion.PENDIENTE_APROBACION;
                _repositoryEvaluacion.Update(eva);
                if ((++i % batchSize) == 0)
                {
                    await _unitOfWork.CommitAsync(cancellationToken);
                }
            }

            if (i % batchSize != 0)
            {
                await _unitOfWork.CommitAsync(cancellationToken);
            }


            if (numeroOC.Count() != 0)
            {
                var eventos = _repositoryEvento.GetMany(x => numeroOC.Contains(x.NumOC) && x.Estado == (int)EstadoEvaluacion.ENVIADO).ToList();
                i = 0;
                batchSize = 100;
                foreach (var ev in eventos)
                {
                    ev.Estado = (int)EstadoEvaluacion.PENDIENTE_APROBACION;
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
            }

            return await Task.FromResult(new ResponseBase<bool>(true));
        }
    }
}

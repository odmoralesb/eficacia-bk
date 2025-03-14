using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using TQ.Proveedores.Application.ServiceAgents.Interfaces;
using TQ.Proveedores.Domain.Configuracion;
using TQ.Proveedores.Domain.OrdenesDeCompra;
using TQ.Repository.Abstractions;
using TQ.Util.MediatRUtils;

namespace TQ.Proveedores.Application.OrdenesDeCompra.Commands
{
    public class UpdateCompradorOcCommand : IRequest<ResponseBase<bool>>
    {
        public Guid? CompradorRetirado { get; set; }
        public Guid? CompradorNuevo { get; set; }
        public string Periodo { get; set; }
    }

    public class UpdateCompradorOcCommandHandler : IRequestHandler<UpdateCompradorOcCommand, ResponseBase<bool>>
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IRepository<OrdenCompra> _repositoryOC;
        private readonly IRepository<Usuario> _repositoryUsuario;
        private readonly IRepository<Evento> _repositoryEvento;
        private readonly IEmailSender _emailSender;

        public UpdateCompradorOcCommandHandler(IUnitOfWork unitOfWork, IRepository<OrdenCompra> repositoryOC, IRepository<Usuario> repositoryUsuario, IEmailSender emailSender, IRepository<Evento> repositoryEvento)
        {
            _unitOfWork = unitOfWork;
            _repositoryOC = repositoryOC;
            _repositoryUsuario = repositoryUsuario;
            _emailSender = emailSender;
            _repositoryEvento = repositoryEvento;
        }
        public async Task<ResponseBase<bool>> Handle(UpdateCompradorOcCommand request, CancellationToken cancellationToken)
        {
            List<Guid> ordenesCompraCompradorRetirado_periodo = _repositoryEvento.GetMany(x => x.Periodo == request.Periodo && x.OrdenCompra.CompradorId == request.CompradorRetirado).Select(x => x.OrdenCompraId).Distinct().ToList();
            if (ordenesCompraCompradorRetirado_periodo.Count == 0)
            {
                throw new Exception("No hay órdenes de compra asociadas a ese comprador");
            }

            List<OrdenCompra> ocs = _repositoryOC.GetMany(x => ordenesCompraCompradorRetirado_periodo.Contains(x.Id)).ToList();
            if (ocs.Count == 0)
            {
                throw new Exception("No hay órdenes de compra asociadas a ese comprador");
            }

            var nuevoComprador = _repositoryUsuario.GetById(request.CompradorNuevo);
            if (nuevoComprador == null)
            {
                throw new Exception("No existe el comprador con el que reasignar las órdenes de compra.");
            }

            int i = 0;
            int batchSize = 100;

            foreach (var o in ocs)
            {
                o.CompradorId = (Guid)request.CompradorNuevo;
                _repositoryOC.Update(o);

                if ((++i % batchSize) == 0)
                {
                    await _unitOfWork.CommitAsync(cancellationToken);
                }
            }

            if (i % batchSize != 0)
            {
                await _unitOfWork.CommitAsync(cancellationToken);
            }
            string listadoOCs = string.Join(',', ocs.Select(x => x.NumOC).Distinct().ToArray());
            await _emailSender.EnviarCorreoReasignacionAsync(
                nuevoComprador.GetNombreCompleto(),
                listadoOCs,
                nuevoComprador.CorreoElectronico,
                Array.Empty<string>(),
                cancellationToken);

            return await Task.FromResult(new ResponseBase<bool>(true));
        }
    }
}

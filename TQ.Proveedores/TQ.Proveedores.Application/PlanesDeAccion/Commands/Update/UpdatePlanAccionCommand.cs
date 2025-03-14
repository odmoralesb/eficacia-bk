using AutoMapper;
using MediatR;
using System;
using System.Data;
using System.Threading;
using System.Threading.Tasks;
using TQ.Proveedores.Domain.Configuracion;
using TQ.Proveedores.Domain.Evaluaciones;
using TQ.Proveedores.Domain.Maestras;
using TQ.Repository.Abstractions;
using TQ.Util.MediatRUtils;
using TQ.Utils.AutoMapperUtils;

namespace TQ.Proveedores.Application.PlanesDeAccion.Commands
{
    public class UpdatePlanAccionCommand : IRequest<ResponseBase<Guid>>, IMapFrom<PlanAccion>
    {
        public string? NombreUsuario { get; set; }
        public Guid? ProveedorId { get; set; }
        public int? Trimestre { get; set; }
        public int? Anio { get; set; }
        public string? Comentario { get; set; }
        public string? Accion { get; set; }
    }

    public class UpdatePlanAccionCommandHandler : IRequestHandler<UpdatePlanAccionCommand, ResponseBase<Guid>>
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IRepository<Usuario> _usuarioRepository;
        private readonly IRepository<Proveedor> _proveedorRepository;
        private readonly IRepository<PlanAccion> _planAccionRepository;

        public UpdatePlanAccionCommandHandler(IUnitOfWork unitOfWork,
                                              IRepository<Usuario> usuarioRepository,
                                              IRepository<Proveedor> proveedorRepository,
                                              IRepository<PlanAccion> planAccionRepository)
        {
            _unitOfWork = unitOfWork;
            _usuarioRepository = usuarioRepository;
            _proveedorRepository = proveedorRepository;
            _planAccionRepository = planAccionRepository;
        }

        public async Task<ResponseBase<Guid>> Handle(UpdatePlanAccionCommand request, CancellationToken cancellationToken)
        {
            Usuario comprador = _usuarioRepository.Get(x => x.NombreUsuario.ToUpper() == request.NombreUsuario.ToUpper());
            if (comprador == null)
            {
                throw new Exception("No se encuentra el responsable de seguimiento.");
            }

            Proveedor proveedor = _proveedorRepository.GetById(request.ProveedorId);
            if (proveedor == null)
            {
                throw new Exception("El proveedor no fue encontrado.");
            }

            var planAccion = _planAccionRepository.Get(x => (x.CompradorId == comprador.Id)
                                                              && (x.ProveedorId == proveedor.Id)
                                                              && (x.Trimestre == request.Trimestre)
                                                              && (x.Anio == request.Anio));
            if (planAccion == null)
            {
                throw new DataException($"El plan de acción ya se encuentra creado.");
            }

            planAccion.CompromisoCorporativoId = "1";
            planAccion.Comprador = comprador;
            planAccion.Proveedor = proveedor;
            planAccion.Comentario = request.Comentario;
            planAccion.Accion = request.Accion;

            _planAccionRepository.Update(planAccion);
            await _unitOfWork.CommitAsync(cancellationToken);

            return new ResponseBase<Guid>(planAccion.Id);
        }
    }
}

using AutoMapper;
using MediatR;
using System;
using System.Data;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using TQ.Proveedores.Domain.Configuracion;
using TQ.Proveedores.Domain.Evaluaciones;
using TQ.Proveedores.Domain.OrdenesDeCompra;
using TQ.Repository.Abstractions;
using TQ.Util.MediatRUtils;
using TQ.Utils.AutoMapperUtils;

namespace TQ.Proveedores.Application.SolicitudesCambioEstado.Commands.Close
{
    public class ResendReportSolicitudCambioEstadoCommand:IRequest<ResponseBase<Guid>>, IMapFrom<SolicitudCambioEstado>
    {
        public Guid Id { get; set; }
    }

    public class ResendReportSolicitudCambioEstadoCommandHandler : IRequestHandler<ResendReportSolicitudCambioEstadoCommand, ResponseBase<Guid>>
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IRepository<SolicitudCambioEstado> _repository;
        private readonly IRepository<Usuario> _userRepository;
        private readonly IRepository<Rol> _rolRepository;
        private readonly IMapper _mapper;
        private readonly ICurrentUserService _currentUserService;
        private readonly IRepository<Evaluacion> _repositoryEvaluacion;
        private readonly IRepository<Evento> _repositoryEvento;

        public ResendReportSolicitudCambioEstadoCommandHandler(IUnitOfWork unitOfWork, IRepository<SolicitudCambioEstado> repository, IMapper mapper, ICurrentUserService currentUserService, IRepository<Usuario> userRepository, IRepository<Rol> rolRepository, IRepository<Evaluacion> repositoryEvaluacion, IRepository<Evento> repositoryEvento)
        {
            _unitOfWork = unitOfWork;
            _repository = repository;
            _mapper = mapper;
            _currentUserService = currentUserService;
            _userRepository = userRepository;
            _rolRepository = rolRepository;
            _repositoryEvaluacion = repositoryEvaluacion;
            _repositoryEvento = repositoryEvento;
        }

        public async Task<ResponseBase<Guid>> Handle(ResendReportSolicitudCambioEstadoCommand request, CancellationToken cancellationToken)
        {
            User comprador = await _currentUserService.GetUserAsync();
            string compradorUserName = comprador.Name.ToUpper();
            Usuario usuarioComprador = _userRepository.TableNoTracking.FirstOrDefault(x => x.NombreUsuario.ToUpper() == compradorUserName);
            Guid RolAdministradorId = _rolRepository.TableNoTracking.First(x => x.Nombre == "Administrador").Id;

            SolicitudCambioEstado solicitud = _repository.Table.FirstOrDefault(x => x.Id == request.Id);
            if (solicitud == null)
            {
                throw new DataException($"No existe la solicitud de cambio de estado con Id {request.Id}");
            }
            if (solicitud.Estado != "Cerrada")
            {
                throw new DataException($"La solicitud de cambio de estado con Id {request.Id} no se encuentra en estado Cerrada");
            }
            if (!(usuarioComprador.RolId == RolAdministradorId))
            {
                throw new DataException($"El usuario no tiene permisos para reenviar el reporte actualizado de la solicitud de cambio de estado con Id {request.Id}");
            }

            solicitud.Estado = "Reenviada";
            _repository.Update(solicitud);
            await _unitOfWork.CommitAsync(cancellationToken);

            return new ResponseBase<Guid>(solicitud.Id);
        }
    }
}
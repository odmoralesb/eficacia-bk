using AutoMapper;
using MediatR;
using Microsoft.Extensions.Logging;
using System;
using System.Data;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using TQ.Proveedores.Application.ServiceAgents.Interfaces;
using TQ.Proveedores.Domain.Configuracion;
using TQ.Proveedores.Domain.Evaluaciones;
using TQ.Proveedores.Domain.Maestras;
using TQ.Repository.Abstractions;
using TQ.Util.MediatRUtils;
using TQ.Utils.AutoMapperUtils;

namespace TQ.Proveedores.Application.SolicitudesCambioEstado.Commands.Create
{
    public class CreateSolicitudCambioEstadoCommand:IRequest<ResponseBase<Guid>>, IMapFrom<SolicitudCambioEstado>
    {
        public Guid ProveedorId { get; set; }
        public string Periodo { get; set; }
        public string Observaciones { get; set; }
    }

    public class CreateSolicitudCambioEstadoCommandHandler : IRequestHandler<CreateSolicitudCambioEstadoCommand, ResponseBase<Guid>>
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IRepository<SolicitudCambioEstado> _repository;
        private readonly IRepository<Usuario> _userRepository;
        private readonly IRepository<Proveedor> _proveedorRepository;
        private readonly IMapper _mapper;
        private readonly ICurrentUserService _currentUserService;
        private readonly IEmailSender _emailSender;
        private readonly ILogger<CreateSolicitudCambioEstadoCommand> _logger;

        public CreateSolicitudCambioEstadoCommandHandler(IUnitOfWork unitOfWork, IRepository<SolicitudCambioEstado> repository, IMapper mapper, ICurrentUserService currentUserService, IRepository<Usuario> userRepository, IEmailSender emailSender, IRepository<Proveedor> proveedorRepository, ILogger<CreateSolicitudCambioEstadoCommand> logger)
        {
            _unitOfWork = unitOfWork;
            _repository = repository;
            _mapper = mapper;
            _currentUserService = currentUserService;
            _userRepository = userRepository;
            _emailSender = emailSender;
            _proveedorRepository = proveedorRepository;
            _logger = logger;
        }

        public async Task<ResponseBase<Guid>> Handle(CreateSolicitudCambioEstadoCommand request, CancellationToken cancellationToken)
        {
            User comprador = await _currentUserService.GetUserAsync();
            string CompradorUserName = comprador.Name.ToUpper();
            Usuario usuarioComprador = _userRepository.TableNoTracking.FirstOrDefault(x => x.NombreUsuario.ToUpper() == CompradorUserName);

            bool existSolicitudCambioEstado = _repository.Count(x => x.Comprador.NombreUsuario.ToUpper() == CompradorUserName && x.ProveedorId == request.ProveedorId && x.Periodo == request.Periodo && x.Estado == "Creada") > 0;
            if (existSolicitudCambioEstado)
            {
                throw new DataException($"Ya existe una solicitud de cambio de estado para el proveedor en el periodo {request.Periodo}");
            }

            SolicitudCambioEstado solicitud = _mapper.Map<SolicitudCambioEstado>(request);
            solicitud.CompradorId = usuarioComprador.Id;
            solicitud.Estado = "Creada";
            solicitud.FechaCreacion = DateTime.Now;
            solicitud.AprobadorId = usuarioComprador.JefeDirectoId ?? _userRepository.TableNoTracking.First(x => x.Rol.Nombre == "Administrador").Id;
            
            _repository.Insert(solicitud);
            await _unitOfWork.CommitAsync(cancellationToken);

            try {
                Usuario aprobador = _userRepository.TableNoTracking.FirstOrDefault(x => x.Id == solicitud.AprobadorId) ?? throw new Exception("El usuario no existe.");
                Proveedor proveedor = _proveedorRepository.TableNoTracking.FirstOrDefault(x => x.Id == solicitud.ProveedorId) ?? throw new Exception("El proveedor no existe.");
                await _emailSender.EnviarNotificacionSolicitudCambioEstadoAprodadorAsync(usuarioComprador, aprobador, proveedor, request.Periodo, request.Observaciones, cancellationToken);
            } catch (Exception ex) {
                _logger.LogError(ex, "Error al enviar la notificación.");
            }

            return new ResponseBase<Guid>(solicitud.Id);
        }
    }
}
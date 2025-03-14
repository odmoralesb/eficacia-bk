using AutoMapper;
using MediatR;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using TQ.Proveedores.Application.ServiceAgents.Interfaces;
using TQ.Proveedores.Domain.Configuracion;
using TQ.Proveedores.Domain.Evaluaciones;
using TQ.Proveedores.Domain.Maestras;
using TQ.Proveedores.Domain.OrdenesDeCompra;
using TQ.Repository.Abstractions;
using TQ.Util.MediatRUtils;
using TQ.Utils.AutoMapperUtils;

namespace TQ.Proveedores.Application.SolicitudesCambioEstado.Commands.Close
{
    public class CloseSolicitudCambioEstadoCommand:IRequest<ResponseBase<Guid>>, IMapFrom<SolicitudCambioEstado>
    {
        public Guid Id { get; set; }
    }

    public class CloseSolicitudCambioEstadoCommandHandler : IRequestHandler<CloseSolicitudCambioEstadoCommand, ResponseBase<Guid>>
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IRepository<SolicitudCambioEstado> _repository;
        private readonly IRepository<Usuario> _userRepository;
        private readonly ICurrentUserService _currentUserService;
        private readonly IRepository<Evaluacion> _repositoryEvaluacion;
        private readonly IRepository<Evento> _repositoryEvento;
        private readonly IEmailSender _emailSender;
        private readonly ILogger<CloseSolicitudCambioEstadoCommand> _logger;
        private readonly IRepository<Proveedor> _proveedorRepository;

        public CloseSolicitudCambioEstadoCommandHandler(IUnitOfWork unitOfWork, IRepository<SolicitudCambioEstado> repository, ICurrentUserService currentUserService, IRepository<Usuario> userRepository, IRepository<Evaluacion> repositoryEvaluacion, IRepository<Evento> repositoryEvento, IEmailSender emailSender, IRepository<Proveedor> proveedorRepository, ILogger<CloseSolicitudCambioEstadoCommand> logger)
        {
            _unitOfWork = unitOfWork;
            _repository = repository;
            _currentUserService = currentUserService;
            _userRepository = userRepository;
            _repositoryEvaluacion = repositoryEvaluacion;
            _repositoryEvento = repositoryEvento;
            _emailSender = emailSender;
            _proveedorRepository = proveedorRepository;
            _logger = logger;
        }

        public async Task<ResponseBase<Guid>> Handle(CloseSolicitudCambioEstadoCommand request, CancellationToken cancellationToken)
        {
            User comprador = await _currentUserService.GetUserAsync();
            string compradorUserName = comprador.Name.ToUpper();
            Usuario usuarioComprador = _userRepository.TableNoTracking.FirstOrDefault(x => x.NombreUsuario.ToUpper() == compradorUserName);
            List<Usuario> administradores = _userRepository.TableNoTracking.Where(x => x.Rol.Nombre == "Administrador").ToList();

            SolicitudCambioEstado solicitud = _repository.Table.FirstOrDefault(x => x.Id == request.Id);
            if (solicitud == null)
            {
                throw new DataException($"No existe la solicitud de cambio de estado con Id {request.Id}");
            }
            if (solicitud.Estado != "Aprobada")
            {
                throw new DataException($"La solicitud de cambio de estado con Id {request.Id} no se encuentra en estado Aprobada");
            }
            if (!(solicitud.CompradorId == usuarioComprador.Id || administradores.Select(x => x.Id).Contains(usuarioComprador.Id)))
            {
                throw new DataException($"El usuario no tiene permisos para cerrar la solicitud de cambio de estado con Id {request.Id}");
            }
            if (solicitud.Estado == "Cerrada")
            {
                throw new DataException($"La solicitud de cambio de estado con Id {request.Id} ya se encuentra cerrada");
            }

            solicitud.Estado = "Cerrada";
            solicitud.FechaCierre = DateTime.Now;
            _repository.Update(solicitud);
            await _unitOfWork.CommitAsync(cancellationToken);

            try {
                Usuario usuarioAprobador = _userRepository.TableNoTracking.FirstOrDefault(x => x.Id == solicitud.CompradorId) ?? throw new Exception("El usuario no existe.");
                Proveedor proveedor = _proveedorRepository.TableNoTracking.FirstOrDefault(x => x.Id == solicitud.ProveedorId) ?? throw new Exception("El proveedor no existe.");
                await _emailSender.EnviarNotificacionSolicitudCambioEstadoCierreAsync(administradores, usuarioComprador, usuarioAprobador, proveedor, solicitud.Periodo, solicitud.Observaciones, cancellationToken);
            } catch (Exception ex) {
                _logger.LogError(ex, "Error al enviar la notificación.");
            }

            return new ResponseBase<Guid>(solicitud.Id);
        }
    }
}
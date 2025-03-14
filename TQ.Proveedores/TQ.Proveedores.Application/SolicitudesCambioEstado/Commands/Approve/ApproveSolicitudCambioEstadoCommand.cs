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
using TQ.Proveedores.Domain.Enums;
using TQ.Proveedores.Domain.Evaluaciones;
using TQ.Proveedores.Domain.Maestras;
using TQ.Proveedores.Domain.OrdenesDeCompra;
using TQ.Repository.Abstractions;
using TQ.Util.MediatRUtils;
using TQ.Utils.AutoMapperUtils;

namespace TQ.Proveedores.Application.SolicitudesCambioEstado.Commands.Approve
{
    public class ApproveSolicitudCambioEstadoCommand:IRequest<ResponseBase<Guid>>, IMapFrom<SolicitudCambioEstado>
    {
        public Guid Id { get; set; }
    }

    public class ApproveSolicitudCambioEstadoCommandHandler : IRequestHandler<ApproveSolicitudCambioEstadoCommand, ResponseBase<Guid>>
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IRepository<SolicitudCambioEstado> _repository;
        private readonly IRepository<Usuario> _userRepository;
        private readonly IRepository<Rol> _rolRepository;
        private readonly IMapper _mapper;
        private readonly ICurrentUserService _currentUserService;
        private readonly IRepository<Evaluacion> _repositoryEvaluacion;
        private readonly IRepository<Evento> _repositoryEvento;
        private readonly IRepository<Proveedor> _proveedorRepository;
        private readonly IEmailSender _emailSender;
        private readonly ILogger<ApproveSolicitudCambioEstadoCommand> _logger;

        public ApproveSolicitudCambioEstadoCommandHandler(IUnitOfWork unitOfWork, IRepository<SolicitudCambioEstado> repository, IMapper mapper, ICurrentUserService currentUserService, IRepository<Usuario> userRepository, IRepository<Rol> rolRepository, IRepository<Evaluacion> repositoryEvaluacion, IRepository<Evento> repositoryEvento, IEmailSender emailSender, IRepository<Proveedor> proveedorRepository, ILogger<ApproveSolicitudCambioEstadoCommand> logger)
        {
            _unitOfWork = unitOfWork;
            _repository = repository;
            _mapper = mapper;
            _currentUserService = currentUserService;
            _userRepository = userRepository;
            _rolRepository = rolRepository;
            _repositoryEvaluacion = repositoryEvaluacion;
            _repositoryEvento = repositoryEvento;
            _emailSender = emailSender;
            _proveedorRepository = proveedorRepository;
            _logger = logger;
        }

        public async Task<ResponseBase<Guid>> Handle(ApproveSolicitudCambioEstadoCommand request, CancellationToken cancellationToken)
        {
            User aprobador = await _currentUserService.GetUserAsync();
            string aprobadorUserName = aprobador.Name.ToUpper();
            Usuario usuarioAprobador = _userRepository.TableNoTracking.FirstOrDefault(x => x.NombreUsuario.ToUpper() == aprobadorUserName);
            Guid RolAdministradorId = _rolRepository.TableNoTracking.First(x => x.Nombre == "Administrador").Id;

            SolicitudCambioEstado solicitud = _repository.Table.FirstOrDefault(x => x.Id == request.Id);
            if (solicitud == null)
            {
                throw new DataException($"No existe la solicitud de cambio de estado con Id {request.Id}");
            }
            if (solicitud.Estado != "Creada")
            {
                throw new DataException($"La solicitud de cambio de estado con Id {request.Id} no se encuentra en estado Creada");
            }
            if (!(solicitud.AprobadorId == usuarioAprobador.Id || usuarioAprobador.RolId == RolAdministradorId))
            {
                throw new DataException($"El usuario no tiene permisos para aprobar la solicitud de cambio de estado con Id {request.Id}");
            }

            solicitud.Estado = "Aprobada";
            solicitud.FechaAprobacion = DateTime.Now;
            _repository.Update(solicitud);
            await _unitOfWork.CommitAsync(cancellationToken);


            List<Evaluacion> evaluaciones = _repositoryEvaluacion.GetMany(x => x.OrdenesCompra.Any(y => (y.ProveedorId == solicitud.ProveedorId) && (y.CompradorId == solicitud.CompradorId)) && (x.NombrePeriodo == solicitud.Periodo) && (x.Estado == (int)EstadoEvaluacion.ENVIADO)).ToList();
            if (evaluaciones.Count == 0)
            {
                IDictionary<string, string[]> errors = new Dictionary<string, string[]>
                {
                    { "evaluaciones", new string[] { "No se encontraron evaluaciones enviadas con la información suministrada" } },
                };
                return new ResponseBase<Guid>(errors: errors);
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

            try {
                Usuario comprador = _userRepository.TableNoTracking.FirstOrDefault(x => x.Id == solicitud.CompradorId) ?? throw new Exception("El usuario no existe.");
                Proveedor proveedor = _proveedorRepository.TableNoTracking.FirstOrDefault(x => x.Id == solicitud.ProveedorId) ?? throw new Exception("El proveedor no existe.");
                await _emailSender.EnviarNotificacionSolicitudCambioEstadoCompradorAsync(comprador, usuarioAprobador, proveedor, solicitud.Periodo, solicitud.Observaciones, cancellationToken);
            } catch (Exception ex) {
                _logger.LogError(ex, "Error al enviar la notificación.");
            }


            return new ResponseBase<Guid>(solicitud.Id);
        }
    }
}
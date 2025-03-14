using DocumentFormat.OpenXml.Drawing.Charts;
using DocumentFormat.OpenXml.Office2010.ExcelAc;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using TQ.Proveedores.Application.ServiceAgents.Interfaces;
using TQ.Proveedores.Domain.Configuracion;
using TQ.Proveedores.Domain.Maestras;
using TQ.Repository.Abstractions;
using TQ.Util.MediatRUtils;

namespace TQ.Proveedores.Application.Evaluaciones.Commands
{
    public class EnviarReporteConsolidadoCommand : IRequest<ResponseBase<List<Guid>>>
    {
        public Guid? ProveedorId { get; set; }
        public int? Anio { get; set; }
        public string Ruta { get; set; }
    }

    public class EnviarReporteConsolidadoCommandHandler : IRequestHandler<EnviarReporteConsolidadoCommand, ResponseBase<List<Guid>>>
    {
        private readonly IRepository<CalendarioTQ> _calendarioRepository;
        private readonly ITarea _tarea;
        private readonly IEmailSender _emailSender;
        private readonly IRepository<Usuario> _usuarioRepository;

        public EnviarReporteConsolidadoCommandHandler(IRepository<CalendarioTQ> calendarioRepository, ITarea tarea, IEmailSender emailSender, IRepository<Usuario> usuarioRepository)
        {
            _calendarioRepository = calendarioRepository;
            _tarea = tarea;
            _emailSender = emailSender;
            _usuarioRepository = usuarioRepository;
        }

        public async Task<ResponseBase<List<Guid>>> Handle(EnviarReporteConsolidadoCommand request, CancellationToken cancellationToken)
        {
            CalendarioTQ periodoTQ = _calendarioRepository.TableNoTracking.OrderByDescending(x => x.FechaFin).FirstOrDefault(x => x.FechaFin < DateTime.Now);
            bool check = await _tarea.EnviarCorreoAprobacionPendiente(periodoTQ, request.ProveedorId);
            List<Guid> evaluacionesId = new List<Guid>();
            if (check)
            {
                evaluacionesId = await _tarea.EnviarReporte(request.ProveedorId, request.Anio, request.Ruta, cancellationToken: cancellationToken);
                if (evaluacionesId.Count == 0)
                {
                    throw new Exception("No hay información con los datos solicitados");
                }

                string[] admins = _usuarioRepository.TableNoTracking.Where(x => x.Rol.Nombre == "Administrador").Select(x => x.CorreoElectronico).ToArray();
                await _emailSender.EnviarCorreo("",
                                                admins,
                                                "Envio de evaluación a proveedor",
                                                $"<p>Cordial saludo,</p><p>Informamos que se ha enviado satisfactoriamente el archivo con la evaluación al proveedor.</p>",
                                                cancellationToken);
            }
            
            return await Task.FromResult(new ResponseBase<List<Guid>>(evaluacionesId));
        }
    }
}

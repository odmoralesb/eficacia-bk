using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using TQ.Proveedores.Domain.Configuracion;
using TQ.Proveedores.Domain.Maestras;

namespace TQ.Proveedores.Application.ServiceAgents.Interfaces
{
    public interface IEmailSender
    {
        public Task<string> EnviarCorreo(string destinatario, string[] conCopia, string asunto, string cuerpo, CancellationToken cancellationToken);
        public Task<string> EnviarCorreoAprobacionAsync(string nombre, string periodo, string destinatario, string[] conCopia, CancellationToken cancellationToken);
        public Task<string> EnviarCorreoEvaluacionAsync(string nombreProveedor, string mes, byte[] archivoAdjunto, string[] listaEmails, string[] listaCC, CancellationToken cancellationToken);
        public Task<string> EnviarCorreoPendienteAprobacionAsync(string nombre, string periodo, string destinatario, List<string> proveedores, CancellationToken cancellationToken);
        public Task<string> EnviarCorreoPendienteAprobacionAdminAsync(string periodo, string[] destinatarios, List<string> compradores, CancellationToken cancellationToken);
        public Task<string> EnviarCorreoReasignacionAsync(string nombre, string ordenesCompra, string destinatario, string[] conCopia, CancellationToken cancellationToken);
        public Task<string> EnviarNotificacionSolicitudCambioEstadoAprodadorAsync(Usuario comprador, Usuario aprobador, Proveedor proveedor, string periodo, string observaciones, CancellationToken cancellationToken);
        public Task<string> EnviarNotificacionSolicitudCambioEstadoCompradorAsync(Usuario comprador, Usuario aprobador, Proveedor proveedor, string periodo, string observaciones, CancellationToken cancellationToken);
        public Task<string> EnviarNotificacionSolicitudCambioEstadoCierreAsync(List<Usuario> administradores, Usuario comprador, Usuario aprobador, Proveedor proveedor, string periodo, string observaciones, CancellationToken cancellationToken);
    }
}

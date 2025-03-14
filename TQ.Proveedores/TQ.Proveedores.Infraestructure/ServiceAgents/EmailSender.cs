using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using System;
using System.IO;
using System.Net.Mail;
using System.Net;
using System.Threading;
using System.Threading.Tasks;
using TQ.Proveedores.Application.ServiceAgents.Interfaces;
using TQ.Util.Email;
using System.Collections.Generic;
using TQ.Proveedores.Domain.Configuracion;
using TQ.Proveedores.Domain.Maestras;

namespace TQ.Proveedores.Infraestructure.ServiceAgents
{
    public class EmailSender : IEmailSender
    {
        private readonly IEmailService _emailService;
        private readonly IConfiguration _configuration;
        private readonly IHostEnvironment _env;
        private readonly ILogger<EmailSender> _logger;

        public EmailSender(IEmailService emailSender, IConfiguration configuration, IHostEnvironment env, ILogger<EmailSender> logger)
        {
            _emailService = emailSender;
            _configuration = configuration;
            _env = env;
            _logger = logger;
        }

        public async Task<string> EnviarCorreo(string destinatario, string[] conCopia, string asunto, string cuerpo, CancellationToken cancellationToken)
        {
            string sender = _configuration.GetSection("SmtpConfig").GetValue<string>("Sender");
            string senderAlias = _configuration.GetSection("SmtpConfig").GetValue<string>("SenderAlias");

            var metadata = new Metadata();
            metadata.Sender = sender;
            metadata.SenderAlias = senderAlias;

            metadata.TO.Add(destinatario);

            foreach (var cc in conCopia)
            {
                metadata.CC.Add(cc);
            }

            metadata.Subject = asunto;
            metadata.IsFileTemplate = false;
            metadata.Template = cuerpo;

            if (!await _emailService.SendEmailAsync(metadata, cancellationToken))
            {
                _logger.LogInformation("No existe excepción, el método SendEmailAsync de IEmailService retornó false");
                return "ERROR";
            }

            _logger.LogInformation("Correo electrónico enviado con éxito.");
            return "Ok";
        }

        public async Task<string> EnviarCorreoAprobacionAsync(string nombre, string periodo, string destinatario, string[] conCopia, CancellationToken cancellationToken)
        {
            string sender = _configuration.GetSection("SmtpConfig").GetValue<string>("Sender");
            string senderAlias = _configuration.GetSection("SmtpConfig").GetValue<string>("SenderAlias");

            var metadata = new Metadata();
            metadata.Sender = sender;
            metadata.SenderAlias = senderAlias;

            metadata.TO.Add(destinatario);

            foreach (var cc in conCopia)
            {
                metadata.CC.Add(cc);
            }

            metadata.Subject = $"Aprobación de Evaluaciones de Eficacia Proveedores - Periodo {periodo}";
            metadata.IsFileTemplate = false;
            metadata.Template = $"<p>Cordial saludo,</p><br/><p>Informamos que las evaluaciones de eficacia de proveedores asignadas al comprador <b>{nombre}</b> en el periodo <b>{periodo}</b> han sido aprobadas.</p>";

            if (!await _emailService.SendEmailAsync(metadata, cancellationToken))
            {
                _logger.LogInformation("No existe excepción, el método SendEmailAsync de IEmailService retornó false");
                return "ERROR";
            }

            _logger.LogInformation("Correo electrónico enviado con éxito.");
            return "Ok";
        }

        public Task<string> EnviarCorreoEvaluacionAsync(string nombreProveedor, string mes, byte[] archivoAdjunto, string[] listaEmails, string[] listaCC, CancellationToken cancellationToken)
        {
            try
            {
                string host = _configuration.GetSection("SmtpConfig").GetValue<string>("Host");
                int port = _configuration.GetSection("SmtpConfig").GetValue<int>("Port");
                string username = _configuration.GetSection("SmtpConfig").GetValue<string>("Username") ?? "";
                string password = _configuration.GetSection("SmtpConfig").GetValue<string>("Password") ?? "";
                bool enableSsl = _configuration.GetSection("SmtpConfig").GetValue<bool>("EnableSsl");
                string sender = _configuration.GetSection("SmtpConfig").GetValue<string>("Sender");

                 // Verifica si la operación ha sido cancelada
                cancellationToken.ThrowIfCancellationRequested();

                // Creamos el MemoryStream con los bytes del archivo Excel
                using (MemoryStream ms = new MemoryStream(archivoAdjunto))
                {
                    // Creamos el adjunto con el MemoryStream
                    Attachment attach = new Attachment(ms, $"{nombreProveedor}_{mes}.xlsx", "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");

                    // Configuramos la codificación de transferencia
                    attach.TransferEncoding = System.Net.Mime.TransferEncoding.Base64;

                    // Creamos el correo y añadimos el adjunto
                    using (MailMessage mail = new MailMessage())
                    {
                        mail.From = new MailAddress(sender);

                        foreach (var to in listaEmails)
                        {
                            mail.To.Add(to);
                        }

                        foreach (var cc in listaCC)
                        {
                            mail.CC.Add(cc);
                        }

                        mail.Subject = $"Indicadores Gestión a {mes}"; ;
                        mail.IsBodyHtml = true;
                        mail.Body = $"<p>Buen día,</p><br/><p>Adjuntamos consolidado a {mes} de sus indicadores de gestión, cualquier inquietud favor comunicarse con su contacto en compras</p>"; ;

                        mail.Attachments.Add(attach);

                        // Enviamos el correo
                        using (SmtpClient smtpClient = new SmtpClient(host))
                        {
                            smtpClient.Port = port;
                            smtpClient.Credentials = new NetworkCredential(username, password);
                            smtpClient.EnableSsl = enableSsl;
                            smtpClient.Send(mail);

                            _logger.LogInformation("Correo electrónico enviado con éxito.");
                        }
                    }
                }

                return Task.FromResult("OK");
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.StackTrace);
                return Task.FromResult("Fail");
            }
        }

        public async Task<string> EnviarCorreoPendienteAprobacionAsync(string nombre, string periodo, string destinatario, List<string> proveedores, CancellationToken cancellationToken)
        {
            string sender = _configuration.GetSection("SmtpConfig").GetValue<string>("Sender");
            string senderAlias = _configuration.GetSection("SmtpConfig").GetValue<string>("SenderAlias");

            var metadata = new Metadata();
            metadata.Sender = sender;
            metadata.SenderAlias = senderAlias;

            metadata.TO.Add(destinatario);

            metadata.Subject = $"Aprobaciones de Evaluaciones Pendientes - Eficacia Proveedores - Periodo {periodo}";
            metadata.IsFileTemplate = false;
            metadata.Template = $"<p>Cordial saludo,</p><br/><p>Informamos que las evaluaciones de eficacia de proveedores asignadas al comprador <b>{nombre}</b> en el periodo <b>{periodo}</b> aún se encuentran pendientes de aprobar. Realizar las aprobaciones lo más pronto posible.</p>";
            metadata.Template += "<p>Los proveedores a evaluar son los siguientes</p><ul>";
            foreach (var item in proveedores)
            {
                metadata.Template += $"<li>{item}</li>";
            }
            metadata.Template += "</ul>";

            if (!await _emailService.SendEmailAsync(metadata, cancellationToken))
            {
                _logger.LogInformation("No existe excepción, el método SendEmailAsync de IEmailService retornó false");
                return "ERROR";
            }

            _logger.LogInformation("Correo electrónico enviado con éxito.");
            return "Ok";
        }

        public async Task<string> EnviarCorreoPendienteAprobacionAdminAsync(string periodo, string[] destinatarios, List<string> compradores, CancellationToken cancellationToken)
        {
            string sender = _configuration.GetSection("SmtpConfig").GetValue<string>("Sender");
            string senderAlias = _configuration.GetSection("SmtpConfig").GetValue<string>("SenderAlias");

            var metadata = new Metadata();
            metadata.Sender = sender;
            metadata.SenderAlias = senderAlias;

            metadata.TO.AddRange(destinatarios);

            metadata.Subject = $"Aprobaciones de Evaluaciones Pendientes - Eficacia Proveedores - Periodo {periodo}";
            metadata.IsFileTemplate = false;
            metadata.Template = $"<p>Cordial saludo,</p><br/><p>Informamos que las evaluaciones de eficacia de proveedores correspondientes al periodo <b>{periodo}</b> aún se encuentran pendientes de aprobar. Realizar las aprobaciones lo más pronto posible.</p>";
            metadata.Template += "<p>Los compradores que no han aprobado las evaluaciones son los siguientes:</p><ul>";
            foreach (var item in compradores)
            {
                metadata.Template += $"<li>{item}</li>";
            }
            metadata.Template += "</ul>";

            if (!await _emailService.SendEmailAsync(metadata, cancellationToken))
            {
                _logger.LogInformation("No existe excepción, el método SendEmailAsync de IEmailService retornó false");
                return "ERROR";
            }

            _logger.LogInformation("Correo electrónico enviado con éxito.");
            return "Ok";
        }

        public async Task<string> EnviarCorreoReasignacionAsync(string nombre, string ordenesCompra, string destinatario, string[] conCopia, CancellationToken cancellationToken)
        {
            string sender = _configuration.GetSection("SmtpConfig").GetValue<string>("Sender");
            string senderAlias = _configuration.GetSection("SmtpConfig").GetValue<string>("SenderAlias");

            var metadata = new Metadata();
            metadata.Sender = sender;
            metadata.SenderAlias = senderAlias;

            metadata.TO.Add(destinatario);

            foreach (var cc in conCopia)
            {
                metadata.CC.Add(cc);
            }

            metadata.Subject = $"Reasignación de las órdenes de compra de Evaluaciones de Eficacia Proveedores";
            metadata.IsFileTemplate = false;
            metadata.Template = $"<p>{nombre}.</p><br/><p>Le informamos que las órdenes de compra: {ordenesCompra} le fueron reasignadas.</p>";

            if (!await _emailService.SendEmailAsync(metadata, cancellationToken))
            {
                _logger.LogInformation("No existe excepción, el método SendEmailAsync de IEmailService retornó false");
                return "ERROR";
            }

            _logger.LogInformation("Correo electrónico enviado con éxito.");
            return "Ok";
        }

        public async Task<string> EnviarNotificacionSolicitudCambioEstadoAprodadorAsync(Usuario comprador, Usuario aprobador, Proveedor proveedor, string periodo, string observaciones, CancellationToken cancellationToken)
        {
            string sender = _configuration.GetSection("SmtpConfig").GetValue<string>("Sender");
            string senderAlias = _configuration.GetSection("SmtpConfig").GetValue<string>("SenderAlias");

            var metadata = new Metadata
            {
                Sender = sender,
                SenderAlias = senderAlias
            };

            metadata.TO.Add(aprobador.CorreoElectronico);
            metadata.CC.Add(comprador.CorreoElectronico);

            metadata.Subject = $"Solicitud de aprobación de cambio de estado - Proveedor {proveedor.RazonSocial} - Periodo {periodo}";
            metadata.IsFileTemplate = false;
            metadata.Template = $"<p>Cordial saludo,</p><br/><p>Informamos que el comprador <b>{comprador.GetNombreCompleto()}</b> está solicitando su aprobación para realizar cambios de estado de las evalucaciones para el proveedor <b>{proveedor.RazonSocial}</b> para el periodo <b>{periodo}</b></p><br/><p>Observaciones: {observaciones}</p>";

            if (!await _emailService.SendEmailAsync(metadata, cancellationToken))
            {
                _logger.LogInformation("No existe excepción, el método SendEmailAsync de IEmailService retornó false");
                return "ERROR";
            }

            _logger.LogInformation("Correo electrónico enviado con éxito.");
            return "Ok";
        }

        public async Task<string> EnviarNotificacionSolicitudCambioEstadoCompradorAsync(Usuario comprador, Usuario aprobador, Proveedor proveedor, string periodo, string observaciones, CancellationToken cancellationToken)
        {
            string sender = _configuration.GetSection("SmtpConfig").GetValue<string>("Sender");
            string senderAlias = _configuration.GetSection("SmtpConfig").GetValue<string>("SenderAlias");

            var metadata = new Metadata
            {
                Sender = sender,
                SenderAlias = senderAlias
            };

            metadata.TO.Add(comprador.CorreoElectronico);
            metadata.CC.Add(aprobador.CorreoElectronico);

            metadata.Subject = $"Solicitud de cambio de estado - Proveedor {proveedor.RazonSocial} - Periodo {periodo}";
            metadata.IsFileTemplate = false;
            metadata.Template = $"<p>Cordial saludo,</p><br/><p>Informamos que su solicitud de cambio de estado para el proveedor <b>{proveedor.RazonSocial}</b> para el periodo <b>{periodo}</b> ha sido aprobada por <b>{aprobador.GetNombreCompleto()}</b> y ya puede acceder a la plataforma para realizar los cambios.</p><br/><p>Observaciones de la solicitud: {observaciones}</p>";

            if (!await _emailService.SendEmailAsync(metadata, cancellationToken))
            {
                _logger.LogInformation("No existe excepción, el método SendEmailAsync de IEmailService retornó false");
                return "ERROR";
            }

            _logger.LogInformation("Correo electrónico enviado con éxito.");
            return "Ok";
        }

        public async Task<string> EnviarNotificacionSolicitudCambioEstadoCierreAsync(List<Usuario> administradores, Usuario comprador, Usuario aprobador, Proveedor proveedor, string periodo, string observaciones, CancellationToken cancellationToken)
        {
            string sender = _configuration.GetSection("SmtpConfig").GetValue<string>("Sender");
            string senderAlias = _configuration.GetSection("SmtpConfig").GetValue<string>("SenderAlias");

            var metadata = new Metadata
            {
                Sender = sender,
                SenderAlias = senderAlias
            };

            foreach (var admin in administradores)
            {
                metadata.TO.Add(admin.CorreoElectronico);
            }
            metadata.CC.Add(comprador.CorreoElectronico);
            metadata.CC.Add(aprobador.CorreoElectronico);

            metadata.Subject = $"Solicitud de cambio de estado - Proveedor {proveedor.RazonSocial} - Periodo {periodo}";
            metadata.IsFileTemplate = false;
            metadata.Template = $"<p>Cordial saludo,</p><br/><p>Informamos que fueron llevados a cabo los cambios de estado solicitados para el proveedor <b>{proveedor.RazonSocial}</b> para el periodo <b>{periodo}</b> y ya se puede enviar nuevamente las evaluaciones.</p><br/><p>Observaciones de la solicitud: {observaciones}</p>";

            if (!await _emailService.SendEmailAsync(metadata, cancellationToken))
            {
                _logger.LogInformation("No existe excepción, el método SendEmailAsync de IEmailService retornó false");
                return "ERROR";
            }

            _logger.LogInformation("Correo electrónico enviado con éxito.");
            return "Ok";
        }
    }
}

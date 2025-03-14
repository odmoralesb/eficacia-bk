using FluentValidation;

namespace TQ.Proveedores.Application.SolicitudesCambioEstado.Commands.Close
{
    public class ResendReportSolicitudCambioEstadoCommandValidator : AbstractValidator<ResendReportSolicitudCambioEstadoCommand>
    {
        public ResendReportSolicitudCambioEstadoCommandValidator()
        {
            RuleFor(x => x.Id).NotEmpty().WithMessage("El Id es requerido");
        }
    }
}
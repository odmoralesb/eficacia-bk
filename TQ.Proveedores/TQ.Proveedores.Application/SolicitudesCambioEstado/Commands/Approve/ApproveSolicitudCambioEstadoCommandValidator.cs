using FluentValidation;

namespace TQ.Proveedores.Application.SolicitudesCambioEstado.Commands.Approve
{
    public class ApproveSolicitudCambioEstadoCommandValidator : AbstractValidator<ApproveSolicitudCambioEstadoCommand>
    {
        public ApproveSolicitudCambioEstadoCommandValidator()
        {
            RuleFor(x => x.Id).NotEmpty().WithMessage("El Id es requerido");
        }
    }
}
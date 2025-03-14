using FluentValidation;

namespace TQ.Proveedores.Application.SolicitudesCambioEstado.Commands.Close
{
    public class CloseSolicitudCambioEstadoCommandValidator : AbstractValidator<CloseSolicitudCambioEstadoCommand>
    {
        public CloseSolicitudCambioEstadoCommandValidator()
        {
            RuleFor(x => x.Id).NotEmpty().WithMessage("El Id es requerido");
        }
    }
}
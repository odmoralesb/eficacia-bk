using FluentValidation;

namespace TQ.Proveedores.Application.SolicitudesCambioEstado.Commands.Create
{
    public class CreateSolicitudCambioEstadoCommandValidator : AbstractValidator<CreateSolicitudCambioEstadoCommand>
    {
        public CreateSolicitudCambioEstadoCommandValidator()
        {
            RuleFor(x => x.ProveedorId).NotEmpty().WithMessage("El proveedor es requerido");
            RuleFor(x => x.Periodo).NotEmpty().WithMessage("El periodo es requerido");
            RuleFor(x => x.Observaciones).NotEmpty().WithMessage("Las observaciones son requeridas");
        }
    }
}
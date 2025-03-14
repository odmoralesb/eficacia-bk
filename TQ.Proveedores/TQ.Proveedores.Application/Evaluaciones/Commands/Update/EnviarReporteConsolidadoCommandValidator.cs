using FluentValidation;

namespace TQ.Proveedores.Application.Evaluaciones.Commands.Update
{
    public class EnviarReporteConsolidadoCommandValidator : AbstractValidator<EnviarReporteConsolidadoCommand>
    {
        public EnviarReporteConsolidadoCommandValidator()
        {
            RuleFor(p => p.ProveedorId)
                .NotEmpty()
                .WithMessage("El campo Proveedor es requerido.");

            RuleFor(p => p.Anio)
                .NotEmpty().WithMessage("El campo Año es requerido.")
                .GreaterThan(0).WithMessage("Seleccione un año válido");
        }
    }
}

using FluentValidation;

namespace TQ.Proveedores.Application.Causales.Commands
{
    public class CreateCausalCommandValidator : AbstractValidator<CreateCausalCommand>
    {
        public CreateCausalCommandValidator()
        {
            RuleFor(p => p.CodigoCausal)
                .NotEmpty().WithMessage("El código de la causal es requerido.")
                .GreaterThan(0).WithMessage("El código de la causal debe ser mayor a cero.");

            RuleFor(p => p.Nombre)
                .MaximumLength(80).WithMessage("El nombre requiere como máximo 80 caracteres")
                .NotEmpty().WithMessage("El nombre de la causal es requerido.");

            RuleFor(p => p.Descripcion)
                .MaximumLength(240).WithMessage("La descripciópn de la causal requiere como máximo 240 caracteres.");
        }
    }
}

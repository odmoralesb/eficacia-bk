using FluentValidation;

namespace TQ.Proveedores.Application.Evaluaciones.Commands
{
    public class UpdateEstadoCommandValidator : AbstractValidator<UpdateEstadoCommand>
    {
        public UpdateEstadoCommandValidator()
        {
            RuleFor(p => p.CompradorId)
                .NotEmpty().WithMessage("Debe especificar un comprador");
            RuleFor(p => p.ProveedorId)
                .NotEmpty().WithMessage("Debe especificar un proveedor");
            RuleFor(p => p.Periodo)
                .NotEmpty().WithMessage("Debe especificar un periodo")
                .MaximumLength(6).WithMessage("El campo periodo debe tener un máximo de 6 caracteres");
        }
    }
}

using FluentValidation;

namespace TQ.Proveedores.Application.OrdenesDeCompra.Commands
{
    public class UpdateCompradorOcCommandValidator : AbstractValidator<UpdateCompradorOcCommand>
    {
        public UpdateCompradorOcCommandValidator()
        {
            RuleFor(p => p.CompradorRetirado)
                .NotEmpty().WithMessage("Debe ingresar algún comprador que desee cambiar.");
            RuleFor(p => p.CompradorNuevo)
                .NotEmpty().WithMessage("Debe ingresar algún comprador por el que desee cambiar.");

            RuleFor(p => p)
                .Must(p => (p.CompradorRetirado != p.CompradorNuevo) || (p.CompradorRetirado is null && p.CompradorNuevo is null))
                .WithMessage("No puede reasignar al mismo comprador");

            RuleFor(p => p.Periodo)
                .NotEmpty().WithMessage("Debe ingresar el periodo de la orden de compra.");
        }
    }
}

using FluentValidation;
using System.Text.RegularExpressions;
using System;

namespace TQ.Proveedores.Application.PlanesDeAccion.Commands.Create
{
    public class UpdatePlanAccionCommandValidator : AbstractValidator<UpdatePlanAccionCommand>
    {
        public UpdatePlanAccionCommandValidator()
        {
            RuleFor(p => p.ProveedorId)
                .NotEmpty().WithMessage("El proveedor es requerido.");
            RuleFor(p => p.NombreUsuario)
                .NotEmpty().WithMessage("El comprador es requerido.");
            RuleFor(p => p.Trimestre)
                .NotEmpty().WithMessage("El trimestre es requerido.")
                .InclusiveBetween(1,4).WithMessage("Diligencie un trimestre válido.");
            RuleFor(p => p.Anio)
                .NotEmpty().WithMessage("El año es requerido.")
                .GreaterThan(0).WithMessage("Diligencie un año válido.");
            RuleFor(p => Regex.Replace(p.Comentario ?? "", "<.*?>", String.Empty))
                .NotEmpty().WithMessage("El comentario es requerido")
                .MaximumLength(4000).WithMessage("El comentario no debe exceder los 4.000 caracteres.");
            RuleFor(p => p.Accion)
                .NotEmpty().WithMessage("El plan acción es requerido.")
                .MaximumLength(1500).WithMessage("El plan acción no debe exceder los 1.500 caracteres.");
        }
    }
}

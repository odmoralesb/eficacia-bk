using FluentValidation;
using FluentValidation.Validators;
using System.Collections.Generic;
using System.Linq;

namespace TQ.Proveedores.Application.Proveedores.Commands.Update
{
    public class UpdateProveedorCommandValidator : AbstractValidator<UpdateProveedorCommand>
    {
        public UpdateProveedorCommandValidator()
        {
            RuleFor(p => p.Id)
                .NotEmpty().WithMessage("El proveedor no existe");

            RuleFor(p => p.listaCorreoElectronico)
                .NotEmpty().WithMessage("El proveedor debe tener como mínimo un correo en la lista.");

            RuleForEach(p => p.listaCorreoElectronico)
                .EmailAddress(EmailValidationMode.Net4xRegex).WithMessage("El correo \"{PropertyValue}\" no tiene la estructura correcta.");

            RuleFor(p => p.listaCorreoElectronico)
                .Custom((list, context) =>
                {
                    bool l = list.GroupBy(x => x).Any(g => g.Count() > 1);
                    if (l)
                    {
                        context.AddFailure("El listado de correos tiene valores duplicados.");
                    }
                });
        }
    }
}

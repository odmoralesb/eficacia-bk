using FluentValidation;

namespace TQ.Proveedores.Application.Parametros.Commands
{
    public class CreateParametroCommandValidator: AbstractValidator<CreateParametroCommand>
    {
        public CreateParametroCommandValidator()
        {
            RuleFor(p => p.Nombre)
                .NotEmpty().WithMessage("El nombre del parámetro no puede estar vacío.")
                .MaximumLength(250).WithMessage("El nombre del parámetro no debe superar los 250 caracteres.");
            RuleFor(p => p.Descripcion)
                .MaximumLength(250).WithMessage("La descripción del parámetro no debe superar los 250 caracteres.");

            RuleFor(p => p.Detalles)
                .NotEmpty().WithMessage("El parámetro debe tener una estructura.");

            RuleForEach(p => p.Detalles).SetValidator(new CreateParametroDetalleValidator());

            RuleFor(p => p.Valores)
                .NotEmpty().WithMessage("El parámetro debe tener valores parametrizados.");

            RuleForEach(p => p.Valores).SetValidator(new CreateParametroValorValidator());
        }
    }

    public class CreateParametroDetalleValidator: AbstractValidator<CreateParametroDetalleCommand>
    {
        public CreateParametroDetalleValidator()
        {
            RuleFor(p => p.NumCampo)
                .NotEmpty().WithMessage("Debe tener un número de columna")
                .GreaterThan(0).WithMessage("El número de columna debe ser mayor a cero");

            RuleFor(p => p.Nombre)
                .NotEmpty().WithMessage("El nombre de la columna no puede estar vacío.")
                .MaximumLength(250).WithMessage("El nombre de la columna no debe superar los 250 caracteres.");

            RuleFor(p => p.Descripcion)
                .MaximumLength(250).WithMessage("La descripción de la columna no debe superar los 250 caracteres.");
        }
    }

    public class CreateParametroValorValidator: AbstractValidator<CreateParametroValorCommand>
    {
        public CreateParametroValorValidator()
        {
            RuleFor(p => p.Campo1)
                .MaximumLength(250).WithMessage("El valor del campo 1 de la columna no debe superar los 250 caracteres.");
            RuleFor(p => p.Campo2)
                .MaximumLength(250).WithMessage("El valor del campo 2 de la columna no debe superar los 250 caracteres.");
            RuleFor(p => p.Campo3)
                .MaximumLength(250).WithMessage("El valor del campo 3 de la columna no debe superar los 250 caracteres.");
            RuleFor(p => p.Campo4)
                .MaximumLength(250).WithMessage("El valor del campo 4 de la columna no debe superar los 250 caracteres.");
            RuleFor(p => p.Campo5)
                .MaximumLength(250).WithMessage("El valor del campo 5 de la columna no debe superar los 250 caracteres.");
            RuleFor(p => p.Campo6)
                .MaximumLength(250).WithMessage("El valor del campo 6 de la columna no debe superar los 250 caracteres.");
            RuleFor(p => p.Campo7)
                .MaximumLength(250).WithMessage("El valor del campo 7 de la columna no debe superar los 250 caracteres.");
            RuleFor(p => p.Campo8)
                .MaximumLength(250).WithMessage("El valor del campo 8 de la columna no debe superar los 250 caracteres.");
            RuleFor(p => p.Campo9)  
                .MaximumLength(250).WithMessage("El valor del campo 9 de la columna no debe superar los 250 caracteres.");
            RuleFor(p => p.Campo10)
                .MaximumLength(250).WithMessage("El valor del campo 10 de la columna no debe superar los 250 caracteres.");
        }
    }
}

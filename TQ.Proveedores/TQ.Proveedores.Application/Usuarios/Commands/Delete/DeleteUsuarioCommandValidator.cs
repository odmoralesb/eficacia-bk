using FluentValidation;

namespace TQ.Proveedores.Application.Usuarios.Commands.Delete
{
    public class DeleteUsuarioCommandValidator : AbstractValidator<DeleteUsuarioCommand>
    {
        public DeleteUsuarioCommandValidator()
        {
            RuleFor(x => x.Id)
                .NotEmpty().WithMessage("El Id es requerido");
        }
    }
}
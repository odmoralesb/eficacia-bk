using System.Linq;
using FluentValidation;
using TQ.Proveedores.Domain.Configuracion;
using TQ.Repository.Abstractions;

namespace TQ.Proveedores.Application.Usuarios.Commands.Update
{
    public class UpdateUsuarioCommandValidator : AbstractValidator<UpdateUsuarioCommand>
    {
        private readonly IRepository<Rol> _rolRepository;

        public UpdateUsuarioCommandValidator(IRepository<Rol> rolRepository)
        {
            _rolRepository = rolRepository;

            RuleFor(x => x.Id)
                .NotEmpty().WithMessage("El Id es requerido");

            RuleFor(x => x.Nombre)
                .NotEmpty().WithMessage("El nombre es requerido")
                .MaximumLength(100).WithMessage("El nombre no puede exceder los 100 caracteres");

            RuleFor(x => x.Apellido)
                .NotEmpty().WithMessage("El apellido es requerido")
                .MaximumLength(100).WithMessage("El apellido no puede exceder los 100 caracteres");

            RuleFor(x => x.CorreoElectronico)
                .NotEmpty().WithMessage("El correo electrónico es requerido")
                .EmailAddress().WithMessage("El correo electrónico no es válido")
                .MaximumLength(100).WithMessage("El correo electrónico no puede exceder los 100 caracteres");

            RuleFor(x => x.JefeDirectoId)
                .NotEmpty().WithMessage("El jefe directo es requerido")
                .When(x => 
                {
                    var rolComprador = _rolRepository.TableNoTracking.FirstOrDefault(r => r.Nombre == "Comprador");
                    return rolComprador != null && x.RolId == rolComprador.Id;
                });
        }
    }
}
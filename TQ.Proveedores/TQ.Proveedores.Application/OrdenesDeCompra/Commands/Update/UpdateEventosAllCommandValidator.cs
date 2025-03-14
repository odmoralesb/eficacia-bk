using FluentValidation;
using System;

namespace TQ.Proveedores.Application.OrdenesDeCompra.Commands
{
    public class UpdateEventosAllCommandValidator : AbstractValidator<UpdateEventosAllCommand>
    {
        public UpdateEventosAllCommandValidator()
        {
            RuleFor(p => p.EvaluacionesActualizadas).NotEmpty().WithMessage("Al menos debe actualizar un recibido");
            RuleForEach(p => p.EvaluacionesActualizadas).SetValidator(new UpdateDetalleAllValidator());
        }
    }

    public class UpdateDetalleAllValidator : AbstractValidator<EvaluacionActualizada>
    {
        public UpdateDetalleAllValidator()
        {
            RuleFor(p => p.Id).NotEmpty().WithMessage("El identificador es requerido");
            RuleFor(p => p.IndicadorCalidad).NotNull().WithMessage("El indicador de calidad es requerido").GreaterThanOrEqualTo(0).WithMessage("Debe ser mayor o igual que cero");
            RuleFor(p => p.IndicadorCantidad).NotNull().WithMessage("El indicador de cantidad es requerido").GreaterThanOrEqualTo(0).WithMessage("Debe ser mayor o igual que cero");
            RuleFor(p => p.IndicadorFecha).NotNull().WithMessage("El indicador de fecha oportuna es requerido").GreaterThanOrEqualTo(0).WithMessage("Debe ser mayor o igual que cero");
            RuleFor(p => p).Must(p => ValidarCausal(p)).WithMessage("La causal es requerida debido a que hubo cambios.");
            RuleFor(p => p.Comentario).MaximumLength(4000).WithMessage("El comentario no debe sobrepasar los 4.000 caracteres.");
        }

        private bool ValidarCausal(EvaluacionActualizada p)
        {
            bool validacion = true;

            if (String.IsNullOrEmpty(p.CodigoCausal?.ToString()))
            {
                if (p.IndicadorCalidad != p.IndicadorCalidadSys)
                {
                    validacion = false;
                }
                if (p.IndicadorCantidad != p.IndicadorCantidadSys)
                {
                    validacion = false;
                }
                if (p.IndicadorFecha != p.IndicadorFechaSys)
                {
                    validacion = false;
                }
            }

            return validacion;
        }
    }
}

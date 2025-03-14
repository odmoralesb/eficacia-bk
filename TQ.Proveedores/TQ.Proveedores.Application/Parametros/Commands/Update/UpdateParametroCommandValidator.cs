using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using TQ.Proveedores.Domain.Enums;

namespace TQ.Proveedores.Application.Parametros.Commands
{
    public class Intervalo
    {
        public decimal Inicio { get; set; }
        public decimal Fin { get; set; }

        public Intervalo(decimal inicio, decimal fin)
        {
            Inicio = inicio;
            Fin = fin;
        }

        public bool EsValido()
        {
            return (Inicio < Fin);
        }
    }

    public class UpdateParametroCommandValidator : AbstractValidator<UpdateParametroCommand>
    {
        public UpdateParametroCommandValidator()
        {
            RuleFor(p => p.Nombre)
                .NotEmpty().WithMessage("El nombre del parámetro no puede estar vacío.")
                .MaximumLength(250).WithMessage("El nombre del parámetro no debe superar los 250 caracteres.");
            RuleFor(p => p.Descripcion)
                .MaximumLength(250).WithMessage("La descripción del parámetro no debe superar los 250 caracteres.");

            RuleFor(p => p)
                .Must(p => ValidarCampos(p)).WithMessage("Hay valores vacíos en el parámetro.")
                .Must(p => ValidarConfiguracionLimites(p)).WithMessage("Los intervalos no están bien configurados. Debe existir un intervalo mayor y uno menor")
                .Must(p => ValidarIntervalos(p)).WithMessage("Revisar los intervalos, ya que no son consecutivos y/o se superponen entre sí.");

            RuleFor(p => p.Detalles)
                .NotEmpty().WithMessage("El parámetro debe tener una estructura.");

            RuleForEach(p => p.Detalles)
                .SetValidator(new UpdateParametroDetalleValidator());

            RuleFor(p => p.Valores)
                .NotEmpty().WithMessage("El parámetro debe tener valores parametrizados.");

            RuleForEach(p => p.Valores).SetValidator(new UpdateParametroValorValidator());
        }

        private bool ValidarCampos(UpdateParametroCommand request)
        {
            bool validacion = true;
            foreach (var detalle in request.Detalles)
            {
                if (detalle.Id == null) continue;

                foreach (var campo in request.Valores)
                {
                    PropertyInfo propiedad = typeof(UpdateParametroValorCommand).GetProperty($"Campo{detalle.NumCampo}");
                    var valorCampo = propiedad.GetValue(campo);
                    if (String.IsNullOrEmpty(valorCampo?.ToString()))
                    {
                        validacion = false;
                        break;
                    }
                }
                if (!validacion) break;
            }
            return validacion;
        }

        private bool ValidarConfiguracionLimites(UpdateParametroCommand request)
        {
            int limiteInferior = request.Detalles.Where(x => x.TipoParametro == TipoParametro.INTERVALO_MENOR).Count();
            int limiteSuperior = request.Detalles.Where(x => x.TipoParametro == TipoParametro.INTERVALO_MAYOR).Count();

            return (limiteInferior == limiteSuperior);
        }

        private bool ValidarIntervalos(UpdateParametroCommand request)
        {
            //obtener las columnas intervalo
            var colIntervalos = request.Detalles.Where(x => x.TipoParametro == Domain.Enums.TipoParametro.INTERVALO_MENOR || x.TipoParametro == Domain.Enums.TipoParametro.INTERVALO_MAYOR);
            if (colIntervalos.Count() == 0) return true;

            var intervalos = new Dictionary<int, List<Intervalo>>();
            int fila = 0;
            int columna = 0;

            List<UpdateParametroDetalleCommand> intervaloMenor = colIntervalos
                                                                .Where(x => x.TipoParametro == Domain.Enums.TipoParametro.INTERVALO_MENOR)
                                                                .ToList();
            foreach (var menor in intervaloMenor)
            {
                PropertyInfo propiedad = typeof(UpdateParametroValorCommand).GetProperty($"Campo{menor.NumCampo}");
                if (propiedad == null) continue;
                intervalos[fila] = new List<Intervalo>();

                foreach (var campo in request.Valores)
                {
                    string valorCampo = propiedad.GetValue(campo)?.ToString() ?? "0";
                    intervalos[fila].Add(new Intervalo(decimal.Parse(valorCampo), 0));
                }
                fila++;
            }

            fila = 0;
            columna = 0;

            List<UpdateParametroDetalleCommand> intervaloMayor = colIntervalos
                                                                .Where(x => x.TipoParametro == Domain.Enums.TipoParametro.INTERVALO_MAYOR)
                                                                .ToList();
            foreach (var mayor in intervaloMayor)
            {
                PropertyInfo propiedad = typeof(UpdateParametroValorCommand).GetProperty($"Campo{mayor.NumCampo}");
                if (propiedad == null) continue;

                foreach (var campo in request.Valores)
                {
                    string valorCampo = propiedad.GetValue(campo)?.ToString() ?? "0";
                    intervalos[fila][columna].Fin = decimal.Parse(valorCampo);

                    if (!intervalos[fila][columna].EsValido()) return false;
                    columna++;
                }
                intervalos[fila].Sort((a, b) => a.Inicio.CompareTo(b.Inicio));
                fila++;
            }

            foreach (var item in intervalos.Values)
            {
                for (int j = 0; j < item.Count - 1; j++)
                {
                    // Verificar que los intervalos sean consecutivos
                    if (item[j].Fin != item[j + 1].Inicio)
                    {
                        return false;
                    }

                    // Verificar que los intervalos no se sobrepongan
                    if (item[j].Fin > item[j + 1].Inicio)
                    {
                        return false;
                    }
                }
            }

            return true;
        }
    }

    public class UpdateParametroDetalleValidator : AbstractValidator<UpdateParametroDetalleCommand>
    {
        public UpdateParametroDetalleValidator()
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

    public class UpdateParametroValorValidator : AbstractValidator<UpdateParametroValorCommand>
    {
        public UpdateParametroValorValidator()
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

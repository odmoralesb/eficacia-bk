using System;
using System.Collections.Generic;

namespace TQ.Proveedores.Application.Helpers
{
    public static class FechaUtils
    {
        public static DateTime CalcularFechaHabil(DateTime fechaInicio, int diasHabiles)
        {
            DateTime fechaActual = fechaInicio;
            int diasContados = 0;

            while (diasContados < diasHabiles)
            {
                fechaActual = fechaActual.AddDays(1);

                if (EsDiaHabil(fechaActual))
                {
                    diasContados++;
                }
            }

            return fechaActual;
        }

        private static bool EsDiaHabil(DateTime fecha)
        {
            // Consideramos sábados y domingos como no hábiles
            if (fecha.DayOfWeek == DayOfWeek.Saturday || fecha.DayOfWeek == DayOfWeek.Sunday)
            {
                return false;
            }

            // Aquí puedes agregar lógica adicional para manejar días festivos
            // Por ejemplo, puedes tener una lista de fechas festivas y verificar si la fecha está en esa lista
            List<DateTime> diasFestivos = ObtenerDiasFestivos(fecha.Year);
            return !diasFestivos.Contains(fecha.Date);
        }

        private static List<DateTime> ObtenerDiasFestivos(int año)
        {
            return new List<DateTime>
            {
                new DateTime(año, 1, 1),
                new DateTime(año, 5, 1),
                new DateTime(año, 7, 20),
                new DateTime(año, 8, 7),
                new DateTime(año, 12, 8),
                new DateTime(año, 12, 25)
            };
        }
    }
}

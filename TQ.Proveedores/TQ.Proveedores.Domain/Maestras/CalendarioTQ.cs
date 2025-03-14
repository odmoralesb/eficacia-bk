using System;
using TQ.Domain.Auditable;

namespace TQ.Proveedores.Domain.Maestras
{
    public class CalendarioTQ: BaseEntity
    {
        public Guid Id { get; set; }
        public string NombrePeriodo { get; set; }
        public DateTime FechaInicio { get; set; }
        public DateTime FechaFin { get; set; }
        public int Mes { get; set; }
        public int Trimestre { get; set; }
        public int Anio { get; set; }
    }
}

using System;
using System.Collections.Generic;
using TQ.Domain.Auditable;
using TQ.Proveedores.Domain.OrdenesDeCompra;

namespace TQ.Proveedores.Domain.Evaluaciones
{
    public class Evaluacion: BaseEntity
    {
        public Guid Id { get; set; }
        public string NombrePeriodo { get; set; }
        public decimal IndicadorFecha { get; set; }
        public decimal IndicadorCantidad { get; set; }
        public decimal IndicadorCalidad { get; set; }
        public decimal IndicadorCumplimiento { get; set; }
        public int Estado { get; set; }
        public ICollection<OrdenCompra> OrdenesCompra { get; set; }

        public Evaluacion()
        {
            OrdenesCompra = new HashSet<OrdenCompra>();
        }
    }
}

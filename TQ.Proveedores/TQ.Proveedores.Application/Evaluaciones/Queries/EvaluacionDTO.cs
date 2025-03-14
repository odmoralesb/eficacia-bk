using System;

namespace TQ.Proveedores.Application.Evaluaciones.Queries
{
    public class EvaluacionDTO
    {
        public string UnidadProductiva { get; set; }
        public string Comprador { get; set; }
        public Guid CompradorId { get; set; }
        public string Proveedor { get; set; }
        public Guid ProveedorId { get; set; }
        public string? Periodo { get; set; }
        public string NumOc { get; set; }
        public decimal IndicadorFecha { get; set; }
        public decimal IndicadorCantidad { get; set; }
        public decimal IndicadorCalidad { get; set; }
        public decimal IndicadorCumplimiento { get; set; }
        public int? Estado { get; set; }
        public Guid OrdenCompraId { get; set; }
        public Guid? EvaluacionId { get; set; }
    }
}

using System;
using System.Collections.Generic;

namespace TQ.Proveedores.Application.Evaluaciones.Queries
{
    public class FilaReporteDTO
    {
        public string UnidadProductiva { get; set; }
        public Guid CompradorId { get; set; }
        public string Comprador { get; set; }
        public Guid ProveedorId { get; set; }
        public string Proveedor { get; set; }
        public int Anio { get; set; }
        public string Trimestre { get; set; }
        public int Mes { get; set; }
        public int CantidadOC { get; set; }
        public decimal IndicadorFecha { get; set; }
        public decimal IndicadorCantidad { get; set; }
        public decimal IndicadorCalidad { get; set; }
        public decimal IndicadorCumplimiento { get; set; }
        public string PlanAccionComentario { get; set; }
        public string PlanAccion { get; set; }
    }
    public class ReporteDTO
    {
        public IEnumerable<FilaReporteDTO> Filas { get; set; }
        public decimal MinimoPuntaje { get; set; }
        public ReporteDTO()
        {
            Filas = new HashSet<FilaReporteDTO>();
        }
    }
}

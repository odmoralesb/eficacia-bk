namespace TQ.Proveedores.Application.ServiceAgents.DTO
{
    public class SummaryDTO
    {
        public string Periodo { get; set; }
        public decimal IndicadorCantidad { get; set; }
        public decimal IndicadorFecha { get; set; }
        public decimal IndicadorCalidad { get; set; }
        public decimal Desempenio { get; set; }
        public int CantidadOC { get; set; }
    }
}

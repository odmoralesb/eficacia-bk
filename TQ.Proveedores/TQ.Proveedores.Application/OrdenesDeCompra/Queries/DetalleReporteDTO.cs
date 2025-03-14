using System;

namespace TQ.Proveedores.Application.OrdenesDeCompra.Queries
{
    public class DetalleReporteDTO
    {
        public string NumOc { get; set; }
        public string Comprador { get; set; }
        public string Codigo { get; set; }
        public string Descripcion { get; set; }
        public string UnidadMedida { get; set; }
        public string TipoInsumo { get; set; }
        public string? Moneda { get; set; }
        public DateTime FechaCreacion { get; set; }
        public DateTime FechaDespacho { get; set; }
        public DateTime FechaRecibido { get; set; }
        public int Dias { get; set; }
        public int DiasAtraso { get; set; }
        public decimal CantidadSolicitada { get; set; }
        public decimal CantidadRecibida { get; set; }
        public decimal CantidadAceptada { get; set; }
        public decimal CantidadDevuelta { get; set; }
        public decimal IndicadorFecha { get; set; }
        public decimal IndicadorCantidad { get; set; }
        public decimal IndicadorCalidad { get; set; }
        public decimal Cumplimiento { get; set; }
        public string Urgencia { get; set; }
        public string Consignado { get; set; }
        public string? Comentario { get; set; }
        public string? Causal { get; set; }
        public string? NumLote { get; set; }

    }
}

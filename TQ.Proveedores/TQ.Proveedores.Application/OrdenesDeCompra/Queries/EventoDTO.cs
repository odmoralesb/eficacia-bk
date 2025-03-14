using System;

namespace TQ.Proveedores.Application.OrdenesDeCompra.Queries
{
    public class EventoDTO
    {
        public Guid Id { get; set; }
        public string Proveedor { get; set; }
        public string NumOc { get; set; }
        public string Periodo { get; set; }
        public string Codigo { get; set; }
        public string Descripcion { get; set; }
        public string UnidadMedida { get; set; }
        public string TipoInsumo { get; set; }
        public string Moneda { get; set; }
        public DateTime FechaCreacion { get; set; }
        public DateTime FechaDespacho { get; set; }
        public DateTime FechaRecibo { get; set; }
        public int LTM { get; set; }
        public int LTC { get; set; }
        public int LTR { get; set; }
        public int Dias { get; set; }
        public int DiasAtraso { get; set; }
        public decimal CantidadPedida { get; set; }
        public decimal CantidadAceptada { get; set; }
        public decimal CantidadDevuelta { get; set; }
        public decimal IndicadorFecha { get; set; }
        public decimal IndicadorFechaSys { get; set; }
        public decimal IndicadorCantidad { get; set; }
        public decimal IndicadorCantidadSys { get; set; }
        public decimal IndicadorCalidad { get; set; }
        public decimal IndicadorCalidadSys { get; set; }
        public decimal Cumplimiento { get; set; }
        public string Urgencia { get; set; }
        public string Consignado { get; set; }
        public Guid? CausalId { get; set; }
        public string Comentario { get; set; }
        public bool CompraDesarrollo { get; set; }
        public string Rechazo { get; set; }
        public int? CodigoCausal { get; set; }
    }
}
using System;
using TQ.Domain.Auditable;
using TQ.Proveedores.Domain.Maestras;

namespace TQ.Proveedores.Domain.OrdenesDeCompra
{
    public class Evento : BaseEntity
    {
        public Guid Id { get; set; }
        public string NumOC { get; set; }
        public DateTime FechaDespacho { get; set; }
        public DateTime FechaRecepcion { get; set; }
        public int LeadTimeMaestra { get; set; }
        public int LeadTimeCalculado { get; set; }
        public int LeadTimeReal { get; set; }
        public int Dias { get; set; }
        public int DiasAtraso { get; set; }
        public decimal CantidadSolicitada { get; set; }
        public decimal CantidadRecibida { get; set; }
        public decimal CantidadAceptada { get; set; }
        public decimal CantidadRechazada { get; set; }
        public decimal CantidadDevuelta { get; set; }
        public bool Consignado { get; set; }
        public bool Urgencia { get; set; }
        public int EntregaDirecta { get; set; }
        public string CodigoCalidad { get; set; }
        public decimal IndicadorFecha { get; set; }
        public decimal IndicadorFechaSys { get; set; }
        public decimal IndicadorCantidad { get; set; }
        public decimal IndicadorCantidadSys { get; set; }
        public decimal IndicadorCalidad { get; set; }
        public decimal IndicadorCalidadSys { get; set; }
        public decimal IndicadorCumplimiento { get; set; }
        public decimal IndicadorCumplimientoDefinitivo { get; set; }
        public string Comentario { get; set; }
        public Guid OrdenCompraId { get; set; }
        public OrdenCompra OrdenCompra { get; set; }
        public Guid? CausalId { get; set; }
        public Causal Causal { get; set; }
        public string Periodo { get; set; }
        public int Estado { get; set; }
        public string NumLote { get; set; }

    }
}

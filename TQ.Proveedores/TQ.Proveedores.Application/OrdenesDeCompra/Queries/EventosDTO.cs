using System;

namespace TQ.Proveedores.Application.OrdenesDeCompra.Queries
{
    public class EventosDTO
    {
        public Guid Id { get; set; }
        public bool Seleccionado { get; set; }
        public string Proveedor { get; set; }
        public Guid ProveedorId { get; set; }
        public string CodigoInsumo { get; set; }
        public string DescripcionInsumo { get; set; }
        public string NumOc { get; set; }
        public string Comprador { get; set; }
        public Guid CompradorId { get; set; }
        public string Periodo { get; set; }
        public string UnidadProductiva { get; set; }
        public DateTime FechaCreacion { get; set; }
        public int LTM { get; set; }
        public int LTC { get; set; }
        public int LTR { get; set; }
        public int Dias { get; set; }
        public int DiasAtraso { get; set; }
        public decimal IndicadorFecha { get; set; }
        public decimal IndicadorFechaSys { get; set; }
        public decimal CantidadPedida { get; set; }
        public decimal CantidadRecibida { get; set; }
        public decimal CantidadAceptada { get; set; }
        public decimal IndicadorCantidad { get; set; }
        public decimal IndicadorCantidadSys { get; set; }
        public string EstadoLote { get; set; }
        public string NumeroLote { get; set; }
        public decimal IndicadorCalidad { get; set; }
        public decimal IndicadorCalidadSys { get; set; }
        public decimal IndicadorCumplimiento { get; set; }
        public int? Estado { get; set; }
        public Guid OrdenCompraId { get; set; }
        public int? CodigoCausal { get; set; }
        public string Comentario { get; set; }
        public bool CompraDesarrollo { get; set; }
        public string Consignado { get; set; }
        public string TipoOc { get; set; }

    }
}
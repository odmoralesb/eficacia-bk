using System;
using System.ComponentModel;

namespace TQ.Proveedores.Application.ServiceAgents.DTO
{
    public class OrdenCompraReportDTO
    {
        [Description("Unidad Productiva")]
        public string UnidadProductiva { get; set; }
        [Description("Comprador")]
        public string Comprador { get; set; }
        [Description("Proveedor")]
        public string Proveedor { get; set; }
        [Description("Periodo")]
        public string? Periodo { get; set; }
        [Description("# OC")]
        public string NumOC { get; set; }
        [Description("Código Insumo/Servicio")]
        public string Codigo { get; set; }
        [Description("Descripción Insumo/Servicio")]
        public string Descripcion { get; set; }
        [Description("Unidad de medida")]
        public string UnidadMedida { get; set; }
        [Description("Tipo de insumo")]
        public string TipoInsumo { get; set; }
        [Description("Moneda")]
        public string Moneda { get; set; }
        [Description("Fecha de creación")]
        public DateTime FechaCreacion { get; set; }
        [Description("Fecha de despacho")]
        public DateTime FechaDespacho { get; set; }
        [Description("Fecha de recibo")]
        public DateTime FechaRecibo { get; set; }
        [Description("LeadTime Maestra")]
        public int LTM { get; set; }
        [Description("LeadTime Calculado")]
        public int LTC { get; set; }
        [Description("LeadTime Real")]
        public int LTR { get; set; }
        [Description("Días")]
        public int Dias { get; set; }
        [Description("Días de Atraso")]
        public int DiasAtraso { get; set; }
        [Description("Indicador Fecha Oportuna")]
        public decimal IndicadorFecha { get; set; }
        [Description("Indicador Fecha Oportuna Sistema")]
        public decimal IndicadorFechaSys { get; set; }
        [Description("Cantidad Pedida")]
        public decimal CantidadPedida { get; set; }
        [Description("Cantidad Recibida")]
        public decimal CantidadRecibida { get; set; }
        [Description("Cantidad Aceptada")]
        public decimal CantidadAceptada { get; set; }
        [Description("Cantidad Devuelta")]
        public decimal CantidadDevuelta { get; set; }
        [Description("Indicador Cantidad")]
        public decimal IndicadorCantidad { get; set; }
        [Description("Indicador Cantidad Sistema")]
        public decimal IndicadorCantidadSys { get; set; }
        [Description("Indicador Calidad")]
        public decimal IndicadorCalidad { get; set; }
        [Description("Indicador Calidad Sistema")]
        public decimal IndicadorCalidadSys { get; set; }
        [Description("Cumplimiento")]
        public decimal IndicadorCumplimiento { get; set; }
        [Description("Tiene Urgencia")]
        public string Urgencia { get; set; }
        [Description("Es Consignado")]
        public string Consignado { get; set; }
        [Description("Causal")]
        public string? Causal { get; set; }
        [Description("Comentario")]
        public string Comentario { get; set; }
        [Description("Es Compra Para Desarrollo")]
        public string CompraDesarrollo { get; set; }

        public string? NumLote { get; set; }
    }
}

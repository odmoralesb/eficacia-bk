using System;
using System.Collections.Generic;
using TQ.Domain.Auditable;
using TQ.Proveedores.Domain.Configuracion;
using TQ.Proveedores.Domain.Evaluaciones;
using TQ.Proveedores.Domain.Maestras;

namespace TQ.Proveedores.Domain.OrdenesDeCompra
{
    public class OrdenCompra: BaseEntity
    {
        public Guid Id { get; set; }
        public string NumOC { get; set; }
        public string UnidadProductiva { get; set; }
        public DateTime FechaCreacion { get; set; }
        public Guid ProveedorId { get; set; }
        public Guid CompradorId { get; set; }
        public string CodInsumoServ { get; set; }
        public string DescInsumoServ { get; set; }
        public string TipoInsumo { get; set; }
        public string Moneda { get; set; }
        public string UnidadMedida { get; set; }
        public bool CompraDesarrollo { get; set; }
        public string TipoOC { get; set; }
        public int OrganizacionId { get; set; }

        public virtual Proveedor Proveedor { get; set; }
        public virtual Usuario Comprador { get; set; }
        public ICollection<Evento> Eventos { get; set; }
        public ICollection<Evaluacion> Evaluaciones { get; set; }
    }
}

using System;
using TQ.Domain.Auditable;
using TQ.Proveedores.Domain.Configuracion;
using TQ.Proveedores.Domain.Maestras;

namespace TQ.Proveedores.Domain.Evaluaciones
{
    public class SolicitudCambioEstado: BaseEntity
    {
        public Guid Id { get; set; }
        public Guid CompradorId { get; set; }
        public Guid ProveedorId { get; set; }
        public string Periodo { get; set; }
        public string Estado { get; set; }
        public string Observaciones { get; set; }
        public DateTime FechaCreacion { get; set; }
        public DateTime? FechaAprobacion { get; set; }
        public DateTime? FechaCierre { get; set; }
        public Guid AprobadorId { get; set; }

        public virtual Usuario Comprador { get; set; }
        public virtual Proveedor Proveedor { get; set; }
        public virtual Usuario Aprobador { get; set; }
    }
}
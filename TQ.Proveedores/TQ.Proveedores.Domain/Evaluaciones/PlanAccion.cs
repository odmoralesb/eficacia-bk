using System;
using TQ.Domain.Auditable;
using TQ.Proveedores.Domain.Configuracion;
using TQ.Proveedores.Domain.Maestras;

namespace TQ.Proveedores.Domain.Evaluaciones
{
    public class PlanAccion: BaseEntity
    {
        public Guid Id { get; set; }
        public int Trimestre { get; set; }
        public int Anio { get; set; }
        public string Accion { get; set; }
        public string Comentario { get; set; }
        public string CompromisoCorporativoId { get; set; }
        public Guid ProveedorId { get; set; }
        public Proveedor Proveedor { get; set; }
        public Guid CompradorId { get; set; }
        public Usuario Comprador { get; set; }
    }
}

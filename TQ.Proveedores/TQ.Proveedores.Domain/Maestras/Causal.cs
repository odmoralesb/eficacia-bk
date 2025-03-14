using System;
using System.Collections.Generic;
using TQ.Domain.Auditable;
using TQ.Proveedores.Domain.OrdenesDeCompra;

namespace TQ.Proveedores.Domain.Maestras
{
    public class Causal: BaseEntity
    {
        public Guid Id { get; set; }
        public int CodigoCausal { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public bool Activo { get; set; }

        public virtual ICollection<Evento> Eventos { get; set; }
    }
}

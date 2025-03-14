using System;
using System.Collections.Generic;
using TQ.Domain.Auditable;

namespace TQ.Proveedores.Domain.Configuracion
{
    public class Rol: BaseEntity
    {
        public Guid Id { get; set; }
        public string Nombre { get; set; }
        public ICollection<Usuario> Usuarios { get; set; }
    }
}

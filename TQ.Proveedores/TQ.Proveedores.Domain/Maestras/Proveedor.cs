using System;
using TQ.Domain.Auditable;

namespace TQ.Proveedores.Domain.Maestras
{
    public class Proveedor: BaseEntity
    {
        public Guid Id { get; set; }
        public string Nit { get; set; }
        public string RazonSocial { get; set; }
        public string ListaCorreoElectronico { get; set; }
    }
}

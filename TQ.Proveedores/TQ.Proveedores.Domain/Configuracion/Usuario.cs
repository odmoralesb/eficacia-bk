using System;
using TQ.Domain.Auditable;

namespace TQ.Proveedores.Domain.Configuracion
{
    public class Usuario: BaseEntity
    {
        public Guid Id { get; set; }
        public string NombreUsuario { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string CorreoElectronico { get; set; }
        public Guid RolId { get; set; }
        public Guid? JefeDirectoId { get; set; }

        public virtual Rol Rol { get; set; }
        public virtual Usuario JefeDirecto { get; set; }

        public string GetNombreCompleto()
        {
            return $"{this.Nombre} {this.Apellido}";
        }
    }
}

using System;
using TQ.Proveedores.Domain.Configuracion;
using TQ.Utils.AutoMapperUtils;

namespace TQ.Proveedores.Application.Configuracion.Queries
{
    public class UsuarioDTO : IMapFrom<Usuario>
    {
        public Guid Id { get; set; }
        public string NombreUsuario { get; set; }
        public string CorreoElectronico { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public Guid RolId { get; set; }
        public RolDTO Rol { get; set; }
        public Guid? JefeDirectoId { get; set; }
        public UsuarioDTO JefeDirecto { get; set; }
    }
}

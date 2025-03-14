using System;
using TQ.Proveedores.Domain.Configuracion;
using TQ.Utils.AutoMapperUtils;

namespace TQ.Proveedores.Application.Usuarios.Queries
{
    public class UsuarioDTO : IMapFrom<Usuario>
    {
        public string Id { get; set; }
        public string NombreUsuario { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string CorreoElectronico { get; set; }
        public string RolId { get; set; }
        public string JefeDirectoId { get; set; }
        public string NombreCompleto { get; set; }
        public dynamic Rol { get; set; }
        public dynamic JefeDirecto { get; set; }
    }
}
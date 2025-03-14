using System;
using TQ.Proveedores.Domain.Configuracion;
using TQ.Utils.AutoMapperUtils;

namespace TQ.Proveedores.Application.Configuracion.Queries
{
    public class RolDTO : IMapFrom<Rol>
    {
        public Guid Id { get; set; }
        public string Nombre { get; set; }
    }
}

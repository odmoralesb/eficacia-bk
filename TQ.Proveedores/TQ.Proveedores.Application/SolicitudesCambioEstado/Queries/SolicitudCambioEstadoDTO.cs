using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TQ.Proveedores.Domain.Evaluaciones;
using TQ.Utils.AutoMapperUtils;

namespace TQ.Proveedores.Application.SolicitudesCambioEstado.Queries
{
    public class SolicitudCambioEstadoDTO : IMapFrom<SolicitudCambioEstado>
    {
        public string Id { get; set; }
        public string ProveedorId { get; set; }
        public string NombreProveedor { get; set; }
        public string CompradorId { get; set; }
        public string NombreComprador { get; set; }
        public string AprobadorId { get; set; }
        public string NombreAprobador { get; set; }
        public string NombreUsuarioComprador { get; set; }
        public string NombreUsuarioAprobador { get; set; }
        public string Periodo { get; set; }
        public string FechaCreacion { get; set; }
        public string Estado { get; set; }
        public string Observaciones { get; set; }
    }
}
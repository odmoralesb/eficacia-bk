using System;
using System.Collections.Generic;
using System.Text;
using TQ.Proveedores.Domain.Configuracion;
using TQ.Proveedores.Domain.Evaluaciones;
using TQ.Proveedores.Domain.Maestras;
using TQ.Utils.AutoMapperUtils;

namespace TQ.Proveedores.Application.PlanesDeAccion.Queries
{
    public class PlanAccionDTO
    {
        public string Comprador { get; set; }
        public string Accion { get; set; }
        public string Comentario { get; set; }
        public DateTime FechaCreacion { get; set; }

    }
}

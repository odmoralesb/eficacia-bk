using System;
using System.Collections.Generic;
using TQ.Domain.Auditable;

namespace TQ.Proveedores.Domain.Parametros
{
    public class Parametro: BaseEntity
    {
        public Guid Id { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public int OrganizacionId { get; set; }
        public ICollection<ParametroDetalle> Detalles { get; set;}
        public ICollection<ParametroValor> Valores { get; set;}
    }
}

using System;
using TQ.Domain.Auditable;
using TQ.Proveedores.Domain.Enums;

namespace TQ.Proveedores.Domain.Parametros
{
    public class ParametroDetalle: BaseEntity
    {
        public Guid Id { get; set; }
        public int NumCampo { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public TipoParametro TipoParametro { get; set; }
        public Guid ParametroId { get; set; }
        public virtual Parametro Parametro { get; set; }
    }
}

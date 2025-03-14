using System;
using TQ.Domain.Auditable;

namespace TQ.Proveedores.Domain.Parametros
{
    public class ParametroValor: BaseEntity
    {
        public Guid Id { get; set; }
        public string Campo1 { get; set; }
        public string Campo2 { get; set; }
        public string Campo3 { get; set; }
        public string Campo4 { get; set; }
        public string Campo5 { get; set; }
        public string Campo6 { get; set; }
        public string Campo7 { get; set; }
        public string Campo8 { get; set; }
        public string Campo9 { get; set; }
        public string Campo10 { get; set; }
        public Guid ParametroId { get; set; }
        public virtual Parametro Parametro { get; set; }
    }
}

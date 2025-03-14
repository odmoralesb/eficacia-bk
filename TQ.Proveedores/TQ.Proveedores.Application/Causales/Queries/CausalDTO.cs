using TQ.Proveedores.Domain.Maestras;
using TQ.Utils.AutoMapperUtils;

namespace TQ.Proveedores.Application.Causales.Queries
{
    public class CausalDTO : IMapFrom<Causal>
    {
        public string Id { get; set; }
        public int CodigoCausal {  get; set; }
        public string Nombre { get; set; }
        public string Descripcion {  get; set; }
        public bool Activo { get; set; }
    }
}

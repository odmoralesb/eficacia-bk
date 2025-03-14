using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using TQ.Infraestructure.EFrameworkCore.SqlServer.Mapping;
using TQ.Proveedores.Domain.Evaluaciones;

namespace TQ.Proveedores.Infraestructure.Data.Mapping.Evaluaciones
{
    public class PlanAccionMap : EntityTypeConfiguration<PlanAccion>
    {
        public override void Configure(EntityTypeBuilder<PlanAccion> builder)
        {
            builder.ToTable("EP_" + nameof(PlanAccion));
            builder.Property(p => p.CompromisoCorporativoId)
                .IsRequired()
                .HasMaxLength(200);
            base.Configure(builder);
        }
    }
}

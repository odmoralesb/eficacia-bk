using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using TQ.Infraestructure.EFrameworkCore.SqlServer.Mapping;
using TQ.Proveedores.Domain.Maestras;

namespace TQ.Proveedores.Infraestructure.Data.Mapping.Maestras
{
    public class CausalMap : EntityTypeConfiguration<Causal>
    {
        public override void Configure(EntityTypeBuilder<Causal> builder)
        {
            builder.ToTable("EP_" + nameof(Causal));
            builder.Property(p => p.CodigoCausal)
                .IsRequired();
            builder.Property(p => p.Nombre)
                .IsRequired()
                .HasMaxLength(80);
            builder.Property(p => p.Descripcion)
                .IsRequired()
                .HasMaxLength(240);
            base.Configure(builder);
        }
    }
}

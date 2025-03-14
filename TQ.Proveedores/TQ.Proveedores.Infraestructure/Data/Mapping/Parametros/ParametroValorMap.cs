using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using TQ.Infraestructure.EFrameworkCore.SqlServer.Mapping;
using TQ.Proveedores.Domain.Parametros;

namespace TQ.Proveedores.Infraestructure.Data.Mapping.Parametros
{
    public class ParametroValorMap : EntityTypeConfiguration<ParametroValor>
    {
        public override void Configure(EntityTypeBuilder<ParametroValor> builder)
        {
            builder.ToTable("EP_" + nameof(ParametroValor));
            builder.Property(p => p.Campo1).HasMaxLength(255);
            builder.Property(p => p.Campo2).HasMaxLength(255);
            builder.Property(p => p.Campo3).HasMaxLength(255);
            builder.Property(p => p.Campo4).HasMaxLength(255);
            builder.Property(p => p.Campo5).HasMaxLength(255);
            builder.Property(p => p.Campo6).HasMaxLength(255);
            builder.Property(p => p.Campo7).HasMaxLength(255);
            builder.Property(p => p.Campo8).HasMaxLength(255);
            builder.Property(p => p.Campo9).HasMaxLength(255);
            builder.Property(p => p.Campo10).HasMaxLength(255);

            base.Configure(builder);
        }
    }
}

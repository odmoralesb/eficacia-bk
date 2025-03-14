using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using TQ.Infraestructure.EFrameworkCore.SqlServer.Mapping;
using TQ.Proveedores.Domain.Enums;
using TQ.Proveedores.Domain.Parametros;

namespace TQ.Proveedores.Infraestructure.Data.Mapping.Parametros
{
    public class ParametroDetalleMap : EntityTypeConfiguration<ParametroDetalle>
    {
        public override void Configure(EntityTypeBuilder<ParametroDetalle> builder)
        {
            builder.ToTable("EP_" + nameof(ParametroDetalle));
            builder.Property(p => p.NumCampo).IsRequired();
            builder.Property(p => p.TipoParametro)
                .IsRequired()
                .HasDefaultValue(TipoParametro.TEXTO);
            builder.Property(p => p.Nombre)
                .IsRequired()
                .HasMaxLength(250);
            builder.Property(p => p.Descripcion)
                .HasMaxLength(250);
            base.Configure(builder);
        }
    }
}

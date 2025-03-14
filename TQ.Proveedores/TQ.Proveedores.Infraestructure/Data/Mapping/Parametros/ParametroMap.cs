using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using TQ.Infraestructure.EFrameworkCore.SqlServer.Mapping;
using TQ.Proveedores.Domain.Parametros;

namespace TQ.Proveedores.Infraestructure.Data.Mapping.Parametros
{
    public class ParametroMap : EntityTypeConfiguration<Parametro>
    {
        public override void Configure(EntityTypeBuilder<Parametro> builder)
        {
            builder.ToTable("EP_" + nameof(Parametro));
            builder.Property(p => p.Nombre)
                .IsRequired()
                .HasMaxLength(250);
            builder.Property(p => p.Descripcion)
                .HasMaxLength(250);
            builder.Property(p => p.OrganizacionId)
                .HasDefaultValue(155);
            base.Configure(builder);
        }
    }
}

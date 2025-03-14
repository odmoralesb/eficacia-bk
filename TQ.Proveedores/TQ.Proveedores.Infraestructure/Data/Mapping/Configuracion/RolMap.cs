using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using TQ.Infraestructure.EFrameworkCore.SqlServer.Mapping;
using TQ.Proveedores.Domain.Configuracion;

namespace TQ.Proveedores.Infraestructure.Data.Mapping.Configuracion
{
    public class RolMap : EntityTypeConfiguration<Rol>
    {
        public override void Configure(EntityTypeBuilder<Rol> builder)
        {
            builder.ToTable("EP_"+nameof(Rol));
            builder.Property(p => p.Nombre)
                .IsRequired()
                .HasMaxLength(50);
            base.Configure(builder);
        }
    }
}

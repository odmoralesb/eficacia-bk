using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using TQ.Infraestructure.EFrameworkCore.SqlServer.Mapping;
using TQ.Proveedores.Domain.Configuracion;

namespace TQ.Proveedores.Infraestructure.Data.Mapping.Configuracion
{
    public class UsuarioMap: EntityTypeConfiguration<Usuario>
    {
        public override void Configure(EntityTypeBuilder<Usuario> builder)
        {
            builder.ToTable("EP_" + nameof(Usuario));
            builder.Property(p => p.NombreUsuario)
                .IsRequired()
                .HasMaxLength(50);
            builder.Property(p => p.Nombre).HasMaxLength(150);
            builder.Property(p => p.Apellido).HasMaxLength(150);
            builder.Property(p => p.CorreoElectronico).HasMaxLength(100);
            base.Configure(builder);
        }
    }
}

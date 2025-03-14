using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using TQ.Infraestructure.EFrameworkCore.SqlServer.Mapping;
using TQ.Proveedores.Domain.Maestras;

namespace TQ.Proveedores.Infraestructure.Data.Mapping.Maestras
{
    public class ProveedorMap : EntityTypeConfiguration<Proveedor>
    {
        public override void Configure(EntityTypeBuilder<Proveedor> builder)
        {
            builder.ToTable("EP_" + nameof(Proveedor));
            builder.Property(p => p.Nit)
                .IsRequired()
                .HasMaxLength(30);
            builder.Property(p => p.RazonSocial)
                .IsRequired()
                .HasMaxLength(240);
            builder.Property(p => p.ListaCorreoElectronico)
                .IsRequired()
                .HasMaxLength(5000);

            base.Configure(builder);
        }
    }
}

using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using TQ.Infraestructure.EFrameworkCore.SqlServer.Mapping;
using TQ.Proveedores.Domain.Evaluaciones;

namespace TQ.Proveedores.Infraestructure.Data.Mapping.Evaluaciones;

public class SolicitudCambioEstadoMap : EntityTypeConfiguration<SolicitudCambioEstado>
{
    public override void Configure(EntityTypeBuilder<SolicitudCambioEstado> builder)
    {
        builder.ToTable("EP_" + nameof(SolicitudCambioEstado));
        builder.HasKey(p => p.Id);
        builder.Property(p => p.Id).IsRequired();
        builder.Property(p => p.CompradorId).IsRequired();
        builder.Property(p => p.ProveedorId).IsRequired();
        builder.Property(p => p.Periodo).IsRequired().HasMaxLength(6);
        builder.Property(p => p.Estado).IsRequired().HasMaxLength(200);
        builder.Property(p => p.Observaciones).HasMaxLength(2000);
        builder.Property(p => p.FechaCreacion).IsRequired();
        builder.Property(p => p.FechaAprobacion);
        builder.Property(p => p.FechaCierre);
        builder.Property(p => p.AprobadorId).IsRequired();
        builder.HasOne(p => p.Comprador).WithMany().HasForeignKey(p => p.CompradorId);
        builder.HasOne(p => p.Proveedor).WithMany().HasForeignKey(p => p.ProveedorId);
        builder.HasOne(p => p.Aprobador).WithMany().HasForeignKey(p => p.AprobadorId);
        base.Configure(builder);
    }
}

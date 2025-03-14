using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using TQ.Infraestructure.EFrameworkCore.SqlServer.Mapping;
using TQ.Proveedores.Domain.Evaluaciones;
using TQ.Proveedores.Domain.OrdenesDeCompra;

namespace TQ.Proveedores.Infraestructure.Data.Mapping.OrdenesDeCompra
{
    public class OrdenCompraMap: EntityTypeConfiguration<OrdenCompra>
    {
        public override void Configure(EntityTypeBuilder<OrdenCompra> builder)
        {
            builder.ToTable("EP_" + nameof(OrdenCompra));
            builder.Property(p => p.NumOC)
                .IsRequired()
                .HasMaxLength(30);
            builder.Property(p => p.UnidadProductiva)
                .HasMaxLength(200);
            builder.Property(p => p.CodInsumoServ)
                .IsRequired()
                .HasMaxLength(30);
            builder.Property(p => p.DescInsumoServ)
                .HasMaxLength(240);
            builder.Property(p => p.TipoInsumo)
                .HasMaxLength(200);
            builder.Property(p => p.Moneda)
                .HasMaxLength(10);
            builder.Property(p => p.UnidadMedida)
                .HasMaxLength(25);
            builder.Property(p => p.TipoOC)
                .IsRequired()
                .HasMaxLength(10);
            builder.Property(p => p.CompraDesarrollo)
                .IsRequired()
            .HasDefaultValue(false);
            builder.Property(p => p.OrganizacionId)
                .HasDefaultValue(0);

            builder
                .HasMany(e => e.Evaluaciones)
                .WithMany(e => e.OrdenesCompra)
                .UsingEntity(
                    "EP_Evaluacion_OrdenCompra",
                    l => l.HasOne(typeof(Evaluacion)).WithMany().OnDelete(DeleteBehavior.Cascade).HasForeignKey("EvaluacionesId").HasPrincipalKey(nameof(Evaluacion.Id)),
                    r => r.HasOne(typeof(OrdenCompra)).WithMany().OnDelete(DeleteBehavior.Cascade).HasForeignKey("OrdenesCompraId").HasPrincipalKey(nameof(OrdenCompra.Id)),
                    j => j.HasKey("EvaluacionesId", "OrdenesCompraId")
                );

            base.Configure(builder);
        }
    }
}

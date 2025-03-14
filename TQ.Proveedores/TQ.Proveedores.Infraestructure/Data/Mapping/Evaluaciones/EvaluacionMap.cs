using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using TQ.Infraestructure.EFrameworkCore.SqlServer.Mapping;
using TQ.Proveedores.Domain.Evaluaciones;

namespace TQ.Proveedores.Infraestructure.Data.Mapping.Evaluaciones
{
    public class EvaluacionMap : EntityTypeConfiguration<Evaluacion>
    {
        public override void Configure(EntityTypeBuilder<Evaluacion> builder)
        {
            builder.ToTable("EP_" + nameof(Evaluacion));
            builder.Property(p => p.NombrePeriodo)
                .IsRequired()
                .HasMaxLength(15);
            builder.Property(p => p.Estado)
                .IsRequired()
                .HasDefaultValue(1);
            builder.Property(p => p.IndicadorFecha)
                .HasDefaultValue(0)
                .HasPrecision(5, 1);
            builder.Property(p => p.IndicadorCantidad)
                .HasDefaultValue(0)
                .HasPrecision(5, 1);
            builder.Property(p => p.IndicadorCalidad)
                .HasDefaultValue(0)
                .HasPrecision(5, 1);
            builder.Property(p => p.IndicadorCumplimiento)
                .HasDefaultValue(0)
                .HasPrecision(5, 1);
            base.Configure(builder);
        }
    }
}

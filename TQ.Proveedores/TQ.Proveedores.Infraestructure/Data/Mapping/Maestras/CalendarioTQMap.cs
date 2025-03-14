using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using TQ.Infraestructure.EFrameworkCore.SqlServer.Mapping;
using TQ.Proveedores.Domain.Maestras;

namespace TQ.Proveedores.Infraestructure.Data.Mapping.Maestras
{
    public class CalendarioTQMap : EntityTypeConfiguration<CalendarioTQ>
    {
        public override void Configure(EntityTypeBuilder<CalendarioTQ> builder)
        {
            builder.ToTable("EP_" + nameof(CalendarioTQ));
            builder.Property(p => p.NombrePeriodo)
                .IsRequired()
                .HasMaxLength(15);
            builder.Property(p => p.FechaInicio).IsRequired();
            builder.Property(p => p.FechaFin).IsRequired();
            builder.Property(p => p.Mes).IsRequired();
            builder.Property(p => p.Trimestre).IsRequired();
            builder.Property(p => p.Anio).IsRequired();
            base.Configure(builder);
        }
    }
}

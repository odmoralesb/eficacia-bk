using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using TQ.Infraestructure.EFrameworkCore.SqlServer.Mapping;
using TQ.Proveedores.Domain.OrdenesDeCompra;

namespace TQ.Proveedores.Infraestructure.Data.Mapping.OrdenesDeCompra
{
    public class EventoMap : EntityTypeConfiguration<Evento>
    {
        public override void Configure(EntityTypeBuilder<Evento> builder)
        {
            builder.ToTable("EP_" + nameof(Evento));
            builder.Property(p => p.NumOC)
                .IsRequired()
                .HasMaxLength(30);
            builder.Property(p => p.Periodo)
                .IsRequired()
                .HasMaxLength(6);
            builder.Property(p => p.LeadTimeMaestra)
                .IsRequired()
                .HasDefaultValue(0);
            builder.Property(p => p.LeadTimeCalculado)
                .IsRequired()
                .HasDefaultValue(0);
            builder.Property(p => p.LeadTimeReal)
                .IsRequired()
                .HasDefaultValue(0);
            builder.Property(p => p.Dias)
                .IsRequired()
                .HasDefaultValue(0);
            builder.Property(p => p.DiasAtraso)
                .IsRequired()
                .HasDefaultValue(0);
            builder.Property(p => p.CantidadAceptada)
                .IsRequired()
                .HasDefaultValue(0)
                .HasPrecision(19, 5);
            builder.Property(p => p.CantidadDevuelta)
                .IsRequired()
                .HasDefaultValue(0)
                .HasPrecision(19, 5);
            builder.Property(p => p.CantidadRechazada)
                .IsRequired()
                .HasDefaultValue(0)
                .HasPrecision(19, 5);
            builder.Property(p => p.CantidadRecibida)
                .IsRequired()
                .HasDefaultValue(0)
                .HasPrecision(19, 5);
            builder.Property(p => p.CantidadSolicitada)
                .IsRequired()
                .HasDefaultValue(0)
                .HasPrecision(19, 5);
            builder.Property(p => p.Consignado)
                .IsRequired()
                .HasDefaultValue(false);
            builder.Property(p => p.Urgencia)
                .IsRequired()
                .HasDefaultValue(false);
            builder.Property(p => p.EntregaDirecta)
                .IsRequired()
                .HasDefaultValue(0);
            builder.Property(p => p.CodigoCalidad)
                .IsRequired()
                .HasMaxLength(50);
            builder.Property(p => p.IndicadorCalidad)
                .IsRequired()
                .HasDefaultValue(0)
                .HasPrecision(5, 1);
            builder.Property(p => p.IndicadorCalidadSys)
                .IsRequired()
                .HasDefaultValue(0)
                .HasPrecision(5, 1);
            builder.Property(p => p.IndicadorCantidad)
                .IsRequired()
                .HasDefaultValue(0)
                .HasPrecision(5, 1);
            builder.Property(p => p.IndicadorCantidadSys)
                .IsRequired()
                .HasDefaultValue(0)
                .HasPrecision(5, 1);
            builder.Property(p => p.IndicadorCumplimiento)
                .IsRequired()
                .HasDefaultValue(0)
                .HasPrecision(5, 1);
            builder.Property(p => p.IndicadorCumplimientoDefinitivo)
                .IsRequired()
                .HasDefaultValue(0)
                .HasPrecision(5, 1);
            builder.Property(p => p.IndicadorFecha)
                .IsRequired()
                .HasDefaultValue(0)
                .HasPrecision(5, 1);
            builder.Property(p => p.IndicadorFechaSys)
                .IsRequired()
                .HasDefaultValue(0)
                .HasPrecision(5, 1);
            builder.Property(p => p.Comentario)
                .HasMaxLength(4000);
            builder.Navigation(e => e.OrdenCompra)
                .AutoInclude();
            builder.Property(p => p.Estado)
                .HasDefaultValue(1);
            builder.Property(p => p.NumLote)
                .HasMaxLength(80);
            base.Configure(builder);
        }
    }
}

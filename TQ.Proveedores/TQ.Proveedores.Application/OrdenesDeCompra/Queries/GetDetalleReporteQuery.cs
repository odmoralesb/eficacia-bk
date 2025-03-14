using MediatR;
using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using TQ.Proveedores.Application.Repositories;
using TQ.Util.MediatRUtils;

namespace TQ.Proveedores.Application.OrdenesDeCompra.Queries
{
    public class GetDetalleReporteQuery : IRequest<ResponseBase<List<DetalleReporteDTO>>>
    {
        public Guid ProveedorId { get; set; }
        public Guid CompradorId { get; set; }
        public string UnidadProductiva { get; set; }
        public int Anio { get; set; }
        public int Mes { get; set; }
    }

    public class GetDetalleReporteQueryHandle : IRequestHandler<GetDetalleReporteQuery, ResponseBase<List<DetalleReporteDTO>>>
    {
        private readonly IReportRepository<DetalleReporteDTO> _reportRepository;

        public GetDetalleReporteQueryHandle(IReportRepository<DetalleReporteDTO> reportRepository)
        {
            _reportRepository = reportRepository;
        }
        public async Task<ResponseBase<List<DetalleReporteDTO>>> Handle(GetDetalleReporteQuery request, CancellationToken cancellationToken)
        {
            string query = @$"
            SELECT
				OC.NumOC,
				CONCAT(U.Nombre, ' ', U.Apellido) Comprador,
				OC.CodInsumoServ Codigo,
				OC.DescInsumoServ Descripcion,
				OC.UnidadMedida,
				OC.TipoInsumo,
				COALESCE(OC.Moneda, '') Moneda,
				OC.FechaCreacion,
				EV.FechaDespacho,
				EV.FechaRecepcion FechaRecibido,
				EV.Dias,
				EV.DiasAtraso,
				EV.CantidadSolicitada,
				EV.CantidadRecibida,
				EV.CantidadAceptada,
				EV.CantidadDevuelta,
				(EV.IndicadorFecha/10) IndicadorFecha,
				(EV.IndicadorCantidad/10) IndicadorCantidad,
				(EV.IndicadorCalidad / 10) IndicadorCalidad,
				(EV.IndicadorCumplimientoDefinitivo/10) Cumplimiento,
				CASE EV.Urgencia WHEN 1 THEN 'SI' ELSE 'NO' END Urgencia,
				CASE EV.Consignado WHEN 1 THEN 'SI' ELSE 'NO' END Consignado,
				COALESCE(EV.Comentario, '') Comentario,
				COALESCE(C.Nombre, '') Causal,
				EV.NumLote
			FROM EP_Evento EV
			INNER JOIN EP_OrdenCompra OC ON
				EV.OrdenCompraId = OC.Id
			INNER JOIN EP_Proveedor P ON
				P.Id = OC.ProveedorId
			INNER JOIN EP_Usuario U ON
				U.Id = OC.CompradorId
			INNER JOIN EP_CalendarioTQ CAL ON
				CAL.NombrePeriodo = EV.Periodo
			LEFT JOIN EP_Causal C ON
				C.Id = EV.CausalId
			WHERE
				P.Id = '{request.ProveedorId}'
				AND U.Id = '{request.CompradorId}'
				AND OC.UnidadProductiva = '{request.UnidadProductiva}'
				AND CAL.Anio = {request.Anio}
				AND CAL.Mes = {request.Mes}
			;";

            List<DetalleReporteDTO> result = await _reportRepository.ObtenerDetalleReporte(query, cancellationToken);

            return await Task.FromResult(new ResponseBase<List<DetalleReporteDTO>>(result));
        }
    }
}

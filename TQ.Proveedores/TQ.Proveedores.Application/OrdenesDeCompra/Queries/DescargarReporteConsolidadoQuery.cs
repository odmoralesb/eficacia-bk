using MediatR;
using System.Collections.Generic;
using System;
using TQ.Util.MediatRUtils;
using System.Threading.Tasks;
using System.Threading;
using TQ.Proveedores.Application.Repositories;
using TQ.Proveedores.Application.ServiceAgents.DTO;
using TQ.Proveedores.Application.ServiceAgents.Interfaces;
using System.Linq;
using TQ.Proveedores.Application.Parametros.Queries;
using TQ.Proveedores.Domain.Parametros;
using TQ.Repository.Abstractions;
using AutoMapper.QueryableExtensions;
using AutoMapper;

namespace TQ.Proveedores.Application.OrdenesDeCompra.Queries
{
    public class DescargarReporteConsolidadoQuery : IRequest<ResponseBase<byte[]>>
    {
        public List<Guid>? ProveedorIds { get; set; }
        public List<Guid>? CompradorIds { get; set; }
        public List<string>? UnidadProductiva { get; set; }
        public int? Anio { get; set; }
        public List<int>? Trimestre { get; set; }
        public string Desempenio { get; set; }
        public decimal? IndicadorCalidad { get; set; }
        public decimal? IndicadorCantidad { get; set; }
        public decimal? IndicadorFecha { get; set; }
    }

    public class DescargarReporteConsolidadoQueryHandle : IRequestHandler<DescargarReporteConsolidadoQuery, ResponseBase<byte[]>>
    {
        private readonly IReportRepository<OrdenCompraReportDTO> _reportRepository;
        private readonly IRepository<Parametro> _repositoryParametro;
        private readonly IGenerarArchivoExcel _generateExcel;
        private readonly IMapper _mapper;

        public DescargarReporteConsolidadoQueryHandle(IReportRepository<OrdenCompraReportDTO> reportRepository, IGenerarArchivoExcel generateExcel, IRepository<Parametro> repositoryParametro, IMapper mapper)
        {
            _reportRepository = reportRepository;
            _generateExcel = generateExcel;
            _repositoryParametro = repositoryParametro;
            _mapper = mapper;
        }
        public async Task<ResponseBase<byte[]>> Handle(DescargarReporteConsolidadoQuery request, CancellationToken cancellationToken)
        {
            // Crear filtros
            string whereClause = "";
            string groupbyClause = "";
            string havingDesemepnioClause = "";
            string havingIndicadoresClause = "";
            if (request.Anio == null && request.Trimestre == null)
            {
                whereClause += $" AND CAL.Anio = {DateTime.Now.Year}";
            }
            else
            {
                if (request.Anio != null)
                {
                    whereClause += $" AND CAL.Anio = {request.Anio}";
                }

                if (request.Trimestre != null && request.Trimestre.Any())
                {
                    whereClause += $" AND CAL.Trimestre IN ({string.Join(',', request.Trimestre)})";
                }
            }

            if (request.ProveedorIds != null && request.ProveedorIds.Any())
            {
                string[] proveedores = request.ProveedorIds.Select(x => $"'{x}'").ToArray();
                whereClause += $" AND P.Id IN ({String.Join(',', proveedores)})";
            }

            if (request.CompradorIds != null && request.CompradorIds.Any())
            {
                string[] compradores = request.CompradorIds.Select(x => $"'{x}'").ToArray();
                whereClause += $" AND U.Id IN ({String.Join(',', compradores)})";
            }

            if (request.UnidadProductiva != null && request.UnidadProductiva.Any())
            {
                string[] ups = request.UnidadProductiva.Select(x => $"'{x}'").ToArray();
                whereClause += $" AND OC.UnidadProductiva IN ({string.Join(',', ups)})";
            }

            string query = "";


            if (request.Desempenio != null || request.IndicadorCalidad != null || request.IndicadorCantidad != null || request.IndicadorFecha != null)
            {
                if (request.Desempenio != null)
                {
                    var parametro = _repositoryParametro.TableNoTracking.ProjectTo<ParametroDTO>(_mapper.ConfigurationProvider).FirstOrDefault(x => x.Nombre == "Porcentaje Minimo Aprobacion Mensual");
                    var puntajeMinimo = parametro?.Valores.FirstOrDefault()?.Campo1;
                    var MinimoPuntaje = decimal.Parse(puntajeMinimo ?? "0");

                    MinimoPuntaje /= 100;

                    groupbyClause = string.Format("GROUP BY OC.UnidadProductiva,\r\n    CONCAT(U.Nombre, ' ', U.Apellido),\r\n    P.RazonSocial,\r\n    EV.Periodo,\r\n    OC.NumOC,\r\n    OC.CodInsumoServ,\r\n    OC.DescInsumoServ,\r\n    OC.UnidadMedida,\r\n    OC.TipoInsumo,\r\n    Moneda,\r\n    OC.FechaCreacion,\r\n    EV.FechaDespacho,\r\n    EV.FechaRecepcion,\r\n    EV.LeadTimeMaestra,\r\n    EV.LeadTimeCalculado,\r\n    EV.LeadTimeReal,\r\n    EV.Dias,\r\n    EV.DiasAtraso,\r\n    EV.IndicadorFecha,\r\n    EV.IndicadorFechaSys,\r\n    EV.CantidadSolicitada,\r\n    EV.CantidadRecibida,\r\n    EV.CantidadAceptada,\r\n    EV.CantidadDevuelta,\r\n    EV.IndicadorCantidad,\r\n    EV.IndicadorCantidadSys,\r\n    EV.IndicadorCalidad,\r\n    EV.IndicadorCalidadSys,\r\n    EV.IndicadorCumplimientoDefinitivo,\r\n    Urgencia,\r\n    Consignado,\r\n    Comentario,\r\n    COALESCE(C.Nombre, ''),\r\n    CompraDesarrollo,\r\n    CAL.Anio ,\r\n    CAL.Mes");
                    havingDesemepnioClause += $" AND AVG(E.IndicadorCumplimiento / 10.0) {(request.Desempenio == "BD" ? "<" : ">")} {MinimoPuntaje}";

                }

                if (request.IndicadorCalidad != null)
                {
                    request.IndicadorCalidad = request.IndicadorCalidad / 10;

                    havingIndicadoresClause += $" AND AVG(E.IndicadorCalidad/10) = {request.IndicadorCalidad}";
                }

                if (request.IndicadorCantidad != null)
                {
                    request.IndicadorCantidad = request.IndicadorCantidad / 10;
                    havingIndicadoresClause += $" AND AVG(E.IndicadorCantidad/10) = {request.IndicadorCantidad} ";
                }
                if (request.IndicadorFecha != null)
                {
                    request.IndicadorFecha = request.IndicadorFecha / 10;
                    havingIndicadoresClause += $" AND AVG(E.IndicadorFecha/10) = {request.IndicadorFecha} ";
                }

                query = $@"WITH ProvedoresConIndicador AS (
                        SELECT
                            P.RazonSocial AS Proveedor,
                            CAL.Trimestre,
                            CAL.MES,
                            CONCAT(U.Nombre, ' ', U.Apellido) Comprador,
                            OC.UnidadProductiva,
                            AVG(E.IndicadorFecha / 10) AS IndFecha,
                            AVG(E.IndicadorCantidad / 10) AS IndCantidad,
                            AVG(E.IndicadorCalidad / 10) AS IndCalidad
                        FROM EP_Evaluacion E
                        INNER JOIN EP_Evaluacion_OrdenCompra EOC ON EOC.EvaluacionesId = E.Id
                        INNER JOIN EP_OrdenCompra OC ON OC.Id = EOC.OrdenesCompraId
                        INNER JOIN EP_CalendarioTQ CAL ON CAL.NombrePeriodo = E.NombrePeriodo
                        LEFT JOIN EP_Proveedor P ON P.Id = OC.ProveedorId
                        LEFT JOIN EP_Usuario U ON U.Id = OC.CompradorId
                        WHERE
                            1=1
                        {whereClause}

                        GROUP BY
                        P.RazonSocial,
                        CAL.Anio,
                        U.Id,
                        CAL.Trimestre,
                        CAL.Mes,
                        CONCAT(U.Nombre, ' ', U.Apellido) ,
                        OC.UnidadProductiva

                        HAVING
                        1=1
                        {havingIndicadoresClause}
                    ),ProveedoresConCumplimiento AS (
                    SELECT
                        P.RazonSocial AS Proveedor,
							CAL.Anio,
							CAL.Trimestre,
							AVG(E.IndicadorCumplimiento / 10.0) AS TotalCumplimiento,
							COUNT(*) AS TotalEventos
                    FROM
							EP_Evaluacion E
						INNER JOIN
						    EP_Evaluacion_OrdenCompra EOC ON
							EOC.EvaluacionesId = E.Id
						INNER JOIN
						    EP_OrdenCompra OC ON
							OC.Id = EOC.OrdenesCompraId
						INNER JOIN
						    EP_CalendarioTQ CAL ON
							CAL.NombrePeriodo = E.NombrePeriodo
						LEFT JOIN
						    EP_Proveedor P ON
							P.Id = OC.ProveedorId
						LEFT JOIN
						    EP_Usuario U ON
							U.Id = OC.CompradorId
						WHERE
                        1 = 1
                        {whereClause}
                    GROUP BY
							P.RazonSocial,
							CAL.Anio,
							CAL.Trimestre
                    HAVING 1 = 1
                    {havingDesemepnioClause}
                ),
                DetallesOrdenes AS (
                    SELECT
                        OC.UnidadProductiva,
                        CONCAT(U.Nombre, ' ', U.Apellido) AS Comprador,
                        P.RazonSocial AS Proveedor,
                        EV.Periodo,
                        OC.NumOC,
                        OC.CodInsumoServ AS Codigo,
                        OC.DescInsumoServ AS Descripcion,
                        OC.UnidadMedida,
                        OC.TipoInsumo,
                        COALESCE(OC.Moneda, '') AS Moneda,
                        OC.FechaCreacion,
                        EV.FechaDespacho,
                        EV.FechaRecepcion AS FechaRecibo,
                        EV.LeadTimeMaestra AS LTM,
                        EV.LeadTimeCalculado AS LTC,
                        EV.LeadTimeReal AS LTR,
                        EV.Dias,
                        EV.DiasAtraso,
                        EV.IndicadorFecha,
                        EV.IndicadorFechaSys,
                        EV.CantidadSolicitada AS CantidadPedida,
                        EV.CantidadRecibida,
                        EV.CantidadAceptada,
                        EV.CantidadDevuelta,
                        EV.IndicadorCantidad,
                        EV.IndicadorCantidadSys,
                        EV.IndicadorCalidad,
                        EV.IndicadorCalidadSys,
                        EV.IndicadorCumplimientoDefinitivo AS IndicadorCumplimiento,
                        CAL.Trimestre,
                        CAL.MES,
                        CASE
                            WHEN EV.Urgencia = 1 THEN 'SI'
                            ELSE 'NO'
                        END AS Urgencia,
                        CASE
                            WHEN EV.Consignado = 1 THEN 'SI'
                            ELSE 'NO'
                        END AS Consignado,
                        COALESCE(EV.Comentario, '') AS Comentario,
                        COALESCE(C.Nombre, '') AS Causal,
                        CASE
                            WHEN OC.CompraDesarrollo = 1 THEN 'SI'
                            ELSE 'NO'
                        END AS CompraDesarrollo
                    FROM
                        EP_Evento EV
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
                        1 = 1
                        {whereClause}
                )

                SELECT 
                    D.UnidadProductiva,
                    D.Comprador,
                    D.Proveedor,
                    D.Periodo,
                    D.NumOC,
                     D.Codigo,
                     D.Descripcion,
                     D.UnidadMedida,
                     D.TipoInsumo,
                      D.Moneda,
                        D.FechaCreacion,
                        D.FechaDespacho,
                        D.FechaRecibo,
                        D.LTM,
                        D.LTC,
                        D.LTR,
                        D.Dias,
                        D.DiasAtraso,
                        D.IndicadorFecha,
                        D.IndicadorFechaSys,
                        D.CantidadPedida,
                        D.CantidadRecibida,
                        D.CantidadAceptada,
                        D.CantidadDevuelta,
                        D.IndicadorCantidad,
                        D.IndicadorCantidadSys,
                        D.IndicadorCalidad,
                        D.IndicadorCalidadSys,
                        D.IndicadorCumplimiento,
                        D.Urgencia,
                        D.Consignado,
                        D.Comentario,
                        D.Causal,
                        D.CompraDesarrollo  
                FROM 
                    DetallesOrdenes D
                JOIN
                    ProvedoresConIndicador PIC ON PIC.Proveedor = D.Proveedor AND PIC.Trimestre = D.Trimestre AND PIC.Comprador = D.Comprador AND PIC.UnidadProductiva = D.UnidadProductiva  AND PIC.MES = D.MES
                JOIN 
                    ProveedoresConCumplimiento PC ON PIC.Proveedor = PC.Proveedor AND PIC.Trimestre = PC.Trimestre
                ORDER BY 
                    D.Periodo,
                    D.UnidadProductiva,
                    D.NumOC;";
            }
            else
            {
                query = @$"
                SELECT
                    OC.UnidadProductiva,
                    CONCAT(U.Nombre, ' ', U.Apellido) Comprador,
                    P.RazonSocial Proveedor,
                    EV.Periodo,
                    OC.NumOC,
                    OC.CodInsumoServ Codigo,
                    OC.DescInsumoServ Descripcion,
                    OC.UnidadMedida,
                    OC.TipoInsumo,
                    COALESCE(OC.Moneda, '') Moneda,
                    OC.FechaCreacion,
                    EV.FechaDespacho,
                    EV.FechaRecepcion FechaRecibo,
                    EV.LeadTimeMaestra LTM,
                    EV.LeadTimeCalculado LTC,
                    EV.LeadTimeReal LTR,
                    EV.Dias,
                    EV.DiasAtraso,
                    EV.IndicadorFecha,
                    EV.IndicadorFechaSys,
                    EV.CantidadSolicitada CantidadPedida,
                    EV.CantidadRecibida,
                    EV.CantidadAceptada,
                    EV.CantidadDevuelta,
                    EV.IndicadorCantidad,
                    EV.IndicadorCantidadSys,
                    EV.IndicadorCalidad,
                    EV.IndicadorCalidadSys,
                    EV.IndicadorCumplimientoDefinitivo IndicadorCumplimiento,
                    CASE EV.Urgencia WHEN 1 THEN 'SI' ELSE 'NO' END Urgencia,
                    CASE EV.Consignado WHEN 1 THEN 'SI' ELSE 'NO' END Consignado,
                    COALESCE(EV.Comentario, '') Comentario,
                    COALESCE(C.Nombre, '') Causal,
                    CASE OC.CompraDesarrollo WHEN 1 THEN 'SI' ELSE 'NO' END CompraDesarrollo,
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
                    1 = 1
                    {whereClause}
                    {groupbyClause}
                ORDER BY
                    CAL.Anio,
                    CAL.Mes,
                    OC.NumOC
                ;
                ";
            }


            List<OrdenCompraReportDTO> data = await _reportRepository.ObtenerReporteDetallado(query, cancellationToken);
            var result = _generateExcel.GenerarArchivoOrdenCompraEvaluacion(data);

            return await Task.FromResult(new ResponseBase<byte[]>(result));
        }
    }
}

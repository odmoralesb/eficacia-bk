using AutoMapper;
using AutoMapper.QueryableExtensions;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using TQ.Proveedores.Application.Parametros.Queries;
using TQ.Proveedores.Application.Repositories;
using TQ.Proveedores.Domain.Parametros;
using TQ.Repository.Abstractions;
using TQ.Util.MediatRUtils;

namespace TQ.Proveedores.Application.Evaluaciones.Queries
{
    public class GetReporteDesempenioQuery : IRequest<ResponseBase<ReporteDTO>>
    {
        public string NombreUsuario { get; set; }
        public List<Guid>? ProveedorIds { get; set; }
        public List<Guid>? CompradorIds { get; set; }
        public List<string>? UnidadProductiva { get; set; }
        public List<string>? Anio { get; set; }
        public List<int>? Trimestre { get; set; }
        public string Desempenio { get; set; }
        public decimal? IndicadorCalidad { get; set; }
        public decimal? IndicadorCantidad { get; set; }
        public decimal? IndicadorFecha { get; set; }
        public int Page { get; set; } = 1;
        public int PageSize { get; set; } = 20;
    }

    public class GetReporteDesempenioQueryHandler : IRequestHandler<GetReporteDesempenioQuery, ResponseBase<ReporteDTO>>
    {
        private readonly IReportRepository<FilaReporteDTO> _reportRepository;
        private readonly IRepository<Parametro> _repositoryParametro;
        private readonly IMapper _mapper;

        public GetReporteDesempenioQueryHandler(IReportRepository<FilaReporteDTO> reportRepository, IRepository<Parametro> repositoryParametro, IMapper mapper)
        {
            _reportRepository = reportRepository;
            _repositoryParametro = repositoryParametro;
            _mapper = mapper;
        }
        public async Task<ResponseBase<ReporteDTO>> Handle(GetReporteDesempenioQuery request, CancellationToken cancellationToken)
        {
            ReporteDTO result = new ReporteDTO();

            // Crear filtros
            string whereClause = "";
            string havingClause = "";
            if (request.Anio == null && request.Trimestre == null)
            {
                whereClause += $" AND CAL.Anio = {DateTime.Now.Year}";
            }
            else
            {
                //if (request.Anio != null)
                if (request.Anio != null && request.Anio.Any())
                {
                    //whereClause += $" AND CAL.Anio = {request.Anio}";
                    whereClause += $" AND CAL.Anio IN ({string.Join(',', request.Anio)})";
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

            if (request.IndicadorCalidad != null)
            {
                request.IndicadorCalidad = request.IndicadorCalidad / 10;

                havingClause += $" AND AVG(E.IndicadorCalidad/10) = {request.IndicadorCalidad}";
            }

            if (request.IndicadorCantidad != null)
            {
                request.IndicadorCantidad = request.IndicadorCantidad / 10;
                havingClause += $" AND AVG(E.IndicadorCantidad/10) = {request.IndicadorCantidad} ";
            }
            if (request.IndicadorFecha != null)
            {
                request.IndicadorFecha = request.IndicadorFecha / 10;
                havingClause += $" AND AVG(E.IndicadorFecha/10) = {request.IndicadorFecha} ";
            }


            string query = @$"SELECT
                                P.Id ProveedorId,
	                            P.RazonSocial Proveedor,
	                            CAL.Anio,
	                            CONCAT('T',CAL.Trimestre) Trimestre,
	                            CAL.Mes,
                                U.Id CompradorId,
	                            CONCAT(U.Nombre, ' ', U.Apellido) Comprador,
	                            OC.UnidadProductiva,
                                COALESCE(PA.Comentario, '') PlanAccion_Comentario,
                                COALESCE(PA.Accion, '') PlanAccion_Accion,
	                            COUNT(OC.Id) CantidadOC,
	                            AVG(E.IndicadorFecha/10) IndFecha,
	                            AVG(E.IndicadorCantidad/10) IndCantidad,
	                            AVG(E.IndicadorCalidad/10) IndCalidad,
	                            AVG(E.IndicadorCumplimiento/10) Cumplimiento
                            FROM EP_Evaluacion E
                            INNER JOIN EP_Evaluacion_OrdenCompra EOC ON
	                            EOC.EvaluacionesId = E.Id
                            INNER JOIN EP_OrdenCompra OC ON
	                            OC.Id = EOC.OrdenesCompraId
                            INNER JOIN EP_CalendarioTQ CAL ON
	                            CAL.NombrePeriodo = E.NombrePeriodo
                            LEFT JOIN EP_Proveedor P ON
	                            P.Id = OC.ProveedorId
                            LEFT JOIN EP_Usuario U ON
	                            U.Id = OC.CompradorId
                            LEFT JOIN EP_PlanAccion PA ON
                                PA.ProveedorId = P.Id
                                AND PA.CompradorId = (SELECT Id FROM EP_Usuario WHERE NombreUsuario = '{request.NombreUsuario}')
                                AND PA.Trimestre = CAL.Trimestre
                                AND PA.Anio = CAL.Anio
                            WHERE
                                1 = 1
                                {whereClause}
                            GROUP BY
                                P.Id,
	                            P.RazonSocial,
	                            CAL.Anio,
                                U.Id,
	                            CONCAT('T',CAL.Trimestre),
	                            CAL.Mes,
	                            CONCAT(U.Nombre, ' ', U.Apellido),
	                            Oc.UnidadProductiva,
                                PA.Comentario,
                                PA.Accion
                            HAVING  
                           		1 = 1
                                {havingClause}
                            ";

            string countQuery = $"SELECT COUNT(*) Cantidad FROM ({query}) AS SubQuery";
            int totalCount = await _reportRepository.ExecuteScalarAsync<int>(countQuery, cancellationToken);


            string paginatedQuery = query + $" ORDER BY CAL.Anio DESC, P.RazonSocial OFFSET {(request.Page - 1) * request.PageSize} ROWS FETCH NEXT {request.PageSize} ROWS ONLY";


            //Result.Filas = await _reportRepository.ObtenerReporte(query, cancellationToken);
            result.Filas = await _reportRepository.ObtenerReporte(paginatedQuery, cancellationToken);

            var parametro = _repositoryParametro.TableNoTracking.ProjectTo<ParametroDTO>(_mapper.ConfigurationProvider).FirstOrDefault(x => x.Nombre == "Porcentaje Minimo Aprobacion Mensual");
            var puntajeMinimo = parametro?.Valores.FirstOrDefault()?.Campo1;
            result.MinimoPuntaje = decimal.Parse(puntajeMinimo ?? "0");
            result.MinimoPuntaje /= 100;

            return await Task.FromResult(new ResponseBase<ReporteDTO>(result));
        }
    }
}

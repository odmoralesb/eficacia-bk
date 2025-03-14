using AutoMapper;
using AutoMapper.QueryableExtensions;
using DocumentFormat.OpenXml.Office2016.Excel;
using MediatR;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text.Json;
using System.Threading;
using System.Threading.Tasks;
using TQ.Proveedores.Application.Evaluaciones.Commands;
using TQ.Proveedores.Application.Parametros.Queries;
using TQ.Proveedores.Application.Repositories;
using TQ.Proveedores.Application.ServiceAgents.DTO;
using TQ.Proveedores.Application.ServiceAgents.Interfaces;
using TQ.Proveedores.Domain.Configuracion;
using TQ.Proveedores.Domain.Enums;
using TQ.Proveedores.Domain.Evaluaciones;
using TQ.Proveedores.Domain.Maestras;
using TQ.Proveedores.Domain.OrdenesDeCompra;
using TQ.Proveedores.Domain.Parametros;
using TQ.Repository.Abstractions;

namespace TQ.Proveedores.Application.ServiceAgents.Implements
{
    public class Tarea : ITarea
    {
        private readonly IGenerateFileReportExcel _generateFileReportExcel;
        private readonly IRepository<CalendarioTQ> _calendarioRepository;
        private readonly IRepository<Evaluacion> _evaluacionRepository;
        private readonly IRepository<Proveedor> _proveedorRepository;
        private readonly IRepository<Usuario> _usuarioRepository;
        private readonly IRepository<Parametro> _parametroRepository;
        private readonly IEmailSender _emailSender;
        private readonly IMediator _mediator;
        private readonly IMapper _mapper;
        private readonly IReportRepository<EvaluacionProveedorDTO> _reportRepository;
        private readonly CultureInfo _culture;
        private string _query;

        public Tarea(IGenerateFileReportExcel generateFileReportExcel,
                     IRepository<CalendarioTQ> calendarioRepository,
                     IRepository<Evaluacion> evaluacionRepository,
                     IRepository<Proveedor> proveedorRepository,
                     IRepository<Usuario> usuarioRepository,
                     IRepository<Parametro> parametroRepository,
                     IEmailSender emailSender,
                     IMediator mediator,
                     IMapper mapper,
                     IReportRepository<EvaluacionProveedorDTO> reportRepository)
        {
            _generateFileReportExcel = generateFileReportExcel;
            _calendarioRepository = calendarioRepository;
            _evaluacionRepository = evaluacionRepository;
            _proveedorRepository = proveedorRepository;
            _usuarioRepository = usuarioRepository;
            _parametroRepository = parametroRepository;
            _emailSender = emailSender;
            _mediator = mediator;
            _mapper = mapper;
            _reportRepository = reportRepository;
            _culture = new CultureInfo("es-ES");

            _query = @"
            SELECT
                EOC.EvaluacionesId EvaluacionId,
                OC.UnidadProductiva,
                CONCAT(U.Nombre, ' ', U.Apellido) Comprador,
                P.RazonSocial Proveedor,
                EV.Periodo,
                OC.NumOC,
                OC.CodInsumoServ Codigo,
                OC.DescInsumoServ Descripcion,
                OC.UnidadMedida,
                OC.FechaCreacion,
                EV.FechaDespacho,
                EV.FechaRecepcion FechaRecibo,
                EV.LeadTimeMaestra LTM,
                EV.LeadTimeCalculado LTC,
                EV.LeadTimeReal LTR,
                EV.Dias,
                EV.DiasAtraso,
                EV.IndicadorFecha,
                EV.CantidadSolicitada CantidadPedida,
                EV.CantidadRechazada,
                EV.CantidadRecibida,
                EV.CantidadAceptada,
                EV.CantidadDevuelta,
                EV.IndicadorCantidad,
                EV.IndicadorCalidad,
                EV.CodigoCalidad,
                EV.IndicadorCumplimiento IndicadorCumplimiento,
                EV.IndicadorCumplimientoDefinitivo IndicadorCumplimientoDefinitivo,
                COALESCE(EV.Comentario, '') Comentario,
                COALESCE(C.Nombre, '') Causal
            FROM EP_Evento EV
            INNER JOIN EP_OrdenCompra OC ON
                EV.OrdenCompraId = OC.Id
            INNER JOIN EP_Evaluacion_OrdenCompra EOC ON
                EOC.OrdenesCompraId = OC.Id
            INNER JOIN EP_Evaluacion EVAL ON
	            EVAL.Id = EOC.EvaluacionesId
	            AND EVAL.NombrePeriodo = EV.Periodo
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
                {0}
            ORDER BY
                CAL.Anio,
                CAL.Mes,
                OC.NumOC;";
        }

        public async Task<bool> CalcularIndicadorEvaluacion()
        {
            // Se obtiene el periodo anterior más reciente
            CalendarioTQ periodoEvaluar = _calendarioRepository.TableNoTracking.OrderByDescending(x => x.FechaFin).FirstOrDefault(x => x.FechaFin < DateTime.Today); 
            // Se manda a ejecutar el comando para crear las evaluaciones y evaluar los recibos de ese periodo.
            await _mediator.Send(new CreateEvaluacionCommand() { NombrePeriodo = periodoEvaluar.NombrePeriodo });
            return true;
        }

        public async Task<bool> EnviarCorreoAprobacionPendiente(CalendarioTQ periodoEvaluar, Guid? ProveedorId = null, CancellationToken cancellationToken=default)
        {
            var pendientes = _evaluacionRepository.TableNoTracking
                            .Where(x => (x.NombrePeriodo == periodoEvaluar.NombrePeriodo) && (x.Estado == (int)EstadoEvaluacion.PENDIENTE_APROBACION))
                            .SelectMany(e => e.OrdenesCompra)
                            .Select(x => new { x.Comprador, x.Proveedor, x.ProveedorId })
                            .Distinct();

            if (ProveedorId != null)
            {
                pendientes = pendientes.Where(x => x.ProveedorId == ProveedorId);
            }

            Dictionary<string, List<string>> proveedores = new Dictionary<string, List<string>>();
            Dictionary<string, string> nombresCompradores = new Dictionary<string, string>();
            Dictionary<string, string> correoCompradores = new Dictionary<string, string>();
            Dictionary<string, List<string>> compradores = new Dictionary<string, List<string>>();
            foreach(var pen in pendientes)
            {
                if (proveedores.ContainsKey(pen.Comprador.Id.ToString()))
                {
                    proveedores[pen.Comprador.Id.ToString()].Add(pen.Proveedor.RazonSocial);
                }
                else
                {
                    proveedores.Add(pen.Comprador.Id.ToString(), new List<string>() { pen.Proveedor.RazonSocial});
                    nombresCompradores.Add(pen.Comprador.Id.ToString(), pen.Comprador.GetNombreCompleto());
                    correoCompradores.Add(pen.Comprador.Id.ToString(), pen.Comprador.CorreoElectronico);
                }

                if (compradores.ContainsKey(pen.Comprador.JefeDirectoId?.ToString() ?? ""))
                {
                    compradores[pen.Comprador.JefeDirectoId?.ToString() ?? ""].Add(pen.Comprador.GetNombreCompleto());
                }
                else
                {
                    compradores.Add((pen.Comprador.JefeDirectoId?.ToString() ?? ""), new List<string>() { pen.Comprador.GetNombreCompleto() });
                }
            }

            List<string> admins = _usuarioRepository.TableNoTracking.Where(x => x.Rol.Nombre == "Administrador").Select(x => x.CorreoElectronico).ToList();
            if (pendientes.Any())
            {
                // Enviar correo de los compradores que no han aprobado
                foreach (var compId in nombresCompradores.Keys)
                {
                    await _emailSender.EnviarCorreoPendienteAprobacionAsync(nombresCompradores[compId],
                                                                            periodoEvaluar.NombrePeriodo,
                                                                            correoCompradores[compId],
                                                                            proveedores[compId],
                                                                            cancellationToken);
                }
                string[] copy = admins.ToArray();
                // Enviar correo a los jefes y administradores
                foreach(var jefeId in compradores.Keys)
                {
                    copy = admins.ToArray();
                    if (!string.IsNullOrEmpty(jefeId))
                    {
                        var jefe = _usuarioRepository.TableNoTracking.FirstOrDefault(x => x.Id.ToString() == jefeId);
                        copy = copy.Append(jefe.CorreoElectronico).ToArray();
                    }
                    
                    await _emailSender.EnviarCorreoPendienteAprobacionAdminAsync(periodoEvaluar.NombrePeriodo,
                                                                                 copy,
                                                                                 compradores[jefeId].Distinct().ToList(),
                                                                                 cancellationToken);
                }

                return false;
            }
            
            return true;
        }

        public async Task<bool> EnviarReporte()
        {
            CalendarioTQ periodoEvaluar = _calendarioRepository.TableNoTracking.OrderByDescending(x => x.FechaFin).FirstOrDefault(x => x.FechaFin < DateTime.Now);

            var proveedores = _evaluacionRepository.TableNoTracking.Where(x => x.Estado == (int)EstadoEvaluacion.APROBADO)
                                                                   .SelectMany(e => e.OrdenesCompra)
                                                                   .Select(x => x.Proveedor)
                                                                   .Distinct();
            bool check = await EnviarCorreoAprobacionPendiente(periodoEvaluar);
            string mes = _culture.DateTimeFormat.GetMonthName(periodoEvaluar.Mes);
            if (check)
            {
                string route = string.Empty;
                List<Func<Task>> tasks = new List<Func<Task>>();

                foreach (var prov in proveedores)
                {
                    route = Path.Combine(Path.GetTempPath(), $"{prov.Nit}_{periodoEvaluar.Anio}.xlsx");
                    var evaluacionesIds = await EnviarReporte(prov.Id, periodoEvaluar.Anio, route, prov.RazonSocial, mes, prov.ListaCorreoElectronico);
                    tasks.Add(async () => { await _mediator.Send(new UpdateEnviadosCommand() { EvaluacionesId = evaluacionesIds }); });
                }

                try
                {
                    foreach (var task in tasks)
                    {
                        await task();
                        await Task.Delay(500);
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Error processing items: {ex.Message}");
                }
            }

            return true;
        }

        public async Task<List<Guid>> EnviarReporte(Guid? proveedorId, int? anio, string ruta, string nombreProveedor = "", string mes = "", string listaEmails = "", CancellationToken cancellationToken = default)
        {
            string queryReporte = String.Format(_query, $"AND P.Id = '{proveedorId}' AND CAL.ANIO = {anio} AND EVAL.Estado != {(int)EstadoEvaluacion.PENDIENTE_APROBACION}");
            string calificacionCualitativa = "bueno";
            decimal objetivo = 100;
            List<EvaluacionProveedorDTO> data = await _reportRepository.ObtenerReporteDetallado(queryReporte, cancellationToken);
            if (!data.Any())
            {
                return new List<Guid>();
            }

            string[] compradores = data.Select(x => x.Comprador).Distinct().ToArray();
            compradores = compradores.Where(x => !string.IsNullOrEmpty(x)).ToArray();
            string[] correosCompradores = _usuarioRepository.TableNoTracking.Where(x => compradores.Contains(x.Nombre + " " + x.Apellido)).Select(x => x.CorreoElectronico).ToArray();
            
            List<SummaryDTO> summary = data.GroupBy(x => x.Periodo).Select(g => new SummaryDTO
            {
                Periodo = g.Key,
                IndicadorCantidad = g.Average(x => x.IndicadorCantidad) / 10,
                IndicadorFecha = g.Average(x => x.IndicadorFecha) / 10,
                IndicadorCalidad = g.Average(x => x.IndicadorCalidad) / 10,
                Desempenio = g.Average(x => x.IndicadorCumplimientoDefinitivo) / 10,
                CantidadOC = g.Count()
            }).ToList();

            try
            {
                ParametroDTO calfCualMen = _parametroRepository.TableNoTracking.ProjectTo<ParametroDTO>(_mapper.ConfigurationProvider).FirstOrDefault(x => x.Nombre == "Calificacion Cualitativa Mensual");

                if (calfCualMen != null)
                {
                    decimal promedio = data.Average(x => x.IndicadorCumplimientoDefinitivo*10);
                    calfCualMen.Valores.Sort((a, b) => (int)decimal.Parse(b.Campo2) - (int)decimal.Parse(a.Campo2));
                    calificacionCualitativa = calfCualMen.Valores.FirstOrDefault(x => (decimal.Parse(x.Campo2) <= promedio) && (decimal.Parse(x.Campo3) >= promedio))?.Campo1 ?? "Excelente";
                }

                ParametroDTO objetivoParam = _parametroRepository.TableNoTracking.ProjectTo<ParametroDTO>(_mapper.ConfigurationProvider).FirstOrDefault(x => x.Nombre == "Objetivo Eficacia");

                decimal.TryParse(objetivoParam.Valores.FirstOrDefault()?.Campo1 ?? "", out objetivo);
                objetivo /= 100;
            } catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }

            byte[] archivo = _generateFileReportExcel.GenerarArchivo(ruta, (int)anio, data, summary, calificacionCualitativa, objetivo);
            if (string.IsNullOrEmpty(listaEmails))
            {
                var proveedor = _proveedorRepository.GetById(proveedorId);
                nombreProveedor = proveedor.RazonSocial;
                listaEmails = proveedor.ListaCorreoElectronico;
            }
            if (string.IsNullOrEmpty(mes))
            {
                mes = _culture.DateTimeFormat.GetMonthName(DateTime.Now.Month);
            }

            await _emailSender.EnviarCorreoEvaluacionAsync(nombreProveedor, mes, archivo, listaEmails.Split(";"), correosCompradores, cancellationToken);

            return data.Select(y => y.EvaluacionId).Distinct().ToList();
        }
    }
}

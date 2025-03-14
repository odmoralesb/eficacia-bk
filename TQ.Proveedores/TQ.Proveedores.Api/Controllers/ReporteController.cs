using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.IO;
using System.Threading.Tasks;
using TQ.Api.Utils.Controller;
using TQ.Proveedores.Application.Evaluaciones.Commands;
using TQ.Proveedores.Application.Evaluaciones.Queries;
using TQ.Proveedores.Application.OrdenesDeCompra.Queries;
using TQ.Proveedores.Application.SolicitudesCambioEstado.Commands.Close;
using TQ.Util.FileUtils.Exceptions;

namespace TQ.Proveedores.Api.Controllers
{
    [Authorize]
    [AllowAnonymous]
    [Route("/api/[controller]")]
    public class ReporteController : ApiControllerBase
    {
        private readonly IWebHostEnvironment _env;

        public ReporteController(IWebHostEnvironment env)
        {
            _env = env;
        }
        [HttpGet]
        [Route("[action]")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult> ObtenerFiltros([FromQuery] GetFiltrosReporteQuery query)
        {
            if (string.IsNullOrEmpty(query.UserName))
            {
                return BadRequest();
            }

            var response = await Mediator.Send(query);

            if (response.IsValidResponse)
            {
                return Ok(response);
            }

            return BadRequest(response.Errors);
        }

        [HttpGet]
        [Route("[action]")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult> ObtenerReporteDesempenio([FromQuery] GetReporteDesempenioQuery query)
        {
            var response = await Mediator.Send(query);

            if (response.IsValidResponse)
            {
                return Ok(response);
            }

            return BadRequest(response.Errors);
        }

        [HttpGet]
        [Route("[action]")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult> ObtenerDetalleReporteDesempenio([FromQuery] GetDetalleReporteQuery query)
        {
            var response = await Mediator.Send(query);

            if (response.IsValidResponse)
            {
                return Ok(response);
            }

            return BadRequest(response.Errors);
        }
        
        [HttpPost]
        [Route("[action]")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<FileResult> DescargarReporteDesempenio([FromBody] DescargarReporteConsolidadoQuery query)
        {
            var response = await Mediator.Send(query);

            if (response.IsValidResponse && (response.Result != null) && (response.Result.Length > 0))
            {
                return File(response.Result, "application/vnd.ms-excel", "Reporte Detallado Desempeño");
            }

            throw new FileNotValidException("Error al generar el reporte");
        }

        [HttpPost]
        [Route("[action]")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult> EnviarReporteDesempenio([FromQuery] string solicitud, [FromBody] EnviarReporteConsolidadoCommand query)
        {
            query.Ruta = Path.Combine(Path.GetTempPath(), $"Reporte_evaluacion_{query.Anio}.xlsx");
            var responseEvalIds = await Mediator.Send(query);

            if (responseEvalIds.IsValidResponse)
            {
                var response = await Mediator.Send(new UpdateEnviadosCommand { EvaluacionesId = responseEvalIds.Result });
                if (response.IsValidResponse)
                {
                    if (!string.IsNullOrEmpty(solicitud))
                    {
                        ResendReportSolicitudCambioEstadoCommand resendReport = new() { Id = Guid.Parse(solicitud) };
                        await Mediator.Send(resendReport);
                    }
                    
                    return Ok(response);
                }
                return BadRequest(response.Errors);
            }

            return BadRequest(responseEvalIds.Errors);
        }
    }
}

using Azure;
using DocumentFormat.OpenXml.Drawing.Charts;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;
using TQ.Api.Utils.Controller;
using TQ.Proveedores.Application.Evaluaciones.Commands;
using TQ.Proveedores.Application.Evaluaciones.Queries;
using TQ.Proveedores.Application.OrdenesDeCompra.Commands;
using TQ.Proveedores.Application.OrdenesDeCompra.Queries;
using TQ.Util.MediatRUtils;

namespace TQ.Proveedores.Api.Controllers
{
    [Authorize]
    [AllowAnonymous]
    [Route("/api/[controller]")]
    public class EvaluacionController : ApiControllerBase
    {
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult> Get([FromQuery] GetEvaluacionQuery query)
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

        [HttpGet("{tipo}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult> ObtenerFiltrosMW([FromRoute] string tipo, [FromQuery] GetFiltrosEvaluacionQuery query)
        {
            if (string.IsNullOrEmpty(query.UserName))
            {
                return BadRequest();
            }
            query.Tipo = tipo;

            var response = await Mediator.Send(query);

            if (response.IsValidResponse)
            {
                return Ok(response);
            }

            return BadRequest(response.Errors);
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult> Create([FromBody] CreateEvaluacionCommand command)
        {
            ResponseBase<bool> response = await Mediator.Send(command);
            if (response.IsValidResponse)
            {
                return Created("", response);
            }
            else
            {
                return BadRequest(response.Errors);
            }
        }

        [HttpPost]
        [Route("Inicializacion")]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult> CreateInicializacion()
        {
            var query = new GetEventoPeriodoQuery();
            var responseQuery = await Mediator.Send(query);

            foreach (var periodo in responseQuery)
            {
                var command = new CreateEvaluacionCommand();
                command.Inicializacion = true;
                command.NombrePeriodo = periodo;

                await Mediator.Send(command);
            }

            return Created("", true);
        }

        [HttpPut]
        [Route("[action]")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult> CambiarEstado([FromBody] UpdateEstadoCommand query)
        {
            var response = await Mediator.Send(query);

            if (response.IsValidResponse)
            {
                return Ok(response);
            }

            return BadRequest(response.Errors);
        }

        [HttpPut]
        [Route("[action]")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult> ReasignarComprador([FromBody] UpdateCompradorOcCommand query)
        {
            var response = await Mediator.Send(query);

            if (response.IsValidResponse)
            {
                return Ok(response);
            }

            return BadRequest(response.Errors);
        }
    }
}

using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;
using TQ.Api.Utils.Controller;
using TQ.Proveedores.Application.OrdenesDeCompra.Commands;
using TQ.Proveedores.Application.OrdenesDeCompra.Queries;
using TQ.Util.MediatRUtils;

namespace TQ.Proveedores.Api.Controllers
{
    [Authorize]
    [AllowAnonymous]
    [Route("/api/[controller]")]
    public class EventoController : ApiControllerBase
    {
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult> Get([FromQuery] GetEventoQuery query)
        {
            var response = await Mediator.Send(query);
            if (response.IsValidResponse)
            {
                return Created("", response);
            }
            else
            {
                return BadRequest(response.Errors);
            }
        }

        [HttpPut]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult> Put([FromBody] UpdateEventoCommand command)
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

        [HttpGet("GetEventos")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult> GetEventos([FromQuery] GetEventosQuery query)
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

        [HttpPut("PutEventos")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult> PutEventos([FromBody] UpdateEventosAllCommand command)
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

        [HttpGet]
        [Route("SolicitudCambioEstado/{solicitudId}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult> GetEvaluacionesSolicitud(string solicitudId)
        {
            GetEventosSolicitudCambioEstadoQuery query = new()
            {
                SolicitudCambioEstadoId = Guid.Parse(solicitudId)
            };

            var response = await Mediator.Send(query);

            if (response.IsValidResponse)
            {
                return Ok(response);
            }

            return BadRequest(response.Errors);
        }

        [HttpPut]
        [Route("SolicitudCambioEstado/{solicitudId}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult> PutEvaluacionesSolicitud([FromRoute] string solicitudId, [FromBody] UpdateEventosSolicitudCambioEstadoCommand command)
        {
            command.SolicitudCambioEstadoId = Guid.Parse(solicitudId);
            ResponseBase<bool> response = await Mediator.Send(command);
            if (response.IsValidResponse)
            {
                return Ok(response);
            }
            else
            {
                return BadRequest(response.Errors);
            }
        }
    }
}

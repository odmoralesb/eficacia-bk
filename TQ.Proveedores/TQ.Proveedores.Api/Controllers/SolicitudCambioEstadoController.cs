using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;
using TQ.Api.Utils.Controller;
using TQ.Proveedores.Application.SolicitudesCambioEstado.Commands.Approve;
using TQ.Proveedores.Application.SolicitudesCambioEstado.Commands.Close;
using TQ.Proveedores.Application.SolicitudesCambioEstado.Commands.Create;
using TQ.Proveedores.Application.SolicitudesCambioEstado.Queries;
using TQ.Util.MediatRUtils;

namespace TQ.Proveedores.Api.Controllers
{
    [Authorize]
    [AllowAnonymous]
    [Route("/api/SolicitudCambioEstado")]
    public class SolicitudCambioEstadoController : ApiControllerBase
    {
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult> Get([FromQuery] GetSolicitudesCambioEstadoQuery query)
        {
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
        public async Task<ActionResult> Create([FromBody] CreateSolicitudCambioEstadoCommand command)
        {
            ResponseBase<Guid> response = await Mediator.Send(command);
            if (response.IsValidResponse)
            {
                return Created("", response);
            }
            else
            {
                return BadRequest(response.Errors);
            }
        }

        [HttpPut("Aprobar")]
        [ProducesResponseType(StatusCodes.Status202Accepted)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult> Approve([FromBody] ApproveSolicitudCambioEstadoCommand command)
        {
            ResponseBase<Guid> response = await Mediator.Send(command);
            if (response.IsValidResponse)
            {
                return Accepted("", response);
            }
            else
            {
                return BadRequest(response.Errors);
            }
        }

        [HttpPut("Cerrar")]
        [ProducesResponseType(StatusCodes.Status202Accepted)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult> Close([FromBody] CloseSolicitudCambioEstadoCommand command)
        {
            ResponseBase<Guid> response = await Mediator.Send(command);
            if (response.IsValidResponse)
            {
                return Accepted("", response);
            }
            else
            {
                return BadRequest(response.Errors);
            }
        }
    }
}

using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;
using TQ.Api.Utils.Controller;
using TQ.Proveedores.Application.Causales.Commands;
using TQ.Proveedores.Application.Causales.Queries;
using TQ.Util.MediatRUtils;

namespace TQ.Proveedores.Api.Controllers
{
    [Authorize]
    [AllowAnonymous]
    [Route("/api/Causal")]
    public class CausalController : ApiControllerBase
    {
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult> Get([FromQuery] GetCausalQuery query)
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
        public async Task<ActionResult> Create([FromBody] CreateCausalCommand command)
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

        [HttpPut]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult> Update([FromBody] UpdateCausalCommand command)
        {
            ResponseBase<Guid> response = await Mediator.Send(command);
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

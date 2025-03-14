using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using TQ.Api.Utils.Controller;
using TQ.Proveedores.Application.PlanesDeAccion.Commands;
using TQ.Proveedores.Application.PlanesDeAccion.Queries;

namespace TQ.Proveedores.Api.Controllers
{
    [Authorize]
    [AllowAnonymous]
    [Route("/api/[controller]")]
    public class PlanAccionController : ApiControllerBase
    {
        [HttpPost]
        [Route("[action]")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult> Crear([FromBody] CreatePlanAccionCommand query)
        {
            var response = await Mediator.Send(query);
            if (response.IsValidResponse)
            {
                return Ok(response.Result);
            }

            return BadRequest(response.Errors);
        }

        [HttpPut]
        [Route("[action]")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult> Editar([FromBody] UpdatePlanAccionCommand query)
        {
            var response = await Mediator.Send(query);
            if (response.IsValidResponse)
            {
                return Ok(response.Result);
            }

            return BadRequest(response.Errors);
        }

        [HttpGet]
        [Route("[action]")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult> ObtenerPlanAccion([FromQuery] GetPlanesAccionesQuery query)
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

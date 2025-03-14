using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;
using TQ.Api.Utils.Controller;
using TQ.Proveedores.Application.Configuracion.Queries;
using TQ.Proveedores.Application.Usuarios.Commands.Create;
using TQ.Proveedores.Application.Usuarios.Commands.Update;
using TQ.Proveedores.Application.Usuarios.Commands.Delete;
using TQ.Proveedores.Application.Usuarios.Queries;
using TQ.Util.MediatRUtils;

namespace TQ.Proveedores.Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [AllowAnonymous]
    public class UsuarioController : ApiControllerBase
    {
        [HttpGet]
        [Route("[action]")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult> ObtenerCompradores()
        {
            GetCompradoresQuery query = new();
            var response = await Mediator.Send(query);

            if (response.IsValidResponse)
            {
                return Ok(response);
            }

            return BadRequest(response.Errors);
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult> Get([FromQuery] GetUsuariosQuery query)
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
        public async Task<ActionResult> Create([FromBody] CreateUsuarioCommand command)
        {
            ResponseBase<Guid> response = await Mediator.Send(command);
            if (response.IsValidResponse)
            {
                return Created("", response);
            }
            return BadRequest(response.Errors);
        }

        [HttpPut("{id}")]
        [ProducesResponseType(StatusCodes.Status202Accepted)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult> Update(Guid id, [FromBody] UpdateUsuarioCommand command)
        {
            if (id != command.Id)
            {
                return BadRequest();
            }

            ResponseBase<Guid> response = await Mediator.Send(command);
            if (response.IsValidResponse)
            {
                return Accepted("", response);
            }
            return BadRequest(response.Errors);
        }

        [HttpDelete("{id}")]
        [ProducesResponseType(StatusCodes.Status202Accepted)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult> Delete(Guid id)
        {
            var command = new DeleteUsuarioCommand { Id = id };
            ResponseBase<Guid> response = await Mediator.Send(command);
            if (response.IsValidResponse)
            {
                return Accepted("", response);
            }
            return BadRequest(response.Errors);
        }

        [HttpGet("roles")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<ActionResult> GetRoles()
        {
            var query = new GetRolesQuery();
            var response = await Mediator.Send(query);

            if (response.IsValidResponse)
            {
                return Ok(response);
            }

            return BadRequest(response.Errors);
        }
    }
}

using Microsoft.AspNetCore.Http;
using TQ.Util.MediatRUtils;
using System.Security.Claims;
using System.Threading.Tasks;

namespace TQ.Proveedores.Api.Infraestructure
{
    public class CurrentUserService : ICurrentUserService
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        public CurrentUserService(IHttpContextAccessor httpContextAccessor)
        {
            _httpContextAccessor = httpContextAccessor;
        }

        public Task<User> GetUserAsync()
        {
            return Task.FromResult(new User()
            {
                Id = _httpContextAccessor.HttpContext?.User?.FindFirstValue(ClaimTypes.NameIdentifier),
                Name = _httpContextAccessor.HttpContext?.User?.FindFirstValue("preferred_username")
            });
        }
    }
}

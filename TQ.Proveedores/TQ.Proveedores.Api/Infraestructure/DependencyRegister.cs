using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using TQ.Proveedores.Application.ServiceAgents.Implements;
using TQ.Proveedores.Application.ServiceAgents.Interfaces;
using TQ.Util.DependencyInjection;
using TQ.Util.MediatRUtils;

namespace TQ.Proveedores.Api.Infraestructure
{
    public class DependencyRegister : IDependencyRegister
    {
        public void RegisterDependencies(IConfiguration configuration, IServiceCollection services)
        {
            services.AddScoped<ICurrentUserService, CurrentUserService>();
            services.AddScoped<ITarea, Tarea>();
        }
    }
}

using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using TQ.Util.DependencyInjection;
using System.Reflection;

namespace TQ.Proveedores.Application
{
    public class DependencyRegister : IDependencyRegister
    {
        public void RegisterDependencies(IConfiguration configuration, IServiceCollection services)
        {
            services.AddAutoMapper(Assembly.GetExecutingAssembly());
        }
    }
}

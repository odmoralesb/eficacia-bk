using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using TQ.Repository.Abstractions;
using TQ.Util.DependencyInjection;
using System.Linq;
using TQ.Proveedores.Application.ServiceAgents.Interfaces;
using TQ.Proveedores.Infraestructure.ServiceAgents;
using TQ.Proveedores.Infraestructure.Repositories;
using TQ.Proveedores.Application.Repositories;

namespace TQ.Proveedores.Infraestructure
{
    public class DependencyRegister : IDependencyRegister
    {
        public void RegisterDependencies(IConfiguration configuration, IServiceCollection services)
        {
            var assemblyRepositories = (typeof(DependencyRegister).Assembly).DefinedTypes.Where(t => t.Name.EndsWith("Repository") && !t.IsInterface);
            foreach (var repository in assemblyRepositories)
            {
                var interfaces = repository.GetInterfaces().Where(x => !x.Name.Equals(typeof(IRepository<>).Name));

                if (interfaces.Any())
                    services.AddScoped(interfaces.FirstOrDefault(), repository);
            }

            services.AddScoped<IEmailSender, EmailSender>();
            services.AddScoped(typeof(IReportRepository<>), typeof(ReportRepository<>));
            services.AddScoped<IGenerarArchivoExcel, GenerarArchivoExcel>();
            services.AddScoped<IGenerateFileReportExcel, GenerateFileReportExcel>();
        }
    }
}

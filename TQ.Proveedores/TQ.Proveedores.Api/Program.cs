using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using NLog.Extensions.Logging;
using NLog.Web;
using System;

namespace TQ.Proveedores.Api
{
    public class Program
    {
        public static void Main(string[] args)
        {
            using var loggerFactory = LoggerFactory.Create(builder =>
            {
                builder
                    .AddAzureWebAppDiagnostics()
                    .AddConsole()
                    .AddNLog();
            });

            ILogger logger = loggerFactory.CreateLogger<Program>();
            try
            {
                logger.LogInformation("Initializing Host builder");
                CreateHostBuilder(args).Build().Run();
            }
            catch (Exception ex)
            {
                logger.LogError(ex, "Stopped program because of exception");
                throw;
            }
        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
            .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder.UseStartup<Startup>();
                }).UseNLog();


    }
}

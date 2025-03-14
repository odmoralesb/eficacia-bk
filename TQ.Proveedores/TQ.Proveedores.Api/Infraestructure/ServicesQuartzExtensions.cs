using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Quartz;
using System;
using TQ.Proveedores.Application.ServiceAgents.Tareas;

namespace TQ.Proveedores.Api.Infraestructure
{
    public static class ServicesQuartzExtensions
    {
        public static void AddQuartzConfiguration(this IServiceCollection services, IConfiguration configuration, IWebHostEnvironment Env)
        {
            // Se lee la expresión Job para saber cuándo ejecutar la tarea
            var cronEnviarEvalProvs = configuration.GetSection("QuartzCron:EnviarEvaluacionProveedores").Value;
            var cronCalcIndEval = configuration.GetSection("QuartzCron:CalcularIndicadoresEvaluacion").Value;

            try
            {
                new CronExpression(cronEnviarEvalProvs);
                new CronExpression(cronCalcIndEval);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.InnerException);

                cronEnviarEvalProvs = "0 0 5 * * ? *";
                cronCalcIndEval = "0 0 4 * * ? *";
            }

            Console.WriteLine(cronEnviarEvalProvs);
            Console.WriteLine(cronCalcIndEval);
            

            // Configurar Quartz
            services.AddQuartz(q =>
            {
                var keyEnvEvalProvs = new JobKey("EnviarEvaluacionProveedores");
                var keyCalcIndEval = new JobKey("CalcularIndicadoresEvaluacion");
                q.AddJob<EnviarEvaluacionProveedor>(a => a.WithIdentity(keyEnvEvalProvs));
                q.AddJob<CalcularIndicadoresEvaluacion>(a => a.WithIdentity(keyCalcIndEval));
                q.AddTrigger(t => t.ForJob(keyEnvEvalProvs).WithIdentity("triggerEnviarEvaluacionProveedores").StartNow().WithCronSchedule(cronEnviarEvalProvs));
                q.AddTrigger(t => t.ForJob(keyCalcIndEval).WithIdentity("triggerCalcularIndicadoresEvaluacion").WithCronSchedule(cronCalcIndEval));
                //q.AddTrigger(t => t.ForJob(keyCalcIndEval).WithIdentity("triggerCalcularIndicadoresEvaluacion").WithCronSchedule(cronCalcIndEval));
            });

            // Quartz.Extensions.Hosting hosting
            services.AddQuartzHostedService(options =>
            {
                // when shutting down we want jobs to complete gracefully
                options.WaitForJobsToComplete = true;
            });
        }
    }
}

using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Logging.Abstractions;
using Quartz;
using System;
using System.Threading.Tasks;
using TQ.Proveedores.Application.Helpers;
using TQ.Proveedores.Application.ServiceAgents.Interfaces;
using TQ.Proveedores.Domain.Maestras;
using TQ.Proveedores.Domain.Parametros;
using TQ.Repository.Abstractions;

namespace TQ.Proveedores.Application.ServiceAgents.Tareas
{
    public class EnviarEvaluacionProveedor : IJob
    {
        private readonly ITarea _tarea;
        private readonly IRepository<ParametroValor> _repositoryParametro;
        private readonly IRepository<CalendarioTQ> _repositoryCalendario;
        private readonly ILogger<EnviarEvaluacionProveedor> _logger;

        public EnviarEvaluacionProveedor(ITarea tarea, IRepository<ParametroValor> repositoryParametro, IRepository<CalendarioTQ> repositoryCalendario, ILoggerFactory loggerFactory)
        {
            _tarea = tarea;
            _repositoryParametro = repositoryParametro;
            _repositoryCalendario = repositoryCalendario;
            _logger = loggerFactory?.CreateLogger<EnviarEvaluacionProveedor>() ?? NullLoggerFactory.Instance.CreateLogger<EnviarEvaluacionProveedor>();
        }

        public async Task Execute(IJobExecutionContext context)
        {
            try
            {
                CalendarioTQ periodoActual = _repositoryCalendario.Get(x => (x.FechaInicio < DateTime.Now) && (x.FechaFin > DateTime.Now));
                int diasHabiles = int.Parse(_repositoryParametro.Get(x => x.Parametro.Nombre == "Dias Habiles Aprobacion").Campo1 ?? "0");
                int frecuenciaEnvio = int.Parse(_repositoryParametro.Get(x => x.Parametro.Nombre == "Frecuencia Envio Reporte Consolidado").Campo1 ?? "0");

                var inicioEjecucion = FechaUtils.CalcularFechaHabil(periodoActual.FechaInicio, diasHabiles);
                // Ejecutar después de los días de aprobación
                if ((DateTime.Now > inicioEjecucion) && ((DateTime.Now.Month % frecuenciaEnvio) == 1))
                {
                    _logger.LogInformation("Se empieza a enviar las evaluaciones a los proveedores");
                    await _tarea.EnviarReporte();
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.StackTrace);
            }
            
        }
    }
}

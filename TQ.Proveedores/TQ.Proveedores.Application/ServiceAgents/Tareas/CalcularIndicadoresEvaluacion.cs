using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Logging.Abstractions;
using Quartz;
using Quartz.Logging;
using System;
using System.Linq;
using System.Threading.Tasks;
using TQ.Proveedores.Application.ServiceAgents.Interfaces;
using TQ.Proveedores.Domain.Maestras;
using TQ.Proveedores.Domain.Parametros;
using TQ.Repository.Abstractions;

namespace TQ.Proveedores.Application.ServiceAgents.Tareas
{
    public class CalcularIndicadoresEvaluacion : IJob
    {
        private readonly ITarea _tarea;
        private readonly IRepository<ParametroValor> _repositoryParametro;
        private readonly IRepository<CalendarioTQ> _repositoryCalendario;
        private readonly ILogger<CalcularIndicadoresEvaluacion> _logger;

        public CalcularIndicadoresEvaluacion(ITarea tarea,
                                              IRepository<ParametroValor> repositoryParametro,
                                              IRepository<CalendarioTQ> repositoryCalendario,
                                              ILoggerFactory loggerFactory)
        {
            _tarea = tarea;
            _repositoryParametro = repositoryParametro;
            _repositoryCalendario = repositoryCalendario;
            _logger = loggerFactory?.CreateLogger<CalcularIndicadoresEvaluacion>() ?? NullLoggerFactory.Instance.CreateLogger<CalcularIndicadoresEvaluacion>();
        }

        public async Task Execute(IJobExecutionContext context)
        {
            try
            {
                // Se ejecuta la tarea al inicio de cada periodo, para evaluar el periodo anterior.
                bool esInicioPeriodo = _repositoryCalendario.TableNoTracking.Any(x => x.FechaInicio == DateTime.Today);

                if (esInicioPeriodo)
                {
                    _logger.LogInformation("Inicio de ejecución de cálculo de indicadores");
                    await _tarea.CalcularIndicadorEvaluacion();
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.StackTrace);
            }
        }
    }
}

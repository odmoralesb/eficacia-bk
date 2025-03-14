using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using TQ.Proveedores.Domain.Maestras;

namespace TQ.Proveedores.Application.ServiceAgents.Interfaces
{
    public interface ITarea
    {
        Task<bool> CalcularIndicadorEvaluacion();
        public Task<bool> EnviarCorreoAprobacionPendiente(CalendarioTQ periodoEvaluar, Guid? ProveedorId = null, CancellationToken cancellationToken = default);
        public Task<bool> EnviarReporte();
        public Task<List<Guid>> EnviarReporte(Guid? proveedorId, int? anio, string ruta, string nombreProveedor = "", string mes = "", string listaEmails = "", CancellationToken cancellationToken = default);
    }
}

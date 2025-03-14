using System.Collections.Generic;
using System.Threading.Tasks;
using System.Threading;

namespace TQ.Proveedores.Application.Repositories
{
    public interface IReportRepository<TEntity> where TEntity : class, new()
    {
        Task<List<TEntity>> ObtenerReporte(string query, CancellationToken cancellationToken, int? commandTimeOutInSeconds = null);
        Task<List<TEntity>> ObtenerDetalleReporte(string query, CancellationToken cancellationToken, int? commandTimeOutInSeconds = null);
        Task<List<TEntity>> ObtenerReporteDetallado(string query, CancellationToken cancellationToken, int? commandTimeOutInSeconds = null);
    }
}

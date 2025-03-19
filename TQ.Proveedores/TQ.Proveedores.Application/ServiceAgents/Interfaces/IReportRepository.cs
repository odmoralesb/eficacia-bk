using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;

namespace TQ.Proveedores.Application.Repositories
{
    public interface IReportRepository<TEntity> where TEntity : class, new()
    {
        Task<List<TEntity>> ObtenerReporte(string query, CancellationToken cancellationToken, int? commandTimeOutInSeconds = null);
        Task<int> ExecuteScalarAsync<T>(string query, CancellationToken cancellationToken, int? commandTimeoutInSeconds = null);
        Task<List<TEntity>> ObtenerDetalleReporte(string query, CancellationToken cancellationToken, int? commandTimeOutInSeconds = null);
        Task<List<TEntity>> ObtenerReporteDetallado(string query, CancellationToken cancellationToken, int? commandTimeOutInSeconds = null);
    }
}

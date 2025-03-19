using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.Data.Common;
using System.Threading;
using System.Threading.Tasks;
using TQ.Infraestructure.EFrameworkCore.SqlServer;
using TQ.Proveedores.Application.Repositories;

namespace TQ.Proveedores.Infraestructure.Repositories
{
    public class ReportRepository<TEntity> : IReportRepository<TEntity>, IDisposable where TEntity : class, new()
    {
        private readonly Entities _dbContext;

        public ReportRepository(Entities dbContext)
        {
            _dbContext = dbContext;
        }

        public void Dispose()
        {
            (_dbContext as IDisposable)?.Dispose();
        }

        public async Task<List<TEntity>> ObtenerDetalleReporte(string query, CancellationToken cancellationToken, int? commandTimeOutInSeconds = null)
        {
            List<TEntity> result = new List<TEntity>();
            using (var cmd = _dbContext.Database.GetDbConnection().CreateCommand())
            {
                if (cmd.Connection.State != ConnectionState.Open)
                {
                    await cmd.Connection.OpenAsync();
                }
                cmd.CommandText = query;
                cmd.CommandType = CommandType.Text;
                if (commandTimeOutInSeconds != null)
                {
                    cmd.CommandTimeout = (int)commandTimeOutInSeconds;
                }
                var reader = await cmd.ExecuteReaderAsync(cancellationToken);
                while (await reader.ReadAsync())
                {
                    var row = new TEntity();
                    row.GetType().GetProperty("NumOc").SetValue(row, reader.GetString("NumOC"));
                    row.GetType().GetProperty("Comprador").SetValue(row, reader.GetString("Comprador"));
                    row.GetType().GetProperty("Codigo").SetValue(row, reader.GetString("Codigo"));
                    row.GetType().GetProperty("Descripcion").SetValue(row, reader.GetString("Descripcion"));
                    row.GetType().GetProperty("UnidadMedida").SetValue(row, reader.GetString("UnidadMedida"));
                    row.GetType().GetProperty("TipoInsumo").SetValue(row, reader.GetString("TipoInsumo"));
                    row.GetType().GetProperty("Moneda").SetValue(row, (reader.GetString("Moneda") ?? ""));
                    row.GetType().GetProperty("FechaCreacion").SetValue(row, reader.GetDateTime("FechaCreacion"));
                    row.GetType().GetProperty("FechaDespacho").SetValue(row, reader.GetDateTime("FechaDespacho"));
                    row.GetType().GetProperty("FechaRecibido").SetValue(row, reader.GetDateTime("FechaRecibido"));
                    row.GetType().GetProperty("Dias").SetValue(row, reader.GetInt32("Dias"));
                    row.GetType().GetProperty("DiasAtraso").SetValue(row, reader.GetInt32("DiasAtraso"));
                    row.GetType().GetProperty("CantidadSolicitada").SetValue(row, reader.GetDecimal("CantidadSolicitada"));
                    row.GetType().GetProperty("CantidadRecibida").SetValue(row, reader.GetDecimal("CantidadRecibida"));
                    row.GetType().GetProperty("CantidadAceptada").SetValue(row, reader.GetDecimal("CantidadAceptada"));
                    row.GetType().GetProperty("CantidadDevuelta").SetValue(row, reader.GetDecimal("CantidadDevuelta"));
                    row.GetType().GetProperty("IndicadorFecha").SetValue(row, reader.GetDecimal("IndicadorFecha"));
                    row.GetType().GetProperty("IndicadorCantidad").SetValue(row, reader.GetDecimal("IndicadorCantidad"));
                    row.GetType().GetProperty("IndicadorCalidad").SetValue(row, reader.GetDecimal("IndicadorCalidad"));
                    row.GetType().GetProperty("Cumplimiento").SetValue(row, reader.GetDecimal("Cumplimiento"));
                    row.GetType().GetProperty("Urgencia").SetValue(row, reader.GetString("Urgencia"));
                    row.GetType().GetProperty("Consignado").SetValue(row, reader.GetString("Consignado"));
                    row.GetType().GetProperty("Comentario").SetValue(row, (reader.GetString("Comentario") ?? ""));
                    row.GetType().GetProperty("Causal").SetValue(row, (reader.GetString("Causal") ?? ""));
                    row.GetType().GetProperty("NumLote").SetValue(row, (reader.GetString("NumLote") ?? ""));
                    result.Add(row);
                }
                await cmd.Connection.CloseAsync();
            }
            return result;
        }

        public async Task<List<TEntity>> ObtenerReporte(string query, CancellationToken cancellationToken, int? commandTimeOutInSeconds = null)
        {
            List<TEntity> result = new List<TEntity>();
            using (var cmd = _dbContext.Database.GetDbConnection().CreateCommand())
            {
                if (cmd.Connection.State != ConnectionState.Open)
                {
                    await cmd.Connection.OpenAsync();
                }
                cmd.CommandText = query;
                cmd.CommandType = CommandType.Text;
                if (commandTimeOutInSeconds != null)
                {
                    cmd.CommandTimeout = (int)commandTimeOutInSeconds;
                }
                var reader = await cmd.ExecuteReaderAsync(cancellationToken);
                while (await reader.ReadAsync())
                {
                    var row = new TEntity();
                    row.GetType().GetProperty("Anio").SetValue(row, reader.GetInt32("Anio"));
                    row.GetType().GetProperty("Mes").SetValue(row, reader.GetInt32("Mes"));
                    row.GetType().GetProperty("Trimestre").SetValue(row, reader.GetString("Trimestre"));
                    row.GetType().GetProperty("CompradorId").SetValue(row, reader.GetGuid("CompradorId"));
                    row.GetType().GetProperty("Comprador").SetValue(row, reader.GetString("Comprador"));
                    row.GetType().GetProperty("ProveedorId").SetValue(row, reader.GetGuid("ProveedorId"));
                    row.GetType().GetProperty("Proveedor").SetValue(row, reader.GetString("Proveedor"));
                    row.GetType().GetProperty("UnidadProductiva").SetValue(row, reader.GetString("UnidadProductiva"));
                    row.GetType().GetProperty("CantidadOC").SetValue(row, reader.GetInt32("CantidadOC"));
                    row.GetType().GetProperty("IndicadorFecha").SetValue(row, reader.GetDecimal("IndFecha"));
                    row.GetType().GetProperty("IndicadorCantidad").SetValue(row, reader.GetDecimal("IndCantidad"));
                    row.GetType().GetProperty("IndicadorCalidad").SetValue(row, reader.GetDecimal("IndCalidad"));
                    row.GetType().GetProperty("IndicadorCumplimiento").SetValue(row, reader.GetDecimal("Cumplimiento"));
                    row.GetType().GetProperty("PlanAccionComentario").SetValue(row, (reader.GetString("PlanAccion_Comentario") ?? ""));
                    row.GetType().GetProperty("PlanAccion").SetValue(row, (reader.GetString("PlanAccion_Accion") ?? ""));
                    result.Add(row);
                }
                await cmd.Connection.CloseAsync();
            }
            return result;
        }


        public async Task<int> ExecuteScalarAsync<T>(string query, CancellationToken cancellationToken, int? commandTimeoutInSeconds = null)
        {
            using (var cmd = _dbContext.Database.GetDbConnection().CreateCommand())
            {
                if (cmd.Connection.State != ConnectionState.Open)
                {
                    await cmd.Connection.OpenAsync(cancellationToken);
                }
                cmd.CommandText = query;
                cmd.CommandType = CommandType.Text; // Correcto para SQL directo
                if (commandTimeoutInSeconds != null)
                {
                    cmd.CommandTimeout = (int)commandTimeoutInSeconds;
                }

                object result = await cmd.ExecuteScalarAsync(cancellationToken);

                await cmd.Connection.CloseAsync();

                return (result == DBNull.Value || result == null) ? 0 : Convert.ToInt32(result);
            }
        }



        public async Task<List<TEntity>> ObtenerReporteDetallado(string query, CancellationToken cancellationToken, int? commandTimeOutInSeconds = null)
        {
            List<TEntity> result = new List<TEntity>();
            using (var cmd = _dbContext.Database.GetDbConnection().CreateCommand())
            {
                if (cmd.Connection.State != ConnectionState.Open)
                {
                    await cmd.Connection.OpenAsync();
                }
                cmd.CommandText = query;
                cmd.CommandType = CommandType.Text;
                if (commandTimeOutInSeconds != null)
                {
                    cmd.CommandTimeout = (int)commandTimeOutInSeconds;
                }
                var reader = await cmd.ExecuteReaderAsync(cancellationToken);
                while (await reader.ReadAsync())
                {
                    var row = new TEntity();
                    ReadOnlyCollection<DbColumn> columns = await reader.GetColumnSchemaAsync();
                    foreach (DbColumn col in columns)
                    {
                        if (col.DataType.Name == "String")
                        {
                            var value = reader.IsDBNull(reader.GetOrdinal(col.ColumnName)) ? "" : reader.GetString(reader.GetOrdinal(col.ColumnName));
                            row.GetType().GetProperty(col.ColumnName).SetValue(row, value);
                        }
                        else if (col.DataType.Name.Contains("Int"))
                        {
                            var value = reader.IsDBNull(reader.GetOrdinal(col.ColumnName)) ? 0 : reader.GetInt32(reader.GetOrdinal(col.ColumnName));
                            row.GetType().GetProperty(col.ColumnName).SetValue(row, value);
                        }
                        else if (col.DataType.Name == "DateTime")
                        {
                            var value = reader.IsDBNull(reader.GetOrdinal(col.ColumnName)) ? (DateTime?)null : reader.GetDateTime(reader.GetOrdinal(col.ColumnName));
                            row.GetType().GetProperty(col.ColumnName).SetValue(row, value);
                        }
                        else if (col.DataType.Name == "Decimal")
                        {
                            var value = reader.IsDBNull(reader.GetOrdinal(col.ColumnName)) ? 0 : reader.GetDecimal(reader.GetOrdinal(col.ColumnName));
                            row.GetType().GetProperty(col.ColumnName).SetValue(row, value);
                        }
                        else if (col.DataType.Name == "Guid")
                        {
                            var value = reader.IsDBNull(reader.GetOrdinal(col.ColumnName)) ? (Guid?)null : reader.GetGuid(reader.GetOrdinal(col.ColumnName));
                            row.GetType().GetProperty(col.ColumnName).SetValue(row, value);
                        }
                    }

                    result.Add(row);
                }
                await cmd.Connection.CloseAsync();
            }
            return result;
        }
    }
}

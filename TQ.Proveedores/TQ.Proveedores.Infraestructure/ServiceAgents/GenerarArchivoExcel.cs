using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.IO;
using System.Linq;
using TQ.Proveedores.Application.ServiceAgents.DTO;
using TQ.Proveedores.Application.ServiceAgents.Interfaces;
using TQ.Util.Excel.Default;

namespace TQ.Proveedores.Infraestructure.ServiceAgents
{
    public class GenerarArchivoExcel : IGenerarArchivoExcel
    {
        public byte[] GenerarArchivoOrdenCompraEvaluacion(List<OrdenCompraReportDTO> ordenCompraReports)
        {
            DataTable tabla = new DataTable();
            var cabeceras = typeof(OrdenCompraReportDTO).GetProperties().ToList();

            // Construcción dinámica de la cabecera del excel
            foreach (var cabecera in cabeceras)
            {
                DataColumn columna = new();
                columna.DataType = Type.GetType(cabecera.PropertyType.ToString());
                columna.ColumnName = cabecera.Name;
                var descriptionAttributes = cabecera.GetCustomAttributes(typeof(DescriptionAttribute), false);
                if (descriptionAttributes.Length > 0)
                {
                    columna.Caption = ((DescriptionAttribute)descriptionAttributes.GetValue(0)).Description;
                }
                tabla.Columns.Add(columna);
            }

            // Llenar el contenido
            foreach (var solicitud in ordenCompraReports)
            {

                DataRow fila;
                fila = tabla.NewRow();
                foreach (var cabecera in cabeceras)
                {
                    fila[cabecera.Name] = solicitud.GetType().GetProperty(cabecera.Name).GetValue(solicitud, null);
                }
                tabla.Rows.Add(fila);
            }

            var exportExcel = new XlsxExportService();

            var workbook = exportExcel.Export(tabla, "Ordenes Compra por Recibido", true);

            // Convertir el libro de Excel a un array de bytes
            byte[] bytes;
            using (var memoryStream = new MemoryStream())
            {
                workbook.SaveAs(memoryStream);
                bytes = memoryStream.ToArray();
            }

            return bytes;
        }
    }
}

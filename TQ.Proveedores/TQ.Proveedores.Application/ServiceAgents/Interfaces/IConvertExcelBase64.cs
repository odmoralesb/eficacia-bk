using System.Collections.Generic;
using TQ.Proveedores.Application.ServiceAgents.DTO;

namespace TQ.Proveedores.Application.ServiceAgents.Interfaces
{
    public interface IGenerateExcel
    {
        byte[] GenerarArchivoOrdenCompraEvaluacion(List<OrdenCompraReportDTO> ordenCompraReports);
    }
}

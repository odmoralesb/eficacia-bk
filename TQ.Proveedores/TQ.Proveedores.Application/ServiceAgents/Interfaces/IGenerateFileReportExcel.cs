using DocumentFormat.OpenXml.Packaging;
using System.Collections.Generic;
using TQ.Proveedores.Application.ServiceAgents.DTO;

namespace TQ.Proveedores.Application.ServiceAgents.Interfaces
{
    public interface IGenerateFileReportExcel
    {
        public byte[] GenerarArchivo(string filePath, int anio, List<EvaluacionProveedorDTO> data, List<SummaryDTO> summary, string calificacionCualitativa, decimal objetivo);
        public void CrearPartes(SpreadsheetDocument document, int anio, List<EvaluacionProveedorDTO> data, List<SummaryDTO> summary, string calificacionCualitativa, decimal objetivo);
        public void GenerateExtendedFilePropertiesPart1Content(ExtendedFilePropertiesPart extendedFilePropertiesPart1);
        public void GenerateWorkbookPart1Content(WorkbookPart workbookPart1);
        public void GenerateWorksheetPart1Content(WorksheetPart worksheetPart1, List<SummaryDTO> summary);
        public void GenerateWorksheetPart2Content(WorksheetPart worksheetPart2, List<EvaluacionProveedorDTO> data);
        public void GenerateChartsheetPart1Content(ChartsheetPart chartsheetPart1);
        public void GenerateDrawingsPart1Content(DrawingsPart drawingsPart1);
        public void GenerateChartPart1Content2(ChartPart chartPart1, decimal objetivo);
        public void GenerateChartPart1Content(ChartPart chartPart1);
        public void GenerateChartDrawingPart1Content(ChartDrawingPart chartDrawingPart1, int anio, decimal promedio, string calificacionCualitativa);
        public void GenerarLogoTq1Content(ImagePart imagePart1);
        public void GenerarLogoTq2Content(ImagePart imagePart2);
        public void GenerateChartColorStylePart1Content(ChartColorStylePart chartColorStylePart1);
        public void GenerateChartStylePart1Content(ChartStylePart chartStylePart1);
        public void GenerateWorkbookStylesPart1Content(WorkbookStylesPart workbookStylesPart1);
        public void GenerateThemePart1Content(ThemePart themePart1);
    }
}

using DocumentFormat.OpenXml;
using DocumentFormat.OpenXml.ExtendedProperties;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;
using DocumentFormat.OpenXml.Validation;
using DocumentFormat.OpenXml.VariantTypes;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using TQ.Proveedores.Application.ServiceAgents.DTO;
using TQ.Proveedores.Application.ServiceAgents.Interfaces;
using A = DocumentFormat.OpenXml.Drawing;
using A14 = DocumentFormat.OpenXml.Office2010.Drawing;
using C = DocumentFormat.OpenXml.Drawing.Charts;
using C14 = DocumentFormat.OpenXml.Office2010.Drawing.Charts;
using Cdr = DocumentFormat.OpenXml.Drawing.ChartDrawing;
using Cs = DocumentFormat.OpenXml.Office2013.Drawing.ChartStyle;
using Thm15 = DocumentFormat.OpenXml.Office2013.Theme;
using X14 = DocumentFormat.OpenXml.Office2010.Excel;
using X15 = DocumentFormat.OpenXml.Office2013.Excel;
using Xdr = DocumentFormat.OpenXml.Drawing.Spreadsheet;

namespace TQ.Proveedores.Infraestructure.ServiceAgents
{
    public class GenerateFileReportExcel : IGenerateFileReportExcel
    {
        private string logoTQPequenio = "PHN2ZyB3aWR0aD0iNDAiIGhlaWdodD0iNDAiIHZpZXdCb3g9IjAgMCAxMjAyLjY2IDEyMDIuNjYiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbDpzcGFjZT0icHJlc2VydmUiIG92ZXJmbG93PSJoaWRkZW4iPjxnIGlkPSJDT0xPUkVTIj48L2c+PGcgaWQ9IkxPR08iPjxnPjxnPjxwYXRoIGQ9Ik0xMTQ0LjM3IDk2My4yMUMxMTI0LjM5IDk3MC44MyAxMDE0Ljk5IDk5Ni40NyA4OTYuMDYgOTY2LjcxIDg5MS4xNCA5NjUuNDkgODkzLjczIDk2Mi41NSA4OTUuMjggOTYxLjE1IDEwMDYuOTQgODU5LjE2IDEwNjkuMzUgNzM1LjEgMTA2OS4zNSA2MDkuMDYgMTA2OS4zNSA1NjUuOTMgMTA2Mi41OCA1MTkuNTYgMTA0MS43MSA0NzYuOSAxMDQxLjg0IDQ3Ny4wNSAxMDQxLjk5IDQ3Ny4xOSAxMDQyLjExIDQ3Ny4zNCAxMDIyLjA4IDQzNi4xNCA5NTMuOTkgMzIxLjkyIDY5MS40IDMyMS45MiA2OTAuOTIgMzIxLjkyIDY5MC40OSAzMjEuOSA2OTAuMDEgMzIxLjkgNjkwLjAyIDMyMS45IDY5MC4wMyAzMjEuOTEgNjkwLjA0IDMyMS45MSA2MzEuOTcgMzIyLjM2IDU3MS4yIDMyNS41NSA1MDguNDUgMzMxLjU3IDUwMi45NyAzMzEuODggNTAwLjIxIDMzMC4wMyA1MDMuNTQgMzIzLjIgNTQ4LjA1IDI0MC44IDYwMS41MyAxNzEuMjggNjU4LjkyIDExOS4wOCA2NjIuNzIgMTE1LjM5IDY1OS4zNyAxMTEuMzQgNjU3LjAyIDEwOS43NSA2MjcgODkuNjYgNTY0LjIgOTIuMzMgNTAwLjA0IDExOS4zNCA0NTcuMzggMTM3LjMgNDIyLjg3IDE2Mi4zNSA0MDIuNTYgMTg3LjU2IDM2NS40IDIzNy4zNSAzMzEuMzIgMjkzLjUyIDMwMi4wNyAzNTQuOTkgMjk5LjY3IDM2MC4xMyAyOTUuNDcgMzYxLjkxIDI5My42MyAzNjIuMjYgMjI3LjQ3IDM3NC43OSAxNjMuNTIgMzg5Ljc1IDEwMi40NyA0MDYuNjkgODMuNTQgNDEzLjE2IDc3LjY1IDQyMS4yNCA3NS4xMyA0MjUuOTYgNzAuMTkgNDM1LjI2IDY1LjU1IDQ0NS4wNyA2MS4zNiA0NTUuNDEgMzEgNTI5Ljk5IDMzLjE0IDYwMi40MSA2NC45MSA2MjMuOTUgNzUuMDIgNjI5LjA5IDg0LjIyIDYyMy4wNyA4OS42OSA2MjAuMzIgMTMzLjQ3IDU5OC4zNCAxNzkuMyA1NzcuMTcgMjI2Ljk3IDU1Ny4wOSAyMjguMzIgNTU2LjUxIDIzMC40MSA1NTUuODUgMjMwLjEgNTU5LjM2IDIxNS45OSA2MjAuMzkgMjA5IDY3OS41OCAyMDkgNzM0Ljg4IDIwOSAxMDIyLjI3IDM3Ny4yMSAxMTA2LjEgNTUwLjQ0IDExMDYuMSA1NjQuOTkgMTEwNi4xIDU3OS43NCAxMTA1LjI3IDU5NC42IDExMDMuNjggNTk0LjE4IDExMDMuNjMgNTkyLjkzIDExMDMuNDYgNTkwLjk3IDExMDMuMDhMNTk0LjYgMTEwMy42OEM2NDcuNzEgMTA5Ny45OSA3MDIuNTIgMTA4Mi4wNyA3NTUuODcgMTA1Ni4yNSA3NTkuMzEgMTA1NC40NCA3NjIuNjQgMTA1NS4wNiA3NjQuMSAxMDU1LjM5IDk0NS42NyAxMDk2LjQzIDEwNzIuMDYgMTA0OS4zOCAxMTMxLjk0IDEwMTUuMjQgMTE3Ny44NiA5ODkuMDUgMTE2NC4zNiA5NTUuNiAxMTQ0LjM3IDk2My4yMVpNNzcwLjc0IDg3OC43N0M3NjUuMjUgODgzLjUyIDc2MC43NSA4NzkuOCA3NTkuMTIgODc3LjMyIDczNS43NCA4NDEuNzcgNzI3LjczIDgwNC4zNiA3MjQuOTkgNzgwLjkxIDcyMy4yMyA3NjUuODggNzE0LjgyIDcxOS4zOSA2MjcuNDggNzE5LjM5IDU1MS42MSA3MTkuMzkgNTQ0Ljk2IDc4MS45MSA1NDMuOTkgNzkzLjYgNTM4LjYgODU5LjAxIDU3Mi4zNCA5MjEuNjkgNjE3LjA4IDk2OS4xNCA2MjEuNTggOTczLjkxIDYxOC41MyA5NzYuMzkgNjE2LjUxIDk3Ny4xNCA0NDAuNzEgMTAyOS44MSA0MDYuMjcgOTM0LjIxIDQwMC45NCA5MTcuNjQgMzg2Ljk3IDg3NC4yIDM4My43IDgyMi4zMyAzODMuNyA3ODQuOTggMzgzLjcgNjE0LjYgNDAwLjEyIDQwOC4zOSA2OTIuOTkgNDA4LjM5IDczNS41OCA0MDguMzkgODU1Ljg4IDQwNC40NiA5MDYuODggNDg4LjkzIDk3MS4zNiA1OTUuNzMgODk1LjAyIDc2My4zMyA3NzAuNzQgODc4Ljc3WiIgZmlsbD0iIzAwNDZBRCIvPjwvZz48L2c+PC9nPjwvc3ZnPg==";

        private string logoTQGrande = "iVBORw0KGgoAAAANSUhEUgAAAKAAAACgCAYAAACLz2ctAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAAOw4AADsOAcy2oYMAAAmASURBVHhe7Z3rUSRHEIQxQSbIhPNAilCA/mICJmCCPJAJ/L+DwASZcCZggkyQOqtnYNitYXdnK2ume/KLyLgHsPPK7np073IjhBBCCCGEEEIIIYQQQgghhBBCiIHfXn8Z/iYEERjt7vn+5u7l8eb2+e+b25d/yp9v5d//fej53/p/zz/te/D9QizGTFcMB0PBXJ/Mdq7Kz/7x4/fhFYU4QYjpDlVeS4gv+fP11yFsBpluFMLy92/DUYQ4AOagGA+S+cQcCLU040Eyn5gDRYHleJ5xIiTzCY/3Wc8zTZRkPuFh5nt59U0TJZlPeMAUR03jaCGXVONZHFLbK2TzmR6HIwoxUHM+vvmQVwpxBNZrPcNECnkljC7EJ2w5zTFMqJ5/ynziGOR9VhR4pomSKl4xR0boVcUrXDJCr4oO4ZIRelFVK+8TLvTQW8ytzaXCRaFXrEZO1auWi3Cw1Y6E0KuWi3BJCb0//hqOJsQEzH6qesVqYGbyTBMpVb3CJaXn9/I6HE2IA7S1XqxGyuynwkPMcffydGSYSKnwELPYWyod00Tq9vlhOFocMDSE2Xuq8f9FI2RstZoCc9ibmoqwBQvmRO8ROaipFCp2TvZZMvhUrDeTpQijnGN8JXuN8pr1XXxPQ7X/aIMPphUrUT8ezX9oobrCPFkazWmDQcVSDtRPM+hANhuX2VKzJIEa+vwbLx3LQnhJEWTGAJCHbTkcbl3VjPGFVbfAcLXaLfkNch2ZL0za03jAe5VZRqitblg1KcOxtVsj1nB6X1sLMtvq6j40j4azloGq2G2qPJduihUZrmU1+AFLRyHVvTCpFaHo2zxWOKAvJ8P5Ql5b7s37UhqW7KBhSa0WXMeyr5XvsWIMP2ftk4yPljtQOffNglxBxhtUjDY2fMclMQxOBhZlzKTcnUDv2qoJd28+q9oxqz3QzHYOY9rDnCExuDZFLS78k+1a40y30UX/GtY5RtyUCXEy3kl2KxivzDKttChqLhlvxE00rXc1+1mYfVw1xF5DLX6c67pCq8/+e5n9thxqLwEDyLu+xSqDcjXwQNyT6knDrNcT8c/taXjlZGr/yjuhTgTzlRSjR6JTp1Xy4a5bL+Xaet+0Gds7TJ4Fuw6/xXytFhqXEpbDl2iRes/Ck9mNCO2KvZgP4Fq9+7BMibkyo6RfXWUU91DpXkpYKM6siFdZDGer04LjFJGzYErebBsPnIO3rE109VckahZEZ4ROxsdgZGpveZ9H3VHj35+LlBGGuytAdhp6p0SGYfpgrvvc/IO3piZ2+iYR1dfFbEoltoG5rvRRux9ETSz0PLAXA25qT9sGiFpapUcVpgFre6e+B8L7eqiU+30ibH24hHIqjBywLgl97LWj55nZS0cNEGdAciUcNjth5WFmnx17pWXvfT+PyPYadXBfPVJgvGLir5a92CstKj6OiTQgdUVkcc+oGG8aZudY/Prnip2jNEpYM7qIvqZ+yQw1FhbnTsv8lZaVdvBunMgFBnqEOWu0WGPz8jfxRN4IT/RGaaNEdjdSUpy5zvlhRXsp9D6j2i8uoYVfxj22XG1iQjNewIHZFfDSgdE7cxPKEqXuq8R0G3lAagWsAmSWyPve7PtpYGTvgqKk/p9P9H1v1oBh3fg5Kf9ziS78moVdATc7MslE593Nwt6EII6xYtK5V4vVcp7N3mkjjolOe+jbsZhQe4CqgF2iw2/ThR6zB6gNqMcg/Ia3vVou9OoqinNRIdIa8CGRGxBGNV3oMZvQ6gEeE7n6YWJvRmVDNWCpsMUHjJ5r82lO3TPoX9y10i6YzzDSneYHuXdRYVopObZE//s3WzOHkCOtvSEC5+HeoyvVdP6Hk/cuKkope9QKMFd9wE8nZ3RU/Zg1sh8cpdvQepuLbcCMLUIw3tI8Nmo72ylYs1/zRV7rBrR17IAclp1H0VpdLff/QPia5IGYBrR+WmABxVrOom32aL39AtgGZOVZdt6M6j14RqGdZ1E3LS7v4qLEMiBuvne8axW9eYK2zl5MnV1E0XAvMEg0AxKb51HnzGg6j2KlC6vAChEQw4CsivJD13/yfA29wUtuE2W1t1JgGhAPIhr2Du6I3IqVIph62+LGHKkcA3Lfw3xteGPsdpmqu+VN5nYsRghmGxARYSn2TjdiRMGzYgzqVUE33bvYCDVpwKIl583O+6Cucr8RZr7CaERnGHBJIUJZ652oq8p3CrNdwBixzBl71KUPm10YIaxnrKuvguUt3kUHiJEws5N80wV5oA1gYt4Hdb2z3HIX56JjFP/bHJkz9lTnDB520WEqr99d4XEIa2WBsV7JHTATnei3pZgPCl6f3iSsvIqVODOX4qaay7uyzNd16J3CCmvoWzHIKERMziyYZ74d/UJHWlgrD4oBfz14okkIhPlSZt9y37rs+X0Fa1SzRnFWGB4HUZr5inYTeqewGrxzedS1pIVhCIOTNECPVML+bkLvFF57I74VA9Kq4UTtKu87hPVAmUtI1G1P2SozLCtaNAMlDA85FAMMmrRckCkL8Tvo952CtczFHNm81CFTnDSlSTgzCvcGs7dBMbXLivcrKHkVMQwDzLDucTcumc+BVoyQt5KntmUCJPN9AasYYeyQnsLeFBolme8EtB7biR0m12LnvfF8UOY7E1aPjbVBYQSzrLU1nGOvLZnvQmg9tjJLMcNx6maFczX0+jBLZ1Mjw70NANx7TAJNNL2pPbbyQJiFyabzQVx7OT+LMuUeRw1GGM06AvbcHus9mElJmCtUobAfZJ1lr+8T4uZj5qsPteW+4Ntwz1EIPtmsZSrXZRr+bV+DifG+blzvxWlHI79CIzOxtxtqN/lhNkSMo7yG2TLKh7Cy1bxvq2K3xUKxxN65iBRZ7jSR9z3ShWrwFwhR80EpTU1/vAdCnndRUgOy6PHYrvlGZML21Ezb5VxkwjbUnfGmbLLZK1motU5Cr8abgotsuefWjWA69AN7yPGWUJumzo2ReJqYjr3LqAkwG3bx/oyp8JBt5eGh/mkP3Pm+DA2Gw3kg/dnlTHcOPRQo4/Lg3EOuO27u67KfLYkFGrMYDWnNuBw35nMy3IWYEXEzvZu8UUXkUTBnzY3vq0kxe8JEE9VBWlVn17r0iJ+V0YKpRtxuoWJhbZhlRMfYrLAFM44hTqbbN2MORU/slbyLc7Dc6b3a/NjndlZlDZPh+4bk3fIsGLzMcDKcCANmGpN8JexCCCGEEEIIIYQQQgghhBBCCCHEGdzc/A+cmshZH9A9IAAAAABJRU5ErkJggg==";

        private void SetPackageProperties(OpenXmlPackage document)
        {
            document.PackageProperties.Creator = "TQ";
            document.PackageProperties.Created = DateTime.Now;
            document.PackageProperties.Modified = DateTime.Now;
            document.PackageProperties.LastModifiedBy = "TQ";
        }
        private Stream GetBinaryDataStream(string base64String)
        {
            return new MemoryStream(Convert.FromBase64String(base64String));
        }
        public void CrearPartes(SpreadsheetDocument document, int anio, List<EvaluacionProveedorDTO> data, List<SummaryDTO> summary, string calificacionCualitativa, decimal objetivo)
        {
            ExtendedFilePropertiesPart extendedFilePropertiesPart1 = document.AddNewPart<ExtendedFilePropertiesPart>("rId3");
            GenerateExtendedFilePropertiesPart1Content(extendedFilePropertiesPart1);

            WorkbookPart workbookPart1 = document.AddWorkbookPart();
            GenerateWorkbookPart1Content(workbookPart1);

            WorksheetPart worksheetPart1 = workbookPart1.AddNewPart<WorksheetPart>("rId3");
            GenerateWorksheetPart1Content(worksheetPart1, summary);

            WorksheetPart worksheetPart2 = workbookPart1.AddNewPart<WorksheetPart>("rId2");
            GenerateWorksheetPart2Content(worksheetPart2, data);

            ChartsheetPart chartsheetPart1 = workbookPart1.AddNewPart<ChartsheetPart>("rId1");
            GenerateChartsheetPart1Content(chartsheetPart1);

            DrawingsPart drawingsPart1 = chartsheetPart1.AddNewPart<DrawingsPart>("rId1");
            GenerateDrawingsPart1Content(drawingsPart1);

            ChartPart chartPart1 = drawingsPart1.AddNewPart<ChartPart>("rId1");
            GenerateChartPart1Content(chartPart1);

            GenerateChartPart1Content2(chartPart1, objetivo);

            ChartDrawingPart chartDrawingPart1 = chartPart1.AddNewPart<ChartDrawingPart>("rId3");
            decimal promedio = data.Average(x => x.IndicadorCumplimientoDefinitivo);
            GenerateChartDrawingPart1Content(chartDrawingPart1, anio, promedio, calificacionCualitativa);

            ImagePart imagePart1 = chartDrawingPart1.AddNewPart<ImagePart>("image/svg+xml", "rId2");
            GenerarLogoTq1Content(imagePart1);

            ImagePart imagePart2 = chartDrawingPart1.AddNewPart<ImagePart>("image/png", "rId1");
            GenerarLogoTq2Content(imagePart2);

            ChartColorStylePart chartColorStylePart1 = chartPart1.AddNewPart<ChartColorStylePart>("rId2");
            GenerateChartColorStylePart1Content(chartColorStylePart1);

            ChartStylePart chartStylePart1 = chartPart1.AddNewPart<ChartStylePart>("rId1");
            GenerateChartStylePart1Content(chartStylePart1);

            SharedStringTablePart sharedStringTablePart1 = workbookPart1.AddNewPart<SharedStringTablePart>("rId6");
            GenerateSharedStringTablePart1Content(sharedStringTablePart1);

            WorkbookStylesPart workbookStylesPart1 = workbookPart1.AddNewPart<WorkbookStylesPart>("rId5");
            GenerateWorkbookStylesPart1Content(workbookStylesPart1);

            ThemePart themePart1 = workbookPart1.AddNewPart<ThemePart>("rId4");
            GenerateThemePart1Content(themePart1);

            SetPackageProperties(document);

            // ... después de crear el documento
            var validator = new OpenXmlValidator();
            var errors = validator.Validate(document).ToList();
            if (errors.Any())
            {
                foreach (var error in errors)
                {
                    Debug.WriteLine($"Error de validación: {error.Description}");
                }
            }
        }

        public byte[] GenerarArchivo(string filePath, int anio, List<EvaluacionProveedorDTO> data, List<SummaryDTO> summary, string calificacionCualitativa, decimal objetivo)
        {
            byte[] bytes;
            using (SpreadsheetDocument package = SpreadsheetDocument.Create(filePath, SpreadsheetDocumentType.Workbook))
            {
                CrearPartes(package, anio, data, summary, calificacionCualitativa, objetivo);

                using (var memoryStream = new MemoryStream())
                {
                    package.Clone(memoryStream);
                    bytes = memoryStream.ToArray();
                }
            }
            return bytes;
        }

        public void GenerateChartColorStylePart1Content(ChartColorStylePart chartColorStylePart1)
        {
            Cs.ColorStyle colorStyle1 = new Cs.ColorStyle() { Method = "cycle", Id = (UInt32Value)11U };
            colorStyle1.AddNamespaceDeclaration("cs", "http://schemas.microsoft.com/office/drawing/2012/chartStyle");
            colorStyle1.AddNamespaceDeclaration("a", "http://schemas.openxmlformats.org/drawingml/2006/main");
            A.SchemeColor schemeColor10 = new A.SchemeColor() { Val = A.SchemeColorValues.Accent1 };
            A.SchemeColor schemeColor11 = new A.SchemeColor() { Val = A.SchemeColorValues.Accent3 };
            A.SchemeColor schemeColor12 = new A.SchemeColor() { Val = A.SchemeColorValues.Accent5 };
            Cs.ColorStyleVariation colorStyleVariation1 = new Cs.ColorStyleVariation();

            Cs.ColorStyleVariation colorStyleVariation2 = new Cs.ColorStyleVariation();
            A.LuminanceModulation luminanceModulation5 = new A.LuminanceModulation() { Val = 60000 };

            colorStyleVariation2.Append(luminanceModulation5);

            Cs.ColorStyleVariation colorStyleVariation3 = new Cs.ColorStyleVariation();
            A.LuminanceModulation luminanceModulation6 = new A.LuminanceModulation() { Val = 80000 };
            A.LuminanceOffset luminanceOffset5 = new A.LuminanceOffset() { Val = 20000 };

            colorStyleVariation3.Append(luminanceModulation6);
            colorStyleVariation3.Append(luminanceOffset5);

            Cs.ColorStyleVariation colorStyleVariation4 = new Cs.ColorStyleVariation();
            A.LuminanceModulation luminanceModulation7 = new A.LuminanceModulation() { Val = 80000 };

            colorStyleVariation4.Append(luminanceModulation7);

            Cs.ColorStyleVariation colorStyleVariation5 = new Cs.ColorStyleVariation();
            A.LuminanceModulation luminanceModulation8 = new A.LuminanceModulation() { Val = 60000 };
            A.LuminanceOffset luminanceOffset6 = new A.LuminanceOffset() { Val = 40000 };

            colorStyleVariation5.Append(luminanceModulation8);
            colorStyleVariation5.Append(luminanceOffset6);

            Cs.ColorStyleVariation colorStyleVariation6 = new Cs.ColorStyleVariation();
            A.LuminanceModulation luminanceModulation9 = new A.LuminanceModulation() { Val = 50000 };

            colorStyleVariation6.Append(luminanceModulation9);

            Cs.ColorStyleVariation colorStyleVariation7 = new Cs.ColorStyleVariation();
            A.LuminanceModulation luminanceModulation10 = new A.LuminanceModulation() { Val = 70000 };
            A.LuminanceOffset luminanceOffset7 = new A.LuminanceOffset() { Val = 30000 };

            colorStyleVariation7.Append(luminanceModulation10);
            colorStyleVariation7.Append(luminanceOffset7);

            Cs.ColorStyleVariation colorStyleVariation8 = new Cs.ColorStyleVariation();
            A.LuminanceModulation luminanceModulation11 = new A.LuminanceModulation() { Val = 70000 };

            colorStyleVariation8.Append(luminanceModulation11);

            Cs.ColorStyleVariation colorStyleVariation9 = new Cs.ColorStyleVariation();
            A.LuminanceModulation luminanceModulation12 = new A.LuminanceModulation() { Val = 50000 };
            A.LuminanceOffset luminanceOffset8 = new A.LuminanceOffset() { Val = 50000 };

            colorStyleVariation9.Append(luminanceModulation12);
            colorStyleVariation9.Append(luminanceOffset8);

            colorStyle1.Append(schemeColor10);
            colorStyle1.Append(schemeColor11);
            colorStyle1.Append(schemeColor12);
            colorStyle1.Append(colorStyleVariation1);
            colorStyle1.Append(colorStyleVariation2);
            colorStyle1.Append(colorStyleVariation3);
            colorStyle1.Append(colorStyleVariation4);
            colorStyle1.Append(colorStyleVariation5);
            colorStyle1.Append(colorStyleVariation6);
            colorStyle1.Append(colorStyleVariation7);
            colorStyle1.Append(colorStyleVariation8);
            colorStyle1.Append(colorStyleVariation9);

            chartColorStylePart1.ColorStyle = colorStyle1;
        }

        public void GenerateChartDrawingPart1Content(ChartDrawingPart chartDrawingPart1, int anio, decimal promedio, string calificacionCualitativa)
        {
            C.UserShapes userShapes1 = new C.UserShapes();
            userShapes1.AddNamespaceDeclaration("c", "http://schemas.openxmlformats.org/drawingml/2006/chart");

            Cdr.RelativeAnchorSize relativeAnchorSize1 = new Cdr.RelativeAnchorSize();
            relativeAnchorSize1.AddNamespaceDeclaration("cdr", "http://schemas.openxmlformats.org/drawingml/2006/chartDrawing");

            Cdr.FromAnchor fromAnchor1 = new Cdr.FromAnchor();
            Cdr.XPosition xPosition1 = new Cdr.XPosition();
            xPosition1.Text = "0.0191";
            Cdr.YPosition yPosition1 = new Cdr.YPosition();
            yPosition1.Text = "0.01171";

            fromAnchor1.Append(xPosition1);
            fromAnchor1.Append(yPosition1);

            Cdr.ToAnchor toAnchor1 = new Cdr.ToAnchor();
            Cdr.XPosition xPosition2 = new Cdr.XPosition();
            xPosition2.Text = "0.0851";
            Cdr.YPosition yPosition2 = new Cdr.YPosition();
            yPosition2.Text = "0.10262";

            toAnchor1.Append(xPosition2);
            toAnchor1.Append(yPosition2);

            Cdr.Picture picture1 = new Cdr.Picture();

            Cdr.NonVisualPictureProperties nonVisualPictureProperties1 = new Cdr.NonVisualPictureProperties();

            Cdr.NonVisualDrawingProperties nonVisualDrawingProperties2 = new Cdr.NonVisualDrawingProperties() { Id = (UInt32Value)3U, Name = "Graphic 2" };

            A.NonVisualDrawingPropertiesExtensionList nonVisualDrawingPropertiesExtensionList2 = new A.NonVisualDrawingPropertiesExtensionList();
            nonVisualDrawingPropertiesExtensionList2.AddNamespaceDeclaration("a", "http://schemas.openxmlformats.org/drawingml/2006/main");

            A.NonVisualDrawingPropertiesExtension nonVisualDrawingPropertiesExtension2 = new A.NonVisualDrawingPropertiesExtension() { Uri = "{FF2B5EF4-FFF2-40B4-BE49-F238E27FC236}" };

            OpenXmlUnknownElement openXmlUnknownElement9 = OpenXmlUnknownElement.CreateOpenXmlUnknownElement("<a16:creationId xmlns:a16=\"http://schemas.microsoft.com/office/drawing/2014/main\" id=\"{80D43D45-2241-0625-208D-4A167D70294C}\" />");

            nonVisualDrawingPropertiesExtension2.Append(openXmlUnknownElement9);

            nonVisualDrawingPropertiesExtensionList2.Append(nonVisualDrawingPropertiesExtension2);

            nonVisualDrawingProperties2.Append(nonVisualDrawingPropertiesExtensionList2);

            Cdr.NonVisualPictureDrawingProperties nonVisualPictureDrawingProperties1 = new Cdr.NonVisualPictureDrawingProperties();

            A.PictureLocks pictureLocks1 = new A.PictureLocks() { NoChangeAspect = true };
            pictureLocks1.AddNamespaceDeclaration("a", "http://schemas.openxmlformats.org/drawingml/2006/main");

            nonVisualPictureDrawingProperties1.Append(pictureLocks1);

            nonVisualPictureProperties1.Append(nonVisualDrawingProperties2);
            nonVisualPictureProperties1.Append(nonVisualPictureDrawingProperties1);

            Cdr.BlipFill blipFill1 = new Cdr.BlipFill();

            A.Blip blip1 = new A.Blip() { Embed = "rId1" };
            blip1.AddNamespaceDeclaration("a", "http://schemas.openxmlformats.org/drawingml/2006/main");
            blip1.AddNamespaceDeclaration("r", "http://schemas.openxmlformats.org/officeDocument/2006/relationships");

            A.BlipExtensionList blipExtensionList1 = new A.BlipExtensionList();

            A.BlipExtension blipExtension1 = new A.BlipExtension() { Uri = "{28A0092B-C50C-407E-A947-70E740481C1C}" };

            A14.UseLocalDpi useLocalDpi1 = new A14.UseLocalDpi() { Val = false };
            useLocalDpi1.AddNamespaceDeclaration("a14", "http://schemas.microsoft.com/office/drawing/2010/main");

            blipExtension1.Append(useLocalDpi1);

            A.BlipExtension blipExtension2 = new A.BlipExtension() { Uri = "{96DAC541-7B7A-43D3-8B79-37D633B846F1}" };

            OpenXmlUnknownElement openXmlUnknownElement10 = OpenXmlUnknownElement.CreateOpenXmlUnknownElement("<asvg:svgBlip xmlns:asvg=\"http://schemas.microsoft.com/office/drawing/2016/SVG/main\" r:embed=\"rId2\" xmlns:r=\"http://schemas.openxmlformats.org/officeDocument/2006/relationships\" />");

            blipExtension2.Append(openXmlUnknownElement10);

            blipExtensionList1.Append(blipExtension1);
            blipExtensionList1.Append(blipExtension2);

            blip1.Append(blipExtensionList1);

            A.Stretch stretch1 = new A.Stretch();
            stretch1.AddNamespaceDeclaration("a", "http://schemas.openxmlformats.org/drawingml/2006/main");
            A.FillRectangle fillRectangle1 = new A.FillRectangle();

            stretch1.Append(fillRectangle1);

            blipFill1.Append(blip1);
            blipFill1.Append(stretch1);

            Cdr.ShapeProperties shapeProperties3 = new Cdr.ShapeProperties();

            A.Transform2D transform2D1 = new A.Transform2D();
            transform2D1.AddNamespaceDeclaration("a", "http://schemas.openxmlformats.org/drawingml/2006/main");
            A.Offset offset2 = new A.Offset() { X = 165388L, Y = 73602L };
            A.Extents extents2 = new A.Extents() { Cx = 571500L, Cy = 571500L };

            transform2D1.Append(offset2);
            transform2D1.Append(extents2);

            A.PresetGeometry presetGeometry1 = new A.PresetGeometry() { Preset = A.ShapeTypeValues.Rectangle };
            presetGeometry1.AddNamespaceDeclaration("a", "http://schemas.openxmlformats.org/drawingml/2006/main");
            A.AdjustValueList adjustValueList1 = new A.AdjustValueList();

            presetGeometry1.Append(adjustValueList1);

            shapeProperties3.Append(transform2D1);
            shapeProperties3.Append(presetGeometry1);

            picture1.Append(nonVisualPictureProperties1);
            picture1.Append(blipFill1);
            picture1.Append(shapeProperties3);

            relativeAnchorSize1.Append(fromAnchor1);
            relativeAnchorSize1.Append(toAnchor1);
            relativeAnchorSize1.Append(picture1);

            Cdr.RelativeAnchorSize relativeAnchorSize2 = new Cdr.RelativeAnchorSize();
            relativeAnchorSize2.AddNamespaceDeclaration("cdr", "http://schemas.openxmlformats.org/drawingml/2006/chartDrawing");

            Cdr.FromAnchor fromAnchor2 = new Cdr.FromAnchor();
            Cdr.XPosition xPosition3 = new Cdr.XPosition();
            xPosition3.Text = "0.24772";
            Cdr.YPosition yPosition3 = new Cdr.YPosition();
            yPosition3.Text = "0.05303";

            fromAnchor2.Append(xPosition3);
            fromAnchor2.Append(yPosition3);

            Cdr.ToAnchor toAnchor2 = new Cdr.ToAnchor();
            Cdr.XPosition xPosition4 = new Cdr.XPosition();
            xPosition4.Text = "0.8558";
            Cdr.YPosition yPosition4 = new Cdr.YPosition();
            yPosition4.Text = "0.11061";

            toAnchor2.Append(xPosition4);
            toAnchor2.Append(yPosition4);

            Cdr.Shape shape1 = new Cdr.Shape() { Macro = "", TextLink = "" };

            Cdr.NonVisualShapeProperties nonVisualShapeProperties1 = new Cdr.NonVisualShapeProperties();

            Cdr.NonVisualDrawingProperties nonVisualDrawingProperties3 = new Cdr.NonVisualDrawingProperties() { Id = (UInt32Value)4U, Name = "TextBox 3" };

            A.NonVisualDrawingPropertiesExtensionList nonVisualDrawingPropertiesExtensionList3 = new A.NonVisualDrawingPropertiesExtensionList();
            nonVisualDrawingPropertiesExtensionList3.AddNamespaceDeclaration("a", "http://schemas.openxmlformats.org/drawingml/2006/main");

            A.NonVisualDrawingPropertiesExtension nonVisualDrawingPropertiesExtension3 = new A.NonVisualDrawingPropertiesExtension() { Uri = "{FF2B5EF4-FFF2-40B4-BE49-F238E27FC236}" };

            OpenXmlUnknownElement openXmlUnknownElement11 = OpenXmlUnknownElement.CreateOpenXmlUnknownElement("<a16:creationId xmlns:a16=\"http://schemas.microsoft.com/office/drawing/2014/main\" id=\"{D4807363-0BD6-EA75-7472-FC0F368F721D}\" />");

            nonVisualDrawingPropertiesExtension3.Append(openXmlUnknownElement11);

            nonVisualDrawingPropertiesExtensionList3.Append(nonVisualDrawingPropertiesExtension3);

            nonVisualDrawingProperties3.Append(nonVisualDrawingPropertiesExtensionList3);
            Cdr.NonVisualShapeDrawingProperties nonVisualShapeDrawingProperties1 = new Cdr.NonVisualShapeDrawingProperties() { TextBox = true };

            nonVisualShapeProperties1.Append(nonVisualDrawingProperties3);
            nonVisualShapeProperties1.Append(nonVisualShapeDrawingProperties1);

            Cdr.ShapeProperties shapeProperties4 = new Cdr.ShapeProperties();

            A.Transform2D transform2D2 = new A.Transform2D();
            transform2D2.AddNamespaceDeclaration("a", "http://schemas.openxmlformats.org/drawingml/2006/main");
            A.Offset offset3 = new A.Offset() { X = 2145031L, Y = 333375L };
            A.Extents extents3 = new A.Extents() { Cx = 5265419L, Cy = 361950L };

            transform2D2.Append(offset3);
            transform2D2.Append(extents3);

            A.PresetGeometry presetGeometry2 = new A.PresetGeometry() { Preset = A.ShapeTypeValues.Rectangle };
            presetGeometry2.AddNamespaceDeclaration("a", "http://schemas.openxmlformats.org/drawingml/2006/main");
            A.AdjustValueList adjustValueList2 = new A.AdjustValueList();

            presetGeometry2.Append(adjustValueList2);

            shapeProperties4.Append(transform2D2);
            shapeProperties4.Append(presetGeometry2);

            Cdr.TextBody textBody1 = new Cdr.TextBody();

            A.BodyProperties bodyProperties9 = new A.BodyProperties() { VerticalOverflow = A.TextVerticalOverflowValues.Clip, Wrap = A.TextWrappingValues.Square, RightToLeftColumns = false };
            bodyProperties9.AddNamespaceDeclaration("a", "http://schemas.openxmlformats.org/drawingml/2006/main");

            A.ListStyle listStyle9 = new A.ListStyle();
            listStyle9.AddNamespaceDeclaration("a", "http://schemas.openxmlformats.org/drawingml/2006/main");

            A.Paragraph paragraph9 = new A.Paragraph();
            paragraph9.AddNamespaceDeclaration("a", "http://schemas.openxmlformats.org/drawingml/2006/main");
            A.EndParagraphRunProperties endParagraphRunProperties7 = new A.EndParagraphRunProperties() { Language = "en-US", FontSize = 1100 };

            paragraph9.Append(endParagraphRunProperties7);

            textBody1.Append(bodyProperties9);
            textBody1.Append(listStyle9);
            textBody1.Append(paragraph9);

            shape1.Append(nonVisualShapeProperties1);
            shape1.Append(shapeProperties4);
            shape1.Append(textBody1);

            relativeAnchorSize2.Append(fromAnchor2);
            relativeAnchorSize2.Append(toAnchor2);
            relativeAnchorSize2.Append(shape1);

            Cdr.RelativeAnchorSize relativeAnchorSize3 = new Cdr.RelativeAnchorSize();
            relativeAnchorSize3.AddNamespaceDeclaration("cdr", "http://schemas.openxmlformats.org/drawingml/2006/chartDrawing");

            Cdr.FromAnchor fromAnchor3 = new Cdr.FromAnchor();
            Cdr.XPosition xPosition5 = new Cdr.XPosition();
            xPosition5.Text = "0.154";
            Cdr.YPosition yPosition5 = new Cdr.YPosition();
            yPosition5.Text = "0.08333";

            fromAnchor3.Append(xPosition5);
            fromAnchor3.Append(yPosition5);

            Cdr.ToAnchor toAnchor3 = new Cdr.ToAnchor();
            Cdr.XPosition xPosition6 = new Cdr.XPosition();
            xPosition6.Text = "0.9702";
            Cdr.YPosition yPosition6 = new Cdr.YPosition();
            yPosition6.Text = "0.14545";

            toAnchor3.Append(xPosition6);
            toAnchor3.Append(yPosition6);

            Cdr.Shape shape2 = new Cdr.Shape() { Macro = "", TextLink = "" };

            Cdr.NonVisualShapeProperties nonVisualShapeProperties2 = new Cdr.NonVisualShapeProperties();

            Cdr.NonVisualDrawingProperties nonVisualDrawingProperties4 = new Cdr.NonVisualDrawingProperties() { Id = (UInt32Value)5U, Name = "TextBox 4" };

            A.NonVisualDrawingPropertiesExtensionList nonVisualDrawingPropertiesExtensionList4 = new A.NonVisualDrawingPropertiesExtensionList();
            nonVisualDrawingPropertiesExtensionList4.AddNamespaceDeclaration("a", "http://schemas.openxmlformats.org/drawingml/2006/main");

            A.NonVisualDrawingPropertiesExtension nonVisualDrawingPropertiesExtension4 = new A.NonVisualDrawingPropertiesExtension() { Uri = "{FF2B5EF4-FFF2-40B4-BE49-F238E27FC236}" };

            OpenXmlUnknownElement openXmlUnknownElement12 = OpenXmlUnknownElement.CreateOpenXmlUnknownElement("<a16:creationId xmlns:a16=\"http://schemas.microsoft.com/office/drawing/2014/main\" id=\"{15B122E3-D636-E6D0-66BB-339F1A91B0C8}\" />");

            nonVisualDrawingPropertiesExtension4.Append(openXmlUnknownElement12);

            nonVisualDrawingPropertiesExtensionList4.Append(nonVisualDrawingPropertiesExtension4);

            nonVisualDrawingProperties4.Append(nonVisualDrawingPropertiesExtensionList4);
            Cdr.NonVisualShapeDrawingProperties nonVisualShapeDrawingProperties2 = new Cdr.NonVisualShapeDrawingProperties() { TextBox = true };

            nonVisualShapeProperties2.Append(nonVisualDrawingProperties4);
            nonVisualShapeProperties2.Append(nonVisualShapeDrawingProperties2);

            Cdr.ShapeProperties shapeProperties5 = new Cdr.ShapeProperties();

            A.Transform2D transform2D3 = new A.Transform2D();
            transform2D3.AddNamespaceDeclaration("a", "http://schemas.openxmlformats.org/drawingml/2006/main");
            A.Offset offset4 = new A.Offset() { X = 1333500L, Y = 523874L };
            A.Extents extents4 = new A.Extents() { Cx = 7067549L, Cy = 390525L };

            transform2D3.Append(offset4);
            transform2D3.Append(extents4);

            A.PresetGeometry presetGeometry3 = new A.PresetGeometry() { Preset = A.ShapeTypeValues.Rectangle };
            presetGeometry3.AddNamespaceDeclaration("a", "http://schemas.openxmlformats.org/drawingml/2006/main");
            A.AdjustValueList adjustValueList3 = new A.AdjustValueList();

            presetGeometry3.Append(adjustValueList3);

            shapeProperties5.Append(transform2D3);
            shapeProperties5.Append(presetGeometry3);

            Cdr.TextBody textBody2 = new Cdr.TextBody();

            A.BodyProperties bodyProperties10 = new A.BodyProperties() { VerticalOverflow = A.TextVerticalOverflowValues.Clip, Wrap = A.TextWrappingValues.Square, RightToLeftColumns = false, Anchor = A.TextAnchoringTypeValues.Center };
            bodyProperties10.AddNamespaceDeclaration("a", "http://schemas.openxmlformats.org/drawingml/2006/main");

            A.ListStyle listStyle10 = new A.ListStyle();
            listStyle10.AddNamespaceDeclaration("a", "http://schemas.openxmlformats.org/drawingml/2006/main");

            A.Paragraph paragraph10 = new A.Paragraph();
            paragraph10.AddNamespaceDeclaration("a", "http://schemas.openxmlformats.org/drawingml/2006/main");
            A.ParagraphProperties paragraphProperties9 = new A.ParagraphProperties() { Alignment = A.TextAlignmentTypeValues.Center };

            A.Run run3 = new A.Run();

            A.RunProperties runProperties3 = new A.RunProperties() { Language = "en-US", FontSize = 1400, Bold = true };

            A.SolidFill solidFill20 = new A.SolidFill();
            A.RgbColorModelHex rgbColorModelHex11 = new A.RgbColorModelHex() { Val = "193A73" };

            solidFill20.Append(rgbColorModelHex11);
            A.LatinFont latinFont10 = new A.LatinFont() { Typeface = "Open Sans", PitchFamily = 2, CharacterSet = 0 };
            A.EastAsianFont eastAsianFont10 = new A.EastAsianFont() { Typeface = "Open Sans", PitchFamily = 2, CharacterSet = 0 };
            A.ComplexScriptFont complexScriptFont10 = new A.ComplexScriptFont() { Typeface = "Open Sans", PitchFamily = 2, CharacterSet = 0 };

            runProperties3.Append(solidFill20);
            runProperties3.Append(latinFont10);
            runProperties3.Append(eastAsianFont10);
            runProperties3.Append(complexScriptFont10);
            A.Text text3 = new A.Text();
            text3.Text = "CUMPLIMIENTO ACUMULADO";

            run3.Append(runProperties3);
            run3.Append(text3);

            A.Run run4 = new A.Run();

            A.RunProperties runProperties4 = new A.RunProperties() { Language = "en-US", FontSize = 1400, Bold = true, Baseline = 0 };

            A.SolidFill solidFill21 = new A.SolidFill();
            A.RgbColorModelHex rgbColorModelHex12 = new A.RgbColorModelHex() { Val = "193A73" };

            solidFill21.Append(rgbColorModelHex12);
            A.LatinFont latinFont11 = new A.LatinFont() { Typeface = "Open Sans", PitchFamily = 2, CharacterSet = 0 };
            A.EastAsianFont eastAsianFont11 = new A.EastAsianFont() { Typeface = "Open Sans", PitchFamily = 2, CharacterSet = 0 };
            A.ComplexScriptFont complexScriptFont11 = new A.ComplexScriptFont() { Typeface = "Open Sans", PitchFamily = 2, CharacterSet = 0 };

            runProperties4.Append(solidFill21);
            runProperties4.Append(latinFont11);
            runProperties4.Append(eastAsianFont11);
            runProperties4.Append(complexScriptFont11);
            A.Text text4 = new A.Text();
            text4.Text = $" AÑO {anio}: {calificacionCualitativa} ({decimal.Round(promedio * 10, 0)}%)";

            run4.Append(runProperties4);
            run4.Append(text4);

            A.EndParagraphRunProperties endParagraphRunProperties8 = new A.EndParagraphRunProperties() { Language = "en-US", FontSize = 1400, Bold = true };

            A.SolidFill solidFill22 = new A.SolidFill();
            A.RgbColorModelHex rgbColorModelHex13 = new A.RgbColorModelHex() { Val = "193A73" };

            solidFill22.Append(rgbColorModelHex13);
            A.LatinFont latinFont12 = new A.LatinFont() { Typeface = "Open Sans", PitchFamily = 2, CharacterSet = 0 };
            A.EastAsianFont eastAsianFont12 = new A.EastAsianFont() { Typeface = "Open Sans", PitchFamily = 2, CharacterSet = 0 };
            A.ComplexScriptFont complexScriptFont12 = new A.ComplexScriptFont() { Typeface = "Open Sans", PitchFamily = 2, CharacterSet = 0 };

            endParagraphRunProperties8.Append(solidFill22);
            endParagraphRunProperties8.Append(latinFont12);
            endParagraphRunProperties8.Append(eastAsianFont12);
            endParagraphRunProperties8.Append(complexScriptFont12);

            paragraph10.Append(paragraphProperties9);
            paragraph10.Append(run3);
            paragraph10.Append(run4);
            paragraph10.Append(endParagraphRunProperties8);

            textBody2.Append(bodyProperties10);
            textBody2.Append(listStyle10);
            textBody2.Append(paragraph10);

            shape2.Append(nonVisualShapeProperties2);
            shape2.Append(shapeProperties5);
            shape2.Append(textBody2);

            relativeAnchorSize3.Append(fromAnchor3);
            relativeAnchorSize3.Append(toAnchor3);
            relativeAnchorSize3.Append(shape2);

            userShapes1.Append(relativeAnchorSize1);
            userShapes1.Append(relativeAnchorSize2);
            userShapes1.Append(relativeAnchorSize3);

            chartDrawingPart1.UserShapes = userShapes1;

        }

        // TODO: Verificar los datos
        public void GenerateChartPart1Content(ChartPart chartPart1)
        {
            C.ChartSpace chartSpace1 = new C.ChartSpace();
            chartSpace1.AddNamespaceDeclaration("c", "http://schemas.openxmlformats.org/drawingml/2006/chart");
            chartSpace1.AddNamespaceDeclaration("a", "http://schemas.openxmlformats.org/drawingml/2006/main");
            chartSpace1.AddNamespaceDeclaration("r", "http://schemas.openxmlformats.org/officeDocument/2006/relationships");
            chartSpace1.AddNamespaceDeclaration("c16r2", "http://schemas.microsoft.com/office/drawing/2015/06/chart");
            C.Date1904 date19041 = new C.Date1904() { Val = false };
            C.EditingLanguage editingLanguage1 = new C.EditingLanguage() { Val = "en-US" };
            C.RoundedCorners roundedCorners1 = new C.RoundedCorners() { Val = false };

            AlternateContent alternateContent2 = new AlternateContent();
            alternateContent2.AddNamespaceDeclaration("mc", "http://schemas.openxmlformats.org/markup-compatibility/2006");

            AlternateContentChoice alternateContentChoice2 = new AlternateContentChoice() { Requires = "c14" };
            alternateContentChoice2.AddNamespaceDeclaration("c14", "http://schemas.microsoft.com/office/drawing/2007/8/2/chart");
            C14.Style style1 = new C14.Style() { Val = 102 };

            alternateContentChoice2.Append(style1);

            AlternateContentFallback alternateContentFallback1 = new AlternateContentFallback();
            C.Style style2 = new C.Style() { Val = 2 };

            alternateContentFallback1.Append(style2);

            alternateContent2.Append(alternateContentChoice2);
            alternateContent2.Append(alternateContentFallback1);

            C.Chart chart1 = new C.Chart();

            C.Title title1 = new C.Title();

            C.ChartText chartText1 = new C.ChartText();

            C.RichText richText1 = new C.RichText();
            A.BodyProperties bodyProperties1 = new A.BodyProperties() { Rotation = 0, UseParagraphSpacing = true, VerticalOverflow = A.TextVerticalOverflowValues.Ellipsis, Vertical = A.TextVerticalValues.Horizontal, Wrap = A.TextWrappingValues.Square, Anchor = A.TextAnchoringTypeValues.Center, AnchorCenter = true };
            A.ListStyle listStyle1 = new A.ListStyle();

            A.Paragraph paragraph1 = new A.Paragraph();

            A.ParagraphProperties paragraphProperties1 = new A.ParagraphProperties() { Alignment = A.TextAlignmentTypeValues.Center };

            A.DefaultRunProperties defaultRunProperties1 = new A.DefaultRunProperties() { FontSize = 2000, Bold = true, Italic = false, Underline = A.TextUnderlineValues.None, Strike = A.TextStrikeValues.NoStrike, Kerning = 1200, Baseline = 0 };

            A.SolidFill solidFill1 = new A.SolidFill();
            A.RgbColorModelHex rgbColorModelHex1 = new A.RgbColorModelHex() { Val = "2559BF" };

            solidFill1.Append(rgbColorModelHex1);
            A.LatinFont latinFont1 = new A.LatinFont() { Typeface = "Open Sans", PitchFamily = 2, CharacterSet = 0 };
            A.EastAsianFont eastAsianFont1 = new A.EastAsianFont() { Typeface = "Open Sans", PitchFamily = 2, CharacterSet = 0 };
            A.ComplexScriptFont complexScriptFont1 = new A.ComplexScriptFont() { Typeface = "Open Sans", PitchFamily = 2, CharacterSet = 0 };

            defaultRunProperties1.Append(solidFill1);
            defaultRunProperties1.Append(latinFont1);
            defaultRunProperties1.Append(eastAsianFont1);
            defaultRunProperties1.Append(complexScriptFont1);

            paragraphProperties1.Append(defaultRunProperties1);

            A.Run run1 = new A.Run();

            A.RunProperties runProperties1 = new A.RunProperties() { Language = "en-US", FontSize = 2000 };

            A.SolidFill solidFill2 = new A.SolidFill();
            A.RgbColorModelHex rgbColorModelHex2 = new A.RgbColorModelHex() { Val = "2559BF" };

            solidFill2.Append(rgbColorModelHex2);
            A.LatinFont latinFont2 = new A.LatinFont() { Typeface = "Open Sans", PitchFamily = 2, CharacterSet = 0 };
            A.EastAsianFont eastAsianFont2 = new A.EastAsianFont() { Typeface = "Open Sans", PitchFamily = 2, CharacterSet = 0 };
            A.ComplexScriptFont complexScriptFont2 = new A.ComplexScriptFont() { Typeface = "Open Sans", PitchFamily = 2, CharacterSet = 0 };

            runProperties1.Append(solidFill2);
            runProperties1.Append(latinFont2);
            runProperties1.Append(eastAsianFont2);
            runProperties1.Append(complexScriptFont2);
            A.Text text1 = new A.Text();
            text1.Text = "INDICADORES GESTIÓN TECNOQUÍMICAS";

            run1.Append(runProperties1);
            run1.Append(text1);

            paragraph1.Append(paragraphProperties1);
            paragraph1.Append(run1);

            richText1.Append(bodyProperties1);
            richText1.Append(listStyle1);
            richText1.Append(paragraph1);

            chartText1.Append(richText1);

            C.Layout layout1 = new C.Layout();

            C.ManualLayout manualLayout1 = new C.ManualLayout();
            C.LeftMode leftMode1 = new C.LeftMode() { Val = C.LayoutModeValues.Edge };
            C.TopMode topMode1 = new C.TopMode() { Val = C.LayoutModeValues.Edge };
            C.Left left1 = new C.Left() { Val = 0.25985903139255612D };
            C.Top top1 = new C.Top() { Val = 1.2121212121212121E-2D };

            manualLayout1.Append(leftMode1);
            manualLayout1.Append(topMode1);
            manualLayout1.Append(left1);
            manualLayout1.Append(top1);

            layout1.Append(manualLayout1);
            C.Overlay overlay1 = new C.Overlay() { Val = false };

            C.ChartShapeProperties chartShapeProperties1 = new C.ChartShapeProperties();
            A.NoFill noFill1 = new A.NoFill();

            A.Outline outline1 = new A.Outline();
            A.NoFill noFill2 = new A.NoFill();

            outline1.Append(noFill2);
            A.EffectList effectList1 = new A.EffectList();

            chartShapeProperties1.Append(noFill1);
            chartShapeProperties1.Append(outline1);
            chartShapeProperties1.Append(effectList1);

            C.TextProperties textProperties1 = new C.TextProperties();
            A.BodyProperties bodyProperties2 = new A.BodyProperties() { Rotation = 0, UseParagraphSpacing = true, VerticalOverflow = A.TextVerticalOverflowValues.Ellipsis, Vertical = A.TextVerticalValues.Horizontal, Wrap = A.TextWrappingValues.Square, Anchor = A.TextAnchoringTypeValues.Center, AnchorCenter = true };
            A.ListStyle listStyle2 = new A.ListStyle();

            A.Paragraph paragraph2 = new A.Paragraph();

            A.ParagraphProperties paragraphProperties2 = new A.ParagraphProperties() { Alignment = A.TextAlignmentTypeValues.Center };

            A.DefaultRunProperties defaultRunProperties2 = new A.DefaultRunProperties() { FontSize = 2000, Bold = true, Italic = false, Underline = A.TextUnderlineValues.None, Strike = A.TextStrikeValues.NoStrike, Kerning = 1200, Baseline = 0 };

            A.SolidFill solidFill3 = new A.SolidFill();
            A.RgbColorModelHex rgbColorModelHex3 = new A.RgbColorModelHex() { Val = "2559BF" };

            solidFill3.Append(rgbColorModelHex3);
            A.LatinFont latinFont3 = new A.LatinFont() { Typeface = "Open Sans", PitchFamily = 2, CharacterSet = 0 };
            A.EastAsianFont eastAsianFont3 = new A.EastAsianFont() { Typeface = "Open Sans", PitchFamily = 2, CharacterSet = 0 };
            A.ComplexScriptFont complexScriptFont3 = new A.ComplexScriptFont() { Typeface = "Open Sans", PitchFamily = 2, CharacterSet = 0 };

            defaultRunProperties2.Append(solidFill3);
            defaultRunProperties2.Append(latinFont3);
            defaultRunProperties2.Append(eastAsianFont3);
            defaultRunProperties2.Append(complexScriptFont3);

            paragraphProperties2.Append(defaultRunProperties2);
            A.EndParagraphRunProperties endParagraphRunProperties1 = new A.EndParagraphRunProperties() { Language = "en-US" };

            paragraph2.Append(paragraphProperties2);
            paragraph2.Append(endParagraphRunProperties1);

            textProperties1.Append(bodyProperties2);
            textProperties1.Append(listStyle2);
            textProperties1.Append(paragraph2);

            title1.Append(chartText1);
            title1.Append(layout1);
            title1.Append(overlay1);
            title1.Append(chartShapeProperties1);
            title1.Append(textProperties1);
            C.AutoTitleDeleted autoTitleDeleted1 = new C.AutoTitleDeleted() { Val = false };

            C.PlotArea plotArea1 = new C.PlotArea();

            C.Layout layout2 = new C.Layout();

            C.ManualLayout manualLayout2 = new C.ManualLayout();
            C.LayoutTarget layoutTarget1 = new C.LayoutTarget() { Val = C.LayoutTargetValues.Inner };
            C.LeftMode leftMode2 = new C.LeftMode() { Val = C.LayoutModeValues.Edge };
            C.TopMode topMode2 = new C.TopMode() { Val = C.LayoutModeValues.Edge };
            C.Left left2 = new C.Left() { Val = 0.18568253873299173D };
            C.Top top2 = new C.Top() { Val = 0.15941414141414142D };
            C.Width width1 = new C.Width() { Val = 0.77916273197729413D };
            C.Height height1 = new C.Height() { Val = 0.65217927304541479D };

            manualLayout2.Append(layoutTarget1);
            manualLayout2.Append(leftMode2);
            manualLayout2.Append(topMode2);
            manualLayout2.Append(left2);
            manualLayout2.Append(top2);
            manualLayout2.Append(width1);
            manualLayout2.Append(height1);

            layout2.Append(manualLayout2);

            C.BarChart barChart1 = new C.BarChart();
            C.BarDirection barDirection1 = new C.BarDirection() { Val = C.BarDirectionValues.Column };
            C.BarGrouping barGrouping1 = new C.BarGrouping() { Val = C.BarGroupingValues.Clustered };
            C.VaryColors varyColors1 = new C.VaryColors() { Val = false };

            C.BarChartSeries barChartSeries1 = new C.BarChartSeries();
            C.Index index1 = new C.Index() { Val = (UInt32Value)0U };
            C.Order order1 = new C.Order() { Val = (UInt32Value)0U };

            C.SeriesText seriesText1 = new C.SeriesText();

            C.StringReference stringReference1 = new C.StringReference();
            C.Formula formula1 = new C.Formula();
            formula1.Text = "\'Tabla promedios\'!$B$1";

            C.StringCache stringCache1 = new C.StringCache();
            C.PointCount pointCount1 = new C.PointCount() { Val = (UInt32Value)1U };

            C.StringPoint stringPoint1 = new C.StringPoint() { Index = (UInt32Value)0U };
            C.NumericValue numericValue1 = new C.NumericValue();
            numericValue1.Text = "Indicador Cantidad";

            stringPoint1.Append(numericValue1);

            stringCache1.Append(pointCount1);
            stringCache1.Append(stringPoint1);

            stringReference1.Append(formula1);
            stringReference1.Append(stringCache1);

            seriesText1.Append(stringReference1);

            C.ChartShapeProperties chartShapeProperties2 = new C.ChartShapeProperties();

            A.SolidFill solidFill4 = new A.SolidFill();
            A.RgbColorModelHex rgbColorModelHex4 = new A.RgbColorModelHex() { Val = "093246" };

            solidFill4.Append(rgbColorModelHex4);

            A.Outline outline2 = new A.Outline();
            A.NoFill noFill3 = new A.NoFill();

            outline2.Append(noFill3);
            A.EffectList effectList2 = new A.EffectList();

            chartShapeProperties2.Append(solidFill4);
            chartShapeProperties2.Append(outline2);
            chartShapeProperties2.Append(effectList2);
            C.InvertIfNegative invertIfNegative1 = new C.InvertIfNegative() { Val = false };

            C.CategoryAxisData categoryAxisData1 = new C.CategoryAxisData();

            C.StringReference stringReference2 = new C.StringReference();
            C.Formula formula2 = new C.Formula();
            formula2.Text = "\'Tabla promedios\'!$A$2:$A$13";

            C.StringCache stringCache2 = new C.StringCache();
            C.PointCount pointCount2 = new C.PointCount() { Val = (UInt32Value)2U };
            stringCache2.Append(pointCount2);

            stringReference2.Append(formula2);
            stringReference2.Append(stringCache2);

            categoryAxisData1.Append(stringReference2);

            C.Values values1 = new C.Values();

            C.NumberReference numberReference1 = new C.NumberReference();
            C.Formula formula3 = new C.Formula();
            formula3.Text = "\'Tabla promedios\'!$B$2:$B$13";

            numberReference1.Append(formula3);

            values1.Append(numberReference1);

            C.BarSerExtensionList barSerExtensionList1 = new C.BarSerExtensionList();
            barSerExtensionList1.AddNamespaceDeclaration("c16r3", "http://schemas.microsoft.com/office/drawing/2017/03/chart");
            barSerExtensionList1.AddNamespaceDeclaration("c16", "http://schemas.microsoft.com/office/drawing/2014/chart");
            barSerExtensionList1.AddNamespaceDeclaration("c14", "http://schemas.microsoft.com/office/drawing/2007/8/2/chart");
            barSerExtensionList1.AddNamespaceDeclaration("mc", "http://schemas.openxmlformats.org/markup-compatibility/2006");

            C.BarSerExtension barSerExtension1 = new C.BarSerExtension() { Uri = "{C3380CC4-5D6E-409C-BE32-E72D297353CC}" };
            barSerExtension1.AddNamespaceDeclaration("c16", "http://schemas.microsoft.com/office/drawing/2014/chart");

            OpenXmlUnknownElement openXmlUnknownElement3 = OpenXmlUnknownElement.CreateOpenXmlUnknownElement("<c16:uniqueId val=\"{00000000-49EE-47FF-AC95-1BF1DDC5D4D8}\" xmlns:c16=\"http://schemas.microsoft.com/office/drawing/2014/chart\" />");

            barSerExtension1.Append(openXmlUnknownElement3);

            barSerExtensionList1.Append(barSerExtension1);

            barChartSeries1.Append(index1);
            barChartSeries1.Append(order1);
            barChartSeries1.Append(seriesText1);
            barChartSeries1.Append(chartShapeProperties2);
            barChartSeries1.Append(invertIfNegative1);
            barChartSeries1.Append(categoryAxisData1);
            barChartSeries1.Append(values1);
            barChartSeries1.Append(barSerExtensionList1);

            C.BarChartSeries barChartSeries2 = new C.BarChartSeries();
            C.Index index2 = new C.Index() { Val = (UInt32Value)1U };
            C.Order order2 = new C.Order() { Val = (UInt32Value)1U };

            C.SeriesText seriesText2 = new C.SeriesText();

            C.StringReference stringReference3 = new C.StringReference();
            C.Formula formula4 = new C.Formula();
            formula4.Text = "\'Tabla promedios\'!$C$1";


            stringReference3.Append(formula4);

            seriesText2.Append(stringReference3);

            C.ChartShapeProperties chartShapeProperties3 = new C.ChartShapeProperties();

            A.SolidFill solidFill5 = new A.SolidFill();
            A.RgbColorModelHex rgbColorModelHex5 = new A.RgbColorModelHex() { Val = "147AA0" };

            solidFill5.Append(rgbColorModelHex5);

            A.Outline outline3 = new A.Outline();
            A.NoFill noFill4 = new A.NoFill();

            outline3.Append(noFill4);
            A.EffectList effectList3 = new A.EffectList();

            chartShapeProperties3.Append(solidFill5);
            chartShapeProperties3.Append(outline3);
            chartShapeProperties3.Append(effectList3);
            C.InvertIfNegative invertIfNegative2 = new C.InvertIfNegative() { Val = false };

            C.CategoryAxisData categoryAxisData2 = new C.CategoryAxisData();

            C.StringReference stringReference4 = new C.StringReference();
            C.Formula formula5 = new C.Formula();
            formula5.Text = "\'Tabla promedios\'!$A$2:$A$13";

            stringReference4.Append(formula5);
            categoryAxisData2.Append(stringReference4);

            C.Values values2 = new C.Values();

            C.NumberReference numberReference2 = new C.NumberReference();
            C.Formula formula6 = new C.Formula();
            formula6.Text = "\'Tabla promedios\'!$C$2:$C$13";

            numberReference2.Append(formula6);

            values2.Append(numberReference2);

            C.BarSerExtensionList barSerExtensionList2 = new C.BarSerExtensionList();
            barSerExtensionList2.AddNamespaceDeclaration("c16r3", "http://schemas.microsoft.com/office/drawing/2017/03/chart");
            barSerExtensionList2.AddNamespaceDeclaration("c16", "http://schemas.microsoft.com/office/drawing/2014/chart");
            barSerExtensionList2.AddNamespaceDeclaration("c14", "http://schemas.microsoft.com/office/drawing/2007/8/2/chart");
            barSerExtensionList2.AddNamespaceDeclaration("mc", "http://schemas.openxmlformats.org/markup-compatibility/2006");

            C.BarSerExtension barSerExtension2 = new C.BarSerExtension() { Uri = "{C3380CC4-5D6E-409C-BE32-E72D297353CC}" };
            barSerExtension2.AddNamespaceDeclaration("c16", "http://schemas.microsoft.com/office/drawing/2014/chart");

            OpenXmlUnknownElement openXmlUnknownElement4 = OpenXmlUnknownElement.CreateOpenXmlUnknownElement("<c16:uniqueId val=\"{00000001-49EE-47FF-AC95-1BF1DDC5D4D8}\" xmlns:c16=\"http://schemas.microsoft.com/office/drawing/2014/chart\" />");

            barSerExtension2.Append(openXmlUnknownElement4);

            barSerExtensionList2.Append(barSerExtension2);

            barChartSeries2.Append(index2);
            barChartSeries2.Append(order2);
            barChartSeries2.Append(seriesText2);
            barChartSeries2.Append(chartShapeProperties3);
            barChartSeries2.Append(invertIfNegative2);
            barChartSeries2.Append(categoryAxisData2);
            barChartSeries2.Append(values2);
            barChartSeries2.Append(barSerExtensionList2);

            C.BarChartSeries barChartSeries3 = new C.BarChartSeries();
            C.Index index3 = new C.Index() { Val = (UInt32Value)2U };
            C.Order order3 = new C.Order() { Val = (UInt32Value)2U };

            C.SeriesText seriesText3 = new C.SeriesText();

            C.StringReference stringReference5 = new C.StringReference();
            C.Formula formula7 = new C.Formula();
            formula7.Text = "\'Tabla promedios\'!$D$1";
            stringReference5.Append(formula7);
            seriesText3.Append(stringReference5);

            C.ChartShapeProperties chartShapeProperties4 = new C.ChartShapeProperties();

            A.SolidFill solidFill6 = new A.SolidFill();
            A.RgbColorModelHex rgbColorModelHex6 = new A.RgbColorModelHex() { Val = "DAE2FF" };

            solidFill6.Append(rgbColorModelHex6);

            A.Outline outline4 = new A.Outline();
            A.NoFill noFill5 = new A.NoFill();

            outline4.Append(noFill5);
            A.EffectList effectList4 = new A.EffectList();

            chartShapeProperties4.Append(solidFill6);
            chartShapeProperties4.Append(outline4);
            chartShapeProperties4.Append(effectList4);
            C.InvertIfNegative invertIfNegative3 = new C.InvertIfNegative() { Val = false };

            C.CategoryAxisData categoryAxisData3 = new C.CategoryAxisData();

            C.StringReference stringReference6 = new C.StringReference();
            C.Formula formula8 = new C.Formula();
            formula8.Text = "\'Tabla promedios\'!$A$2:$A$13";
            stringReference6.Append(formula8);
            categoryAxisData3.Append(stringReference6);

            C.Values values3 = new C.Values();

            C.NumberReference numberReference3 = new C.NumberReference();
            C.Formula formula9 = new C.Formula();
            formula9.Text = "\'Tabla promedios\'!$D$2:$D$13";

            numberReference3.Append(formula9);
            values3.Append(numberReference3);

            C.BarSerExtensionList barSerExtensionList3 = new C.BarSerExtensionList();
            barSerExtensionList3.AddNamespaceDeclaration("c16r3", "http://schemas.microsoft.com/office/drawing/2017/03/chart");
            barSerExtensionList3.AddNamespaceDeclaration("c16", "http://schemas.microsoft.com/office/drawing/2014/chart");
            barSerExtensionList3.AddNamespaceDeclaration("c14", "http://schemas.microsoft.com/office/drawing/2007/8/2/chart");
            barSerExtensionList3.AddNamespaceDeclaration("mc", "http://schemas.openxmlformats.org/markup-compatibility/2006");

            C.BarSerExtension barSerExtension3 = new C.BarSerExtension() { Uri = "{C3380CC4-5D6E-409C-BE32-E72D297353CC}" };
            barSerExtension3.AddNamespaceDeclaration("c16", "http://schemas.microsoft.com/office/drawing/2014/chart");

            OpenXmlUnknownElement openXmlUnknownElement5 = OpenXmlUnknownElement.CreateOpenXmlUnknownElement("<c16:uniqueId val=\"{00000002-49EE-47FF-AC95-1BF1DDC5D4D8}\" xmlns:c16=\"http://schemas.microsoft.com/office/drawing/2014/chart\" />");

            barSerExtension3.Append(openXmlUnknownElement5);

            barSerExtensionList3.Append(barSerExtension3);

            barChartSeries3.Append(index3);
            barChartSeries3.Append(order3);
            barChartSeries3.Append(seriesText3);
            barChartSeries3.Append(chartShapeProperties4);
            barChartSeries3.Append(invertIfNegative3);
            barChartSeries3.Append(categoryAxisData3);
            barChartSeries3.Append(values3);
            barChartSeries3.Append(barSerExtensionList3);

            C.BarChartSeries barChartSeries4 = new C.BarChartSeries();
            C.Index index4 = new C.Index() { Val = (UInt32Value)3U };
            C.Order order4 = new C.Order() { Val = (UInt32Value)3U };

            C.SeriesText seriesText4 = new C.SeriesText();

            C.StringReference stringReference7 = new C.StringReference();
            C.Formula formula10 = new C.Formula();
            formula10.Text = "\'Tabla promedios\'!$E$1";

            stringReference7.Append(formula10);
            seriesText4.Append(stringReference7);

            C.ChartShapeProperties chartShapeProperties5 = new C.ChartShapeProperties();

            A.SolidFill solidFill7 = new A.SolidFill();
            A.RgbColorModelHex rgbColorModelHex7 = new A.RgbColorModelHex() { Val = "2559BF" };

            solidFill7.Append(rgbColorModelHex7);

            A.Outline outline5 = new A.Outline();
            A.NoFill noFill6 = new A.NoFill();

            outline5.Append(noFill6);
            A.EffectList effectList5 = new A.EffectList();

            chartShapeProperties5.Append(solidFill7);
            chartShapeProperties5.Append(outline5);
            chartShapeProperties5.Append(effectList5);
            C.InvertIfNegative invertIfNegative4 = new C.InvertIfNegative() { Val = false };

            C.CategoryAxisData categoryAxisData4 = new C.CategoryAxisData();

            C.StringReference stringReference8 = new C.StringReference();
            C.Formula formula11 = new C.Formula();
            formula11.Text = "\'Tabla promedios\'!$A$2:$A$13";

            stringReference8.Append(formula11);
            categoryAxisData4.Append(stringReference8);

            C.Values values4 = new C.Values();

            C.NumberReference numberReference4 = new C.NumberReference();
            C.Formula formula12 = new C.Formula();
            formula12.Text = "\'Tabla promedios\'!$E$2:$E$13";

            numberReference4.Append(formula12);
            values4.Append(numberReference4);

            C.BarSerExtensionList barSerExtensionList4 = new C.BarSerExtensionList();
            barSerExtensionList4.AddNamespaceDeclaration("c16r3", "http://schemas.microsoft.com/office/drawing/2017/03/chart");
            barSerExtensionList4.AddNamespaceDeclaration("c16", "http://schemas.microsoft.com/office/drawing/2014/chart");
            barSerExtensionList4.AddNamespaceDeclaration("c14", "http://schemas.microsoft.com/office/drawing/2007/8/2/chart");
            barSerExtensionList4.AddNamespaceDeclaration("mc", "http://schemas.openxmlformats.org/markup-compatibility/2006");

            C.BarSerExtension barSerExtension4 = new C.BarSerExtension() { Uri = "{C3380CC4-5D6E-409C-BE32-E72D297353CC}" };
            barSerExtension4.AddNamespaceDeclaration("c16", "http://schemas.microsoft.com/office/drawing/2014/chart");

            OpenXmlUnknownElement openXmlUnknownElement6 = OpenXmlUnknownElement.CreateOpenXmlUnknownElement("<c16:uniqueId val=\"{00000003-49EE-47FF-AC95-1BF1DDC5D4D8}\" xmlns:c16=\"http://schemas.microsoft.com/office/drawing/2014/chart\" />");

            barSerExtension4.Append(openXmlUnknownElement6);

            barSerExtensionList4.Append(barSerExtension4);

            barChartSeries4.Append(index4);
            barChartSeries4.Append(order4);
            barChartSeries4.Append(seriesText4);
            barChartSeries4.Append(chartShapeProperties5);
            barChartSeries4.Append(invertIfNegative4);
            barChartSeries4.Append(categoryAxisData4);
            barChartSeries4.Append(values4);
            barChartSeries4.Append(barSerExtensionList4);

            C.BarChartSeries barChartSeries5 = new C.BarChartSeries();
            C.Index index5 = new C.Index() { Val = (UInt32Value)4U };
            C.Order order5 = new C.Order() { Val = (UInt32Value)4U };

            C.SeriesText seriesText5 = new C.SeriesText();

            C.StringReference stringReference9 = new C.StringReference();
            C.Formula formula13 = new C.Formula();
            formula13.Text = "\'Tabla promedios\'!$F$1";

            stringReference9.Append(formula13);
            seriesText5.Append(stringReference9);

            C.ChartShapeProperties chartShapeProperties6 = new C.ChartShapeProperties();
            A.NoFill noFill7 = new A.NoFill();

            A.Outline outline6 = new A.Outline();
            A.NoFill noFill8 = new A.NoFill();

            outline6.Append(noFill8);
            A.EffectList effectList6 = new A.EffectList();

            chartShapeProperties6.Append(noFill7);
            chartShapeProperties6.Append(outline6);
            chartShapeProperties6.Append(effectList6);
            C.InvertIfNegative invertIfNegative5 = new C.InvertIfNegative() { Val = false };

            C.CategoryAxisData categoryAxisData5 = new C.CategoryAxisData();

            C.StringReference stringReference10 = new C.StringReference();
            C.Formula formula14 = new C.Formula();
            formula14.Text = "\'Tabla promedios\'!$A$2:$A$13";

            stringReference10.Append(formula14);
            categoryAxisData5.Append(stringReference10);

            C.Values values5 = new C.Values();

            C.NumberReference numberReference5 = new C.NumberReference();
            C.Formula formula15 = new C.Formula();
            formula15.Text = "\'Tabla promedios\'!$F$2:$F$13";

            numberReference5.Append(formula15);
            values5.Append(numberReference5);

            C.BarSerExtensionList barSerExtensionList5 = new C.BarSerExtensionList();
            barSerExtensionList5.AddNamespaceDeclaration("c16r3", "http://schemas.microsoft.com/office/drawing/2017/03/chart");
            barSerExtensionList5.AddNamespaceDeclaration("c16", "http://schemas.microsoft.com/office/drawing/2014/chart");
            barSerExtensionList5.AddNamespaceDeclaration("c14", "http://schemas.microsoft.com/office/drawing/2007/8/2/chart");
            barSerExtensionList5.AddNamespaceDeclaration("mc", "http://schemas.openxmlformats.org/markup-compatibility/2006");

            C.BarSerExtension barSerExtension5 = new C.BarSerExtension() { Uri = "{C3380CC4-5D6E-409C-BE32-E72D297353CC}" };
            barSerExtension5.AddNamespaceDeclaration("c16", "http://schemas.microsoft.com/office/drawing/2014/chart");

            OpenXmlUnknownElement openXmlUnknownElement7 = OpenXmlUnknownElement.CreateOpenXmlUnknownElement("<c16:uniqueId val=\"{00000004-49EE-47FF-AC95-1BF1DDC5D4D8}\" xmlns:c16=\"http://schemas.microsoft.com/office/drawing/2014/chart\" />");

            barSerExtension5.Append(openXmlUnknownElement7);

            barSerExtensionList5.Append(barSerExtension5);

            barChartSeries5.Append(index5);
            barChartSeries5.Append(order5);
            barChartSeries5.Append(seriesText5);
            barChartSeries5.Append(chartShapeProperties6);
            barChartSeries5.Append(invertIfNegative5);
            barChartSeries5.Append(categoryAxisData5);
            barChartSeries5.Append(values5);
            barChartSeries5.Append(barSerExtensionList5);

            C.DataLabels dataLabels1 = new C.DataLabels();
            C.ShowLegendKey showLegendKey1 = new C.ShowLegendKey() { Val = false };
            C.ShowValue showValue1 = new C.ShowValue() { Val = false };
            C.ShowCategoryName showCategoryName1 = new C.ShowCategoryName() { Val = false };
            C.ShowSeriesName showSeriesName1 = new C.ShowSeriesName() { Val = false };
            C.ShowPercent showPercent1 = new C.ShowPercent() { Val = false };
            C.ShowBubbleSize showBubbleSize1 = new C.ShowBubbleSize() { Val = false };

            dataLabels1.Append(showLegendKey1);
            dataLabels1.Append(showValue1);
            dataLabels1.Append(showCategoryName1);
            dataLabels1.Append(showSeriesName1);
            dataLabels1.Append(showPercent1);
            dataLabels1.Append(showBubbleSize1);
            C.GapWidth gapWidth1 = new C.GapWidth() { Val = (UInt16Value)89U };
            C.Overlap overlap1 = new C.Overlap() { Val = -22 };
            C.AxisId axisId1 = new C.AxisId() { Val = (UInt32Value)350558559U };
            C.AxisId axisId2 = new C.AxisId() { Val = (UInt32Value)350559519U };

            barChart1.Append(barDirection1);
            barChart1.Append(barGrouping1);
            barChart1.Append(varyColors1);
            barChart1.Append(barChartSeries1);
            barChart1.Append(barChartSeries2);
            barChart1.Append(barChartSeries3);
            barChart1.Append(barChartSeries4);
            barChart1.Append(barChartSeries5);
            barChart1.Append(dataLabels1);
            barChart1.Append(gapWidth1);
            barChart1.Append(overlap1);
            barChart1.Append(axisId1);
            barChart1.Append(axisId2);

            C.CategoryAxis categoryAxis1 = new C.CategoryAxis();
            C.AxisId axisId3 = new C.AxisId() { Val = (UInt32Value)350558559U };

            C.Scaling scaling1 = new C.Scaling();
            C.Orientation orientation1 = new C.Orientation() { Val = C.OrientationValues.MinMax };

            scaling1.Append(orientation1);
            C.Delete delete1 = new C.Delete() { Val = false };
            C.AxisPosition axisPosition1 = new C.AxisPosition() { Val = C.AxisPositionValues.Bottom };
            C.NumberingFormat numberingFormat1 = new C.NumberingFormat() { FormatCode = "General", SourceLinked = true };
            C.MajorTickMark majorTickMark1 = new C.MajorTickMark() { Val = C.TickMarkValues.Outside };
            C.MinorTickMark minorTickMark1 = new C.MinorTickMark() { Val = C.TickMarkValues.None };
            C.TickLabelPosition tickLabelPosition1 = new C.TickLabelPosition() { Val = C.TickLabelPositionValues.NextTo };

            C.ChartShapeProperties chartShapeProperties7 = new C.ChartShapeProperties();
            A.NoFill noFill9 = new A.NoFill();

            A.Outline outline7 = new A.Outline() { Width = 9525, CapType = A.LineCapValues.Flat, CompoundLineType = A.CompoundLineValues.Single, Alignment = A.PenAlignmentValues.Center };

            A.SolidFill solidFill8 = new A.SolidFill();

            A.SchemeColor schemeColor1 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };
            A.LuminanceModulation luminanceModulation1 = new A.LuminanceModulation() { Val = 15000 };
            A.LuminanceOffset luminanceOffset1 = new A.LuminanceOffset() { Val = 85000 };

            schemeColor1.Append(luminanceModulation1);
            schemeColor1.Append(luminanceOffset1);

            solidFill8.Append(schemeColor1);
            A.Round round1 = new A.Round();

            outline7.Append(solidFill8);
            outline7.Append(round1);
            A.EffectList effectList7 = new A.EffectList();

            chartShapeProperties7.Append(noFill9);
            chartShapeProperties7.Append(outline7);
            chartShapeProperties7.Append(effectList7);

            C.TextProperties textProperties2 = new C.TextProperties();
            A.BodyProperties bodyProperties3 = new A.BodyProperties() { Rotation = -60000000, UseParagraphSpacing = true, VerticalOverflow = A.TextVerticalOverflowValues.Ellipsis, Vertical = A.TextVerticalValues.Horizontal, Wrap = A.TextWrappingValues.Square, Anchor = A.TextAnchoringTypeValues.Center, AnchorCenter = true };
            A.ListStyle listStyle3 = new A.ListStyle();

            A.Paragraph paragraph3 = new A.Paragraph();

            A.ParagraphProperties paragraphProperties3 = new A.ParagraphProperties();

            A.DefaultRunProperties defaultRunProperties3 = new A.DefaultRunProperties() { FontSize = 900, Bold = false, Italic = false, Underline = A.TextUnderlineValues.None, Strike = A.TextStrikeValues.NoStrike, Kerning = 1200, Baseline = 0 };

            A.SolidFill solidFill9 = new A.SolidFill();
            A.SchemeColor schemeColor2 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };

            solidFill9.Append(schemeColor2);
            A.LatinFont latinFont4 = new A.LatinFont() { Typeface = "+mn-lt" };
            A.EastAsianFont eastAsianFont4 = new A.EastAsianFont() { Typeface = "+mn-ea" };
            A.ComplexScriptFont complexScriptFont4 = new A.ComplexScriptFont() { Typeface = "+mn-cs" };

            defaultRunProperties3.Append(solidFill9);
            defaultRunProperties3.Append(latinFont4);
            defaultRunProperties3.Append(eastAsianFont4);
            defaultRunProperties3.Append(complexScriptFont4);

            paragraphProperties3.Append(defaultRunProperties3);
            A.EndParagraphRunProperties endParagraphRunProperties2 = new A.EndParagraphRunProperties() { Language = "en-US" };

            paragraph3.Append(paragraphProperties3);
            paragraph3.Append(endParagraphRunProperties2);

            textProperties2.Append(bodyProperties3);
            textProperties2.Append(listStyle3);
            textProperties2.Append(paragraph3);
            C.CrossingAxis crossingAxis1 = new C.CrossingAxis() { Val = (UInt32Value)350559519U };
            C.Crosses crosses1 = new C.Crosses() { Val = C.CrossesValues.AutoZero };
            C.AutoLabeled autoLabeled1 = new C.AutoLabeled() { Val = true };
            C.LabelAlignment labelAlignment1 = new C.LabelAlignment() { Val = C.LabelAlignmentValues.Center };
            C.LabelOffset labelOffset1 = new C.LabelOffset() { Val = (UInt16Value)100U };
            C.NoMultiLevelLabels noMultiLevelLabels1 = new C.NoMultiLevelLabels() { Val = false };

            categoryAxis1.Append(axisId3);
            categoryAxis1.Append(scaling1);
            categoryAxis1.Append(delete1);
            categoryAxis1.Append(axisPosition1);
            categoryAxis1.Append(numberingFormat1);
            categoryAxis1.Append(majorTickMark1);
            categoryAxis1.Append(minorTickMark1);
            categoryAxis1.Append(tickLabelPosition1);
            categoryAxis1.Append(chartShapeProperties7);
            categoryAxis1.Append(textProperties2);
            categoryAxis1.Append(crossingAxis1);
            categoryAxis1.Append(crosses1);
            categoryAxis1.Append(autoLabeled1);
            categoryAxis1.Append(labelAlignment1);
            categoryAxis1.Append(labelOffset1);
            categoryAxis1.Append(noMultiLevelLabels1);

            C.ValueAxis valueAxis1 = new C.ValueAxis();
            C.AxisId axisId4 = new C.AxisId() { Val = (UInt32Value)350559519U };

            C.Scaling scaling2 = new C.Scaling();
            C.Orientation orientation2 = new C.Orientation() { Val = C.OrientationValues.MinMax };
            C.MaxAxisValue maxAxisValue1 = new C.MaxAxisValue() { Val = 1D };

            scaling2.Append(orientation2);
            scaling2.Append(maxAxisValue1);
            C.Delete delete2 = new C.Delete() { Val = false };
            C.AxisPosition axisPosition2 = new C.AxisPosition() { Val = C.AxisPositionValues.Left };

            C.MajorGridlines majorGridlines1 = new C.MajorGridlines();

            C.ChartShapeProperties chartShapeProperties8 = new C.ChartShapeProperties();

            A.Outline outline8 = new A.Outline() { Width = 9525, CapType = A.LineCapValues.Flat, CompoundLineType = A.CompoundLineValues.Single, Alignment = A.PenAlignmentValues.Center };

            A.SolidFill solidFill10 = new A.SolidFill();

            A.SchemeColor schemeColor3 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };
            A.LuminanceModulation luminanceModulation2 = new A.LuminanceModulation() { Val = 15000 };
            A.LuminanceOffset luminanceOffset2 = new A.LuminanceOffset() { Val = 85000 };

            schemeColor3.Append(luminanceModulation2);
            schemeColor3.Append(luminanceOffset2);

            solidFill10.Append(schemeColor3);
            A.Round round2 = new A.Round();

            outline8.Append(solidFill10);
            outline8.Append(round2);
            A.EffectList effectList8 = new A.EffectList();

            chartShapeProperties8.Append(outline8);
            chartShapeProperties8.Append(effectList8);

            majorGridlines1.Append(chartShapeProperties8);

            C.Title title2 = new C.Title();

            C.ChartText chartText2 = new C.ChartText();

            C.RichText richText2 = new C.RichText();
            A.BodyProperties bodyProperties4 = new A.BodyProperties() { Rotation = -5400000, UseParagraphSpacing = true, VerticalOverflow = A.TextVerticalOverflowValues.Ellipsis, Vertical = A.TextVerticalValues.Horizontal, Wrap = A.TextWrappingValues.Square, Anchor = A.TextAnchoringTypeValues.Center, AnchorCenter = true };
            A.ListStyle listStyle4 = new A.ListStyle();

            A.Paragraph paragraph4 = new A.Paragraph();

            A.ParagraphProperties paragraphProperties4 = new A.ParagraphProperties();

            A.DefaultRunProperties defaultRunProperties4 = new A.DefaultRunProperties() { FontSize = 1600, Bold = true, Italic = false, Underline = A.TextUnderlineValues.None, Strike = A.TextStrikeValues.NoStrike, Kerning = 1200, Baseline = 0 };

            A.SolidFill solidFill11 = new A.SolidFill();
            A.RgbColorModelHex rgbColorModelHex8 = new A.RgbColorModelHex() { Val = "2559BF" };

            solidFill11.Append(rgbColorModelHex8);
            A.LatinFont latinFont5 = new A.LatinFont() { Typeface = "Open Sans", PitchFamily = 2, CharacterSet = 0 };
            A.EastAsianFont eastAsianFont5 = new A.EastAsianFont() { Typeface = "Open Sans", PitchFamily = 2, CharacterSet = 0 };
            A.ComplexScriptFont complexScriptFont5 = new A.ComplexScriptFont() { Typeface = "Open Sans", PitchFamily = 2, CharacterSet = 0 };

            defaultRunProperties4.Append(solidFill11);
            defaultRunProperties4.Append(latinFont5);
            defaultRunProperties4.Append(eastAsianFont5);
            defaultRunProperties4.Append(complexScriptFont5);

            paragraphProperties4.Append(defaultRunProperties4);

            A.Run run2 = new A.Run();

            A.RunProperties runProperties2 = new A.RunProperties() { Language = "en-US", FontSize = 1600 };

            A.SolidFill solidFill12 = new A.SolidFill();
            A.RgbColorModelHex rgbColorModelHex9 = new A.RgbColorModelHex() { Val = "193A73" };

            solidFill12.Append(rgbColorModelHex9);
            A.LatinFont latinFont6 = new A.LatinFont() { Typeface = "Open Sans", PitchFamily = 2, CharacterSet = 0 };
            A.EastAsianFont eastAsianFont6 = new A.EastAsianFont() { Typeface = "Open Sans", PitchFamily = 2, CharacterSet = 0 };
            A.ComplexScriptFont complexScriptFont6 = new A.ComplexScriptFont() { Typeface = "Open Sans", PitchFamily = 2, CharacterSet = 0 };

            runProperties2.Append(solidFill12);
            runProperties2.Append(latinFont6);
            runProperties2.Append(eastAsianFont6);
            runProperties2.Append(complexScriptFont6);
            A.Text text2 = new A.Text();
            text2.Text = "% CUMPLIMIENTO";

            run2.Append(runProperties2);
            run2.Append(text2);

            paragraph4.Append(paragraphProperties4);
            paragraph4.Append(run2);

            richText2.Append(bodyProperties4);
            richText2.Append(listStyle4);
            richText2.Append(paragraph4);

            chartText2.Append(richText2);

            C.Layout layout3 = new C.Layout();

            C.ManualLayout manualLayout3 = new C.ManualLayout();
            C.LeftMode leftMode3 = new C.LeftMode() { Val = C.LayoutModeValues.Edge };
            C.TopMode topMode3 = new C.TopMode() { Val = C.LayoutModeValues.Edge };
            C.Left left3 = new C.Left() { Val = 2.9333333025371833E-2D };
            C.Top top3 = new C.Top() { Val = 0.38378652668416446D };

            manualLayout3.Append(leftMode3);
            manualLayout3.Append(topMode3);
            manualLayout3.Append(left3);
            manualLayout3.Append(top3);

            layout3.Append(manualLayout3);
            C.Overlay overlay2 = new C.Overlay() { Val = false };

            C.ChartShapeProperties chartShapeProperties9 = new C.ChartShapeProperties();
            A.NoFill noFill10 = new A.NoFill();

            A.Outline outline9 = new A.Outline();
            A.NoFill noFill11 = new A.NoFill();

            outline9.Append(noFill11);
            A.EffectList effectList9 = new A.EffectList();

            chartShapeProperties9.Append(noFill10);
            chartShapeProperties9.Append(outline9);
            chartShapeProperties9.Append(effectList9);

            C.TextProperties textProperties3 = new C.TextProperties();
            A.BodyProperties bodyProperties5 = new A.BodyProperties() { Rotation = -5400000, UseParagraphSpacing = true, VerticalOverflow = A.TextVerticalOverflowValues.Ellipsis, Vertical = A.TextVerticalValues.Horizontal, Wrap = A.TextWrappingValues.Square, Anchor = A.TextAnchoringTypeValues.Center, AnchorCenter = true };
            A.ListStyle listStyle5 = new A.ListStyle();

            A.Paragraph paragraph5 = new A.Paragraph();

            A.ParagraphProperties paragraphProperties5 = new A.ParagraphProperties();

            A.DefaultRunProperties defaultRunProperties5 = new A.DefaultRunProperties() { FontSize = 1600, Bold = true, Italic = false, Underline = A.TextUnderlineValues.None, Strike = A.TextStrikeValues.NoStrike, Kerning = 1200, Baseline = 0 };

            A.SolidFill solidFill13 = new A.SolidFill();
            A.RgbColorModelHex rgbColorModelHex10 = new A.RgbColorModelHex() { Val = "2559BF" };

            solidFill13.Append(rgbColorModelHex10);
            A.LatinFont latinFont7 = new A.LatinFont() { Typeface = "Open Sans", PitchFamily = 2, CharacterSet = 0 };
            A.EastAsianFont eastAsianFont7 = new A.EastAsianFont() { Typeface = "Open Sans", PitchFamily = 2, CharacterSet = 0 };
            A.ComplexScriptFont complexScriptFont7 = new A.ComplexScriptFont() { Typeface = "Open Sans", PitchFamily = 2, CharacterSet = 0 };

            defaultRunProperties5.Append(solidFill13);
            defaultRunProperties5.Append(latinFont7);
            defaultRunProperties5.Append(eastAsianFont7);
            defaultRunProperties5.Append(complexScriptFont7);

            paragraphProperties5.Append(defaultRunProperties5);
            A.EndParagraphRunProperties endParagraphRunProperties3 = new A.EndParagraphRunProperties() { Language = "en-US" };

            paragraph5.Append(paragraphProperties5);
            paragraph5.Append(endParagraphRunProperties3);

            textProperties3.Append(bodyProperties5);
            textProperties3.Append(listStyle5);
            textProperties3.Append(paragraph5);

            title2.Append(chartText2);
            title2.Append(layout3);
            title2.Append(overlay2);
            title2.Append(chartShapeProperties9);
            title2.Append(textProperties3);
            C.NumberingFormat numberingFormat2 = new C.NumberingFormat() { FormatCode = "0%", SourceLinked = true };
            C.MajorTickMark majorTickMark2 = new C.MajorTickMark() { Val = C.TickMarkValues.None };
            C.MinorTickMark minorTickMark2 = new C.MinorTickMark() { Val = C.TickMarkValues.None };
            C.TickLabelPosition tickLabelPosition2 = new C.TickLabelPosition() { Val = C.TickLabelPositionValues.NextTo };

            C.ChartShapeProperties chartShapeProperties10 = new C.ChartShapeProperties();
            A.NoFill noFill12 = new A.NoFill();

            A.Outline outline10 = new A.Outline();

            A.SolidFill solidFill14 = new A.SolidFill();
            A.SchemeColor schemeColor4 = new A.SchemeColor() { Val = A.SchemeColorValues.Accent1 };

            solidFill14.Append(schemeColor4);

            outline10.Append(solidFill14);
            A.EffectList effectList10 = new A.EffectList();

            chartShapeProperties10.Append(noFill12);
            chartShapeProperties10.Append(outline10);
            chartShapeProperties10.Append(effectList10);

            C.TextProperties textProperties4 = new C.TextProperties();
            A.BodyProperties bodyProperties6 = new A.BodyProperties() { Rotation = -60000000, UseParagraphSpacing = true, VerticalOverflow = A.TextVerticalOverflowValues.Ellipsis, Vertical = A.TextVerticalValues.Horizontal, Wrap = A.TextWrappingValues.Square, Anchor = A.TextAnchoringTypeValues.Center, AnchorCenter = true };
            A.ListStyle listStyle6 = new A.ListStyle();

            A.Paragraph paragraph6 = new A.Paragraph();

            A.ParagraphProperties paragraphProperties6 = new A.ParagraphProperties();

            A.DefaultRunProperties defaultRunProperties6 = new A.DefaultRunProperties() { FontSize = 900, Bold = false, Italic = false, Underline = A.TextUnderlineValues.None, Strike = A.TextStrikeValues.NoStrike, Kerning = 1200, Baseline = 0 };

            A.SolidFill solidFill15 = new A.SolidFill();
            A.SchemeColor schemeColor5 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };

            solidFill15.Append(schemeColor5);
            A.LatinFont latinFont8 = new A.LatinFont() { Typeface = "+mn-lt" };
            A.EastAsianFont eastAsianFont8 = new A.EastAsianFont() { Typeface = "+mn-ea" };
            A.ComplexScriptFont complexScriptFont8 = new A.ComplexScriptFont() { Typeface = "+mn-cs" };

            defaultRunProperties6.Append(solidFill15);
            defaultRunProperties6.Append(latinFont8);
            defaultRunProperties6.Append(eastAsianFont8);
            defaultRunProperties6.Append(complexScriptFont8);

            paragraphProperties6.Append(defaultRunProperties6);
            A.EndParagraphRunProperties endParagraphRunProperties4 = new A.EndParagraphRunProperties() { Language = "en-US" };

            paragraph6.Append(paragraphProperties6);
            paragraph6.Append(endParagraphRunProperties4);

            textProperties4.Append(bodyProperties6);
            textProperties4.Append(listStyle6);
            textProperties4.Append(paragraph6);
            C.CrossingAxis crossingAxis2 = new C.CrossingAxis() { Val = (UInt32Value)350558559U };
            C.Crosses crosses2 = new C.Crosses() { Val = C.CrossesValues.AutoZero };
            C.CrossBetween crossBetween1 = new C.CrossBetween() { Val = C.CrossBetweenValues.Between };

            valueAxis1.Append(axisId4);
            valueAxis1.Append(scaling2);
            valueAxis1.Append(delete2);
            valueAxis1.Append(axisPosition2);
            valueAxis1.Append(majorGridlines1);
            valueAxis1.Append(title2);
            valueAxis1.Append(numberingFormat2);
            valueAxis1.Append(majorTickMark2);
            valueAxis1.Append(minorTickMark2);
            valueAxis1.Append(tickLabelPosition2);
            valueAxis1.Append(chartShapeProperties10);
            valueAxis1.Append(textProperties4);
            valueAxis1.Append(crossingAxis2);
            valueAxis1.Append(crosses2);
            valueAxis1.Append(crossBetween1);

            C.DataTable dataTable1 = new C.DataTable();
            C.ShowHorizontalBorder showHorizontalBorder1 = new C.ShowHorizontalBorder() { Val = true };
            C.ShowVerticalBorder showVerticalBorder1 = new C.ShowVerticalBorder() { Val = true };
            C.ShowOutlineBorder showOutlineBorder1 = new C.ShowOutlineBorder() { Val = true };
            C.ShowKeys showKeys1 = new C.ShowKeys() { Val = true };

            C.ChartShapeProperties chartShapeProperties11 = new C.ChartShapeProperties();
            A.NoFill noFill13 = new A.NoFill();

            A.Outline outline11 = new A.Outline() { Width = 9525 };

            A.SolidFill solidFill16 = new A.SolidFill();

            A.SchemeColor schemeColor6 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };
            A.LuminanceModulation luminanceModulation3 = new A.LuminanceModulation() { Val = 15000 };
            A.LuminanceOffset luminanceOffset3 = new A.LuminanceOffset() { Val = 85000 };

            schemeColor6.Append(luminanceModulation3);
            schemeColor6.Append(luminanceOffset3);

            solidFill16.Append(schemeColor6);

            outline11.Append(solidFill16);
            A.EffectList effectList11 = new A.EffectList();

            chartShapeProperties11.Append(noFill13);
            chartShapeProperties11.Append(outline11);
            chartShapeProperties11.Append(effectList11);

            C.TextProperties textProperties5 = new C.TextProperties();
            A.BodyProperties bodyProperties7 = new A.BodyProperties() { Rotation = 0, UseParagraphSpacing = true, VerticalOverflow = A.TextVerticalOverflowValues.Ellipsis, Vertical = A.TextVerticalValues.Horizontal, Wrap = A.TextWrappingValues.Square, Anchor = A.TextAnchoringTypeValues.Center, AnchorCenter = true };
            A.ListStyle listStyle7 = new A.ListStyle();

            A.Paragraph paragraph7 = new A.Paragraph();

            A.ParagraphProperties paragraphProperties7 = new A.ParagraphProperties() { RightToLeft = false };

            A.DefaultRunProperties defaultRunProperties7 = new A.DefaultRunProperties() { FontSize = 900, Bold = false, Italic = false, Underline = A.TextUnderlineValues.None, Strike = A.TextStrikeValues.NoStrike, Kerning = 1200, Baseline = 0 };

            A.SolidFill solidFill17 = new A.SolidFill();
            A.SchemeColor schemeColor7 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };

            solidFill17.Append(schemeColor7);
            A.LatinFont latinFont9 = new A.LatinFont() { Typeface = "Open Sans", PitchFamily = 2, CharacterSet = 0 };
            A.EastAsianFont eastAsianFont9 = new A.EastAsianFont() { Typeface = "Open Sans", PitchFamily = 2, CharacterSet = 0 };
            A.ComplexScriptFont complexScriptFont9 = new A.ComplexScriptFont() { Typeface = "Open Sans", PitchFamily = 2, CharacterSet = 0 };

            defaultRunProperties7.Append(solidFill17);
            defaultRunProperties7.Append(latinFont9);
            defaultRunProperties7.Append(eastAsianFont9);
            defaultRunProperties7.Append(complexScriptFont9);

            paragraphProperties7.Append(defaultRunProperties7);
            A.EndParagraphRunProperties endParagraphRunProperties5 = new A.EndParagraphRunProperties() { Language = "en-US" };

            paragraph7.Append(paragraphProperties7);
            paragraph7.Append(endParagraphRunProperties5);

            textProperties5.Append(bodyProperties7);
            textProperties5.Append(listStyle7);
            textProperties5.Append(paragraph7);

            dataTable1.Append(showHorizontalBorder1);
            dataTable1.Append(showVerticalBorder1);
            dataTable1.Append(showOutlineBorder1);
            dataTable1.Append(showKeys1);
            dataTable1.Append(chartShapeProperties11);
            dataTable1.Append(textProperties5);

            C.ShapeProperties shapeProperties1 = new C.ShapeProperties();
            A.NoFill noFill14 = new A.NoFill();

            A.Outline outline12 = new A.Outline();
            A.NoFill noFill15 = new A.NoFill();

            outline12.Append(noFill15);
            A.EffectList effectList12 = new A.EffectList();

            shapeProperties1.Append(noFill14);
            shapeProperties1.Append(outline12);
            shapeProperties1.Append(effectList12);

            plotArea1.Append(layout2);
            plotArea1.Append(barChart1);
            plotArea1.Append(categoryAxis1);
            plotArea1.Append(valueAxis1);
            plotArea1.Append(dataTable1);
            plotArea1.Append(shapeProperties1);
            C.PlotVisibleOnly plotVisibleOnly1 = new C.PlotVisibleOnly() { Val = true };
            C.DisplayBlanksAs displayBlanksAs1 = new C.DisplayBlanksAs() { Val = C.DisplayBlanksAsValues.Gap };
            C.ShowDataLabelsOverMaximum showDataLabelsOverMaximum1 = new C.ShowDataLabelsOverMaximum() { Val = true };

            //C.ExtensionList extensionList1 = new C.ExtensionList();
            //extensionList1.AddNamespaceDeclaration("mc", "http://schemas.openxmlformats.org/markup-compatibility/2006");
            //extensionList1.AddNamespaceDeclaration("c14", "http://schemas.microsoft.com/office/drawing/2007/8/2/chart");
            //extensionList1.AddNamespaceDeclaration("c16", "http://schemas.microsoft.com/office/drawing/2014/chart");
            //extensionList1.AddNamespaceDeclaration("c16r3", "http://schemas.microsoft.com/office/drawing/2017/03/chart");

            chart1.Append(title1);
            chart1.Append(autoTitleDeleted1);
            chart1.Append(plotArea1);
            chart1.Append(plotVisibleOnly1);
            chart1.Append(displayBlanksAs1);
            chart1.Append(showDataLabelsOverMaximum1);
            //chart1.Append(extensionList1);

            C.ShapeProperties shapeProperties2 = new C.ShapeProperties();

            A.SolidFill solidFill18 = new A.SolidFill();
            A.SchemeColor schemeColor8 = new A.SchemeColor() { Val = A.SchemeColorValues.Background1 };

            solidFill18.Append(schemeColor8);

            A.Outline outline13 = new A.Outline() { Width = 9525, CapType = A.LineCapValues.Flat, CompoundLineType = A.CompoundLineValues.Single, Alignment = A.PenAlignmentValues.Center };

            A.SolidFill solidFill19 = new A.SolidFill();

            A.SchemeColor schemeColor9 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };
            A.LuminanceModulation luminanceModulation4 = new A.LuminanceModulation() { Val = 15000 };
            A.LuminanceOffset luminanceOffset4 = new A.LuminanceOffset() { Val = 85000 };

            schemeColor9.Append(luminanceModulation4);
            schemeColor9.Append(luminanceOffset4);

            solidFill19.Append(schemeColor9);
            A.Round round3 = new A.Round();

            outline13.Append(solidFill19);
            outline13.Append(round3);
            A.EffectList effectList13 = new A.EffectList();

            shapeProperties2.Append(solidFill18);
            shapeProperties2.Append(outline13);
            shapeProperties2.Append(effectList13);

            C.TextProperties textProperties6 = new C.TextProperties();
            A.BodyProperties bodyProperties8 = new A.BodyProperties();
            A.ListStyle listStyle8 = new A.ListStyle();

            A.Paragraph paragraph8 = new A.Paragraph();

            A.ParagraphProperties paragraphProperties8 = new A.ParagraphProperties();
            A.DefaultRunProperties defaultRunProperties8 = new A.DefaultRunProperties();

            paragraphProperties8.Append(defaultRunProperties8);
            A.EndParagraphRunProperties endParagraphRunProperties6 = new A.EndParagraphRunProperties() { Language = "en-US" };

            paragraph8.Append(paragraphProperties8);
            paragraph8.Append(endParagraphRunProperties6);

            textProperties6.Append(bodyProperties8);
            textProperties6.Append(listStyle8);
            textProperties6.Append(paragraph8);
            C.UserShapesReference userShapesReference1 = new C.UserShapesReference() { Id = "rId3" };

            chartSpace1.Append(date19041);
            chartSpace1.Append(editingLanguage1);
            chartSpace1.Append(roundedCorners1);
            chartSpace1.Append(alternateContent2);
            chartSpace1.Append(chart1);
            chartSpace1.Append(shapeProperties2);
            chartSpace1.Append(textProperties6);
            chartSpace1.Append(userShapesReference1);

            chartPart1.ChartSpace = chartSpace1;
        }

        public void GenerateChartsheetPart1Content(ChartsheetPart chartsheetPart1)
        {
            Chartsheet chartsheet1 = new Chartsheet() { MCAttributes = new MarkupCompatibilityAttributes() { Ignorable = "xr xr3" } };
            chartsheet1.AddNamespaceDeclaration("r", "http://schemas.openxmlformats.org/officeDocument/2006/relationships");
            chartsheet1.AddNamespaceDeclaration("mc", "http://schemas.openxmlformats.org/markup-compatibility/2006");
            chartsheet1.AddNamespaceDeclaration("xr", "http://schemas.microsoft.com/office/spreadsheetml/2014/revision");
            chartsheet1.AddNamespaceDeclaration("xr3", "http://schemas.microsoft.com/office/spreadsheetml/2016/revision3");
            chartsheet1.SetAttribute(new OpenXmlAttribute("xr", "uid", "http://schemas.microsoft.com/office/spreadsheetml/2014/revision", "{89DEB966-E92C-4B21-88E8-97AB7B935B70}"));
            ChartSheetProperties chartSheetProperties1 = new ChartSheetProperties();

            ChartSheetViews chartSheetViews1 = new ChartSheetViews();
            ChartSheetView chartSheetView1 = new ChartSheetView() { TabSelected = true, WorkbookViewId = (UInt32Value)0U };

            chartSheetViews1.Append(chartSheetView1);
            PageMargins pageMargins3 = new PageMargins() { Left = 0.7D, Right = 0.7D, Top = 0.75D, Bottom = 0.75D, Header = 0.3D, Footer = 0.3D };
            Drawing drawing1 = new Drawing() { Id = "rId1" };

            chartsheet1.Append(chartSheetProperties1);
            chartsheet1.Append(chartSheetViews1);
            chartsheet1.Append(pageMargins3);
            chartsheet1.Append(drawing1);

            chartsheetPart1.Chartsheet = chartsheet1;
        }

        public void GenerateChartStylePart1Content(ChartStylePart chartStylePart1)
        {
            Cs.ChartStyle chartStyle1 = new Cs.ChartStyle() { Id = (UInt32Value)290U };
            chartStyle1.AddNamespaceDeclaration("cs", "http://schemas.microsoft.com/office/drawing/2012/chartStyle");
            chartStyle1.AddNamespaceDeclaration("a", "http://schemas.openxmlformats.org/drawingml/2006/main");

            Cs.AxisTitle axisTitle1 = new Cs.AxisTitle();
            Cs.LineReference lineReference1 = new Cs.LineReference() { Index = (UInt32Value)0U };
            Cs.FillReference fillReference1 = new Cs.FillReference() { Index = (UInt32Value)0U };
            Cs.EffectReference effectReference1 = new Cs.EffectReference() { Index = (UInt32Value)0U };

            Cs.FontReference fontReference1 = new Cs.FontReference() { Index = A.FontCollectionIndexValues.Minor };
            A.SchemeColor schemeColor13 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };

            fontReference1.Append(schemeColor13);
            Cs.TextCharacterPropertiesType textCharacterPropertiesType1 = new Cs.TextCharacterPropertiesType() { FontSize = 900, Bold = true, Kerning = 1200 };

            axisTitle1.Append(lineReference1);
            axisTitle1.Append(fillReference1);
            axisTitle1.Append(effectReference1);
            axisTitle1.Append(fontReference1);
            axisTitle1.Append(textCharacterPropertiesType1);

            Cs.CategoryAxis categoryAxis2 = new Cs.CategoryAxis();
            Cs.LineReference lineReference2 = new Cs.LineReference() { Index = (UInt32Value)0U };
            Cs.FillReference fillReference2 = new Cs.FillReference() { Index = (UInt32Value)0U };
            Cs.EffectReference effectReference2 = new Cs.EffectReference() { Index = (UInt32Value)0U };

            Cs.FontReference fontReference2 = new Cs.FontReference() { Index = A.FontCollectionIndexValues.Minor };
            A.SchemeColor schemeColor14 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };

            fontReference2.Append(schemeColor14);

            Cs.ShapeProperties shapeProperties6 = new Cs.ShapeProperties();

            A.Outline outline14 = new A.Outline() { Width = 9525, CapType = A.LineCapValues.Flat, CompoundLineType = A.CompoundLineValues.Single, Alignment = A.PenAlignmentValues.Center };

            A.SolidFill solidFill23 = new A.SolidFill();

            A.SchemeColor schemeColor15 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };
            A.LuminanceModulation luminanceModulation13 = new A.LuminanceModulation() { Val = 15000 };
            A.LuminanceOffset luminanceOffset9 = new A.LuminanceOffset() { Val = 85000 };

            schemeColor15.Append(luminanceModulation13);
            schemeColor15.Append(luminanceOffset9);

            solidFill23.Append(schemeColor15);
            A.Round round4 = new A.Round();

            outline14.Append(solidFill23);
            outline14.Append(round4);

            shapeProperties6.Append(outline14);
            Cs.TextCharacterPropertiesType textCharacterPropertiesType2 = new Cs.TextCharacterPropertiesType() { FontSize = 900, Kerning = 1200 };

            categoryAxis2.Append(lineReference2);
            categoryAxis2.Append(fillReference2);
            categoryAxis2.Append(effectReference2);
            categoryAxis2.Append(fontReference2);
            categoryAxis2.Append(shapeProperties6);
            categoryAxis2.Append(textCharacterPropertiesType2);

            Cs.ChartArea chartArea1 = new Cs.ChartArea() { Modifiers = new ListValue<StringValue>() { InnerText = "allowNoFillOverride allowNoLineOverride" } };
            Cs.LineReference lineReference3 = new Cs.LineReference() { Index = (UInt32Value)0U };
            Cs.FillReference fillReference3 = new Cs.FillReference() { Index = (UInt32Value)0U };
            Cs.EffectReference effectReference3 = new Cs.EffectReference() { Index = (UInt32Value)0U };

            Cs.FontReference fontReference3 = new Cs.FontReference() { Index = A.FontCollectionIndexValues.Minor };
            A.SchemeColor schemeColor16 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };

            fontReference3.Append(schemeColor16);

            Cs.ShapeProperties shapeProperties7 = new Cs.ShapeProperties();

            A.SolidFill solidFill24 = new A.SolidFill();
            A.SchemeColor schemeColor17 = new A.SchemeColor() { Val = A.SchemeColorValues.Background1 };

            solidFill24.Append(schemeColor17);

            A.Outline outline15 = new A.Outline() { Width = 9525, CapType = A.LineCapValues.Flat, CompoundLineType = A.CompoundLineValues.Single, Alignment = A.PenAlignmentValues.Center };

            A.SolidFill solidFill25 = new A.SolidFill();

            A.SchemeColor schemeColor18 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };
            A.LuminanceModulation luminanceModulation14 = new A.LuminanceModulation() { Val = 15000 };
            A.LuminanceOffset luminanceOffset10 = new A.LuminanceOffset() { Val = 85000 };

            schemeColor18.Append(luminanceModulation14);
            schemeColor18.Append(luminanceOffset10);

            solidFill25.Append(schemeColor18);
            A.Round round5 = new A.Round();

            outline15.Append(solidFill25);
            outline15.Append(round5);

            shapeProperties7.Append(solidFill24);
            shapeProperties7.Append(outline15);
            Cs.TextCharacterPropertiesType textCharacterPropertiesType3 = new Cs.TextCharacterPropertiesType() { FontSize = 900, Kerning = 1200 };

            chartArea1.Append(lineReference3);
            chartArea1.Append(fillReference3);
            chartArea1.Append(effectReference3);
            chartArea1.Append(fontReference3);
            chartArea1.Append(shapeProperties7);
            chartArea1.Append(textCharacterPropertiesType3);

            Cs.DataLabel dataLabel1 = new Cs.DataLabel();
            Cs.LineReference lineReference4 = new Cs.LineReference() { Index = (UInt32Value)0U };
            Cs.FillReference fillReference4 = new Cs.FillReference() { Index = (UInt32Value)0U };
            Cs.EffectReference effectReference4 = new Cs.EffectReference() { Index = (UInt32Value)0U };

            Cs.FontReference fontReference4 = new Cs.FontReference() { Index = A.FontCollectionIndexValues.Minor };
            A.SchemeColor schemeColor19 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };

            fontReference4.Append(schemeColor19);
            Cs.TextCharacterPropertiesType textCharacterPropertiesType4 = new Cs.TextCharacterPropertiesType() { FontSize = 900, Kerning = 1200 };

            dataLabel1.Append(lineReference4);
            dataLabel1.Append(fillReference4);
            dataLabel1.Append(effectReference4);
            dataLabel1.Append(fontReference4);
            dataLabel1.Append(textCharacterPropertiesType4);

            Cs.DataLabelCallout dataLabelCallout1 = new Cs.DataLabelCallout();
            Cs.LineReference lineReference5 = new Cs.LineReference() { Index = (UInt32Value)0U };
            Cs.FillReference fillReference5 = new Cs.FillReference() { Index = (UInt32Value)0U };
            Cs.EffectReference effectReference5 = new Cs.EffectReference() { Index = (UInt32Value)0U };

            Cs.FontReference fontReference5 = new Cs.FontReference() { Index = A.FontCollectionIndexValues.Minor };

            A.SchemeColor schemeColor20 = new A.SchemeColor() { Val = A.SchemeColorValues.Dark2 };
            A.LuminanceModulation luminanceModulation15 = new A.LuminanceModulation() { Val = 75000 };

            schemeColor20.Append(luminanceModulation15);

            fontReference5.Append(schemeColor20);

            Cs.ShapeProperties shapeProperties8 = new Cs.ShapeProperties();

            A.SolidFill solidFill26 = new A.SolidFill();
            A.SchemeColor schemeColor21 = new A.SchemeColor() { Val = A.SchemeColorValues.Light1 };

            solidFill26.Append(schemeColor21);

            A.Outline outline16 = new A.Outline();

            A.SolidFill solidFill27 = new A.SolidFill();

            A.SchemeColor schemeColor22 = new A.SchemeColor() { Val = A.SchemeColorValues.Dark1 };
            A.LuminanceModulation luminanceModulation16 = new A.LuminanceModulation() { Val = 25000 };
            A.LuminanceOffset luminanceOffset11 = new A.LuminanceOffset() { Val = 75000 };

            schemeColor22.Append(luminanceModulation16);
            schemeColor22.Append(luminanceOffset11);

            solidFill27.Append(schemeColor22);

            outline16.Append(solidFill27);

            shapeProperties8.Append(solidFill26);
            shapeProperties8.Append(outline16);
            Cs.TextCharacterPropertiesType textCharacterPropertiesType5 = new Cs.TextCharacterPropertiesType() { FontSize = 900, Kerning = 1200 };

            Cs.TextBodyProperties textBodyProperties1 = new Cs.TextBodyProperties() { Rotation = 0, UseParagraphSpacing = true, VerticalOverflow = A.TextVerticalOverflowValues.Clip, HorizontalOverflow = A.TextHorizontalOverflowValues.Clip, Vertical = A.TextVerticalValues.Horizontal, Wrap = A.TextWrappingValues.Square, LeftInset = 36576, TopInset = 18288, RightInset = 36576, BottomInset = 18288, Anchor = A.TextAnchoringTypeValues.Center, AnchorCenter = true };
            A.ShapeAutoFit shapeAutoFit1 = new A.ShapeAutoFit();

            textBodyProperties1.Append(shapeAutoFit1);

            dataLabelCallout1.Append(lineReference5);
            dataLabelCallout1.Append(fillReference5);
            dataLabelCallout1.Append(effectReference5);
            dataLabelCallout1.Append(fontReference5);
            dataLabelCallout1.Append(shapeProperties8);
            dataLabelCallout1.Append(textCharacterPropertiesType5);
            dataLabelCallout1.Append(textBodyProperties1);

            Cs.DataPoint dataPoint1 = new Cs.DataPoint();
            Cs.LineReference lineReference6 = new Cs.LineReference() { Index = (UInt32Value)0U };

            Cs.FillReference fillReference6 = new Cs.FillReference() { Index = (UInt32Value)3U };
            Cs.StyleColor styleColor1 = new Cs.StyleColor() { Val = "auto" };

            fillReference6.Append(styleColor1);
            Cs.EffectReference effectReference6 = new Cs.EffectReference() { Index = (UInt32Value)2U };

            Cs.FontReference fontReference6 = new Cs.FontReference() { Index = A.FontCollectionIndexValues.Minor };
            A.SchemeColor schemeColor23 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };

            fontReference6.Append(schemeColor23);

            dataPoint1.Append(lineReference6);
            dataPoint1.Append(fillReference6);
            dataPoint1.Append(effectReference6);
            dataPoint1.Append(fontReference6);

            Cs.DataPoint3D dataPoint3D1 = new Cs.DataPoint3D();
            Cs.LineReference lineReference7 = new Cs.LineReference() { Index = (UInt32Value)0U };

            Cs.FillReference fillReference7 = new Cs.FillReference() { Index = (UInt32Value)3U };
            Cs.StyleColor styleColor2 = new Cs.StyleColor() { Val = "auto" };

            fillReference7.Append(styleColor2);
            Cs.EffectReference effectReference7 = new Cs.EffectReference() { Index = (UInt32Value)2U };

            Cs.FontReference fontReference7 = new Cs.FontReference() { Index = A.FontCollectionIndexValues.Minor };
            A.SchemeColor schemeColor24 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };

            fontReference7.Append(schemeColor24);

            dataPoint3D1.Append(lineReference7);
            dataPoint3D1.Append(fillReference7);
            dataPoint3D1.Append(effectReference7);
            dataPoint3D1.Append(fontReference7);

            Cs.DataPointLine dataPointLine1 = new Cs.DataPointLine();

            Cs.LineReference lineReference8 = new Cs.LineReference() { Index = (UInt32Value)0U };
            Cs.StyleColor styleColor3 = new Cs.StyleColor() { Val = "auto" };

            lineReference8.Append(styleColor3);
            Cs.FillReference fillReference8 = new Cs.FillReference() { Index = (UInt32Value)3U };
            Cs.EffectReference effectReference8 = new Cs.EffectReference() { Index = (UInt32Value)2U };

            Cs.FontReference fontReference8 = new Cs.FontReference() { Index = A.FontCollectionIndexValues.Minor };
            A.SchemeColor schemeColor25 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };

            fontReference8.Append(schemeColor25);

            Cs.ShapeProperties shapeProperties9 = new Cs.ShapeProperties();

            A.Outline outline17 = new A.Outline() { Width = 31750, CapType = A.LineCapValues.Round };

            A.SolidFill solidFill28 = new A.SolidFill();
            A.SchemeColor schemeColor26 = new A.SchemeColor() { Val = A.SchemeColorValues.PhColor };

            solidFill28.Append(schemeColor26);
            A.Round round6 = new A.Round();

            outline17.Append(solidFill28);
            outline17.Append(round6);

            shapeProperties9.Append(outline17);

            dataPointLine1.Append(lineReference8);
            dataPointLine1.Append(fillReference8);
            dataPointLine1.Append(effectReference8);
            dataPointLine1.Append(fontReference8);
            dataPointLine1.Append(shapeProperties9);

            Cs.DataPointMarker dataPointMarker1 = new Cs.DataPointMarker();
            Cs.LineReference lineReference9 = new Cs.LineReference() { Index = (UInt32Value)0U };

            Cs.FillReference fillReference9 = new Cs.FillReference() { Index = (UInt32Value)3U };
            Cs.StyleColor styleColor4 = new Cs.StyleColor() { Val = "auto" };

            fillReference9.Append(styleColor4);
            Cs.EffectReference effectReference9 = new Cs.EffectReference() { Index = (UInt32Value)2U };

            Cs.FontReference fontReference9 = new Cs.FontReference() { Index = A.FontCollectionIndexValues.Minor };
            A.SchemeColor schemeColor27 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };

            fontReference9.Append(schemeColor27);

            Cs.ShapeProperties shapeProperties10 = new Cs.ShapeProperties();

            A.Outline outline18 = new A.Outline() { Width = 12700 };

            A.SolidFill solidFill29 = new A.SolidFill();
            A.SchemeColor schemeColor28 = new A.SchemeColor() { Val = A.SchemeColorValues.Light2 };

            solidFill29.Append(schemeColor28);
            A.Round round7 = new A.Round();

            outline18.Append(solidFill29);
            outline18.Append(round7);

            shapeProperties10.Append(outline18);

            dataPointMarker1.Append(lineReference9);
            dataPointMarker1.Append(fillReference9);
            dataPointMarker1.Append(effectReference9);
            dataPointMarker1.Append(fontReference9);
            dataPointMarker1.Append(shapeProperties10);
            Cs.MarkerLayoutProperties markerLayoutProperties1 = new Cs.MarkerLayoutProperties() { Symbol = Cs.MarkerStyle.Circle, Size = 6 };

            Cs.DataPointWireframe dataPointWireframe1 = new Cs.DataPointWireframe();

            Cs.LineReference lineReference10 = new Cs.LineReference() { Index = (UInt32Value)0U };
            Cs.StyleColor styleColor5 = new Cs.StyleColor() { Val = "auto" };

            lineReference10.Append(styleColor5);
            Cs.FillReference fillReference10 = new Cs.FillReference() { Index = (UInt32Value)3U };
            Cs.EffectReference effectReference10 = new Cs.EffectReference() { Index = (UInt32Value)2U };

            Cs.FontReference fontReference10 = new Cs.FontReference() { Index = A.FontCollectionIndexValues.Minor };
            A.SchemeColor schemeColor29 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };

            fontReference10.Append(schemeColor29);

            Cs.ShapeProperties shapeProperties11 = new Cs.ShapeProperties();

            A.Outline outline19 = new A.Outline() { Width = 9525, CapType = A.LineCapValues.Round };

            A.SolidFill solidFill30 = new A.SolidFill();
            A.SchemeColor schemeColor30 = new A.SchemeColor() { Val = A.SchemeColorValues.PhColor };

            solidFill30.Append(schemeColor30);
            A.Round round8 = new A.Round();

            outline19.Append(solidFill30);
            outline19.Append(round8);

            shapeProperties11.Append(outline19);

            dataPointWireframe1.Append(lineReference10);
            dataPointWireframe1.Append(fillReference10);
            dataPointWireframe1.Append(effectReference10);
            dataPointWireframe1.Append(fontReference10);
            dataPointWireframe1.Append(shapeProperties11);

            Cs.DataTableStyle dataTableStyle1 = new Cs.DataTableStyle();
            Cs.LineReference lineReference11 = new Cs.LineReference() { Index = (UInt32Value)0U };
            Cs.FillReference fillReference11 = new Cs.FillReference() { Index = (UInt32Value)0U };
            Cs.EffectReference effectReference11 = new Cs.EffectReference() { Index = (UInt32Value)0U };

            Cs.FontReference fontReference11 = new Cs.FontReference() { Index = A.FontCollectionIndexValues.Minor };
            A.SchemeColor schemeColor31 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };

            fontReference11.Append(schemeColor31);

            Cs.ShapeProperties shapeProperties12 = new Cs.ShapeProperties();

            A.Outline outline20 = new A.Outline() { Width = 9525 };

            A.SolidFill solidFill31 = new A.SolidFill();

            A.SchemeColor schemeColor32 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };
            A.LuminanceModulation luminanceModulation17 = new A.LuminanceModulation() { Val = 15000 };
            A.LuminanceOffset luminanceOffset12 = new A.LuminanceOffset() { Val = 85000 };

            schemeColor32.Append(luminanceModulation17);
            schemeColor32.Append(luminanceOffset12);

            solidFill31.Append(schemeColor32);

            outline20.Append(solidFill31);

            shapeProperties12.Append(outline20);
            Cs.TextCharacterPropertiesType textCharacterPropertiesType6 = new Cs.TextCharacterPropertiesType() { FontSize = 900, Kerning = 1200 };

            dataTableStyle1.Append(lineReference11);
            dataTableStyle1.Append(fillReference11);
            dataTableStyle1.Append(effectReference11);
            dataTableStyle1.Append(fontReference11);
            dataTableStyle1.Append(shapeProperties12);
            dataTableStyle1.Append(textCharacterPropertiesType6);

            Cs.DownBar downBar1 = new Cs.DownBar();
            Cs.LineReference lineReference12 = new Cs.LineReference() { Index = (UInt32Value)0U };
            Cs.FillReference fillReference12 = new Cs.FillReference() { Index = (UInt32Value)0U };
            Cs.EffectReference effectReference12 = new Cs.EffectReference() { Index = (UInt32Value)0U };

            Cs.FontReference fontReference12 = new Cs.FontReference() { Index = A.FontCollectionIndexValues.Minor };
            A.SchemeColor schemeColor33 = new A.SchemeColor() { Val = A.SchemeColorValues.Dark1 };

            fontReference12.Append(schemeColor33);

            Cs.ShapeProperties shapeProperties13 = new Cs.ShapeProperties();

            A.SolidFill solidFill32 = new A.SolidFill();

            A.SchemeColor schemeColor34 = new A.SchemeColor() { Val = A.SchemeColorValues.Dark1 };
            A.LuminanceModulation luminanceModulation18 = new A.LuminanceModulation() { Val = 65000 };
            A.LuminanceOffset luminanceOffset13 = new A.LuminanceOffset() { Val = 35000 };

            schemeColor34.Append(luminanceModulation18);
            schemeColor34.Append(luminanceOffset13);

            solidFill32.Append(schemeColor34);

            A.Outline outline21 = new A.Outline() { Width = 9525 };

            A.SolidFill solidFill33 = new A.SolidFill();

            A.SchemeColor schemeColor35 = new A.SchemeColor() { Val = A.SchemeColorValues.Text1 };
            A.LuminanceModulation luminanceModulation19 = new A.LuminanceModulation() { Val = 65000 };
            A.LuminanceOffset luminanceOffset14 = new A.LuminanceOffset() { Val = 35000 };

            schemeColor35.Append(luminanceModulation19);
            schemeColor35.Append(luminanceOffset14);

            solidFill33.Append(schemeColor35);

            outline21.Append(solidFill33);

            shapeProperties13.Append(solidFill32);
            shapeProperties13.Append(outline21);

            downBar1.Append(lineReference12);
            downBar1.Append(fillReference12);
            downBar1.Append(effectReference12);
            downBar1.Append(fontReference12);
            downBar1.Append(shapeProperties13);

            Cs.DropLine dropLine1 = new Cs.DropLine();
            Cs.LineReference lineReference13 = new Cs.LineReference() { Index = (UInt32Value)0U };
            Cs.FillReference fillReference13 = new Cs.FillReference() { Index = (UInt32Value)0U };
            Cs.EffectReference effectReference13 = new Cs.EffectReference() { Index = (UInt32Value)0U };

            Cs.FontReference fontReference13 = new Cs.FontReference() { Index = A.FontCollectionIndexValues.Minor };
            A.SchemeColor schemeColor36 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };

            fontReference13.Append(schemeColor36);

            Cs.ShapeProperties shapeProperties14 = new Cs.ShapeProperties();

            A.Outline outline22 = new A.Outline() { Width = 9525 };

            A.SolidFill solidFill34 = new A.SolidFill();

            A.SchemeColor schemeColor37 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };
            A.LuminanceModulation luminanceModulation20 = new A.LuminanceModulation() { Val = 60000 };
            A.LuminanceOffset luminanceOffset15 = new A.LuminanceOffset() { Val = 40000 };

            schemeColor37.Append(luminanceModulation20);
            schemeColor37.Append(luminanceOffset15);

            solidFill34.Append(schemeColor37);
            A.PresetDash presetDash1 = new A.PresetDash() { Val = A.PresetLineDashValues.Dash };

            outline22.Append(solidFill34);
            outline22.Append(presetDash1);

            shapeProperties14.Append(outline22);

            dropLine1.Append(lineReference13);
            dropLine1.Append(fillReference13);
            dropLine1.Append(effectReference13);
            dropLine1.Append(fontReference13);
            dropLine1.Append(shapeProperties14);

            Cs.ErrorBar errorBar1 = new Cs.ErrorBar();
            Cs.LineReference lineReference14 = new Cs.LineReference() { Index = (UInt32Value)0U };
            Cs.FillReference fillReference14 = new Cs.FillReference() { Index = (UInt32Value)0U };
            Cs.EffectReference effectReference14 = new Cs.EffectReference() { Index = (UInt32Value)0U };

            Cs.FontReference fontReference14 = new Cs.FontReference() { Index = A.FontCollectionIndexValues.Minor };
            A.SchemeColor schemeColor38 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };

            fontReference14.Append(schemeColor38);

            Cs.ShapeProperties shapeProperties15 = new Cs.ShapeProperties();

            A.Outline outline23 = new A.Outline() { Width = 9525 };

            A.SolidFill solidFill35 = new A.SolidFill();

            A.SchemeColor schemeColor39 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };
            A.LuminanceModulation luminanceModulation21 = new A.LuminanceModulation() { Val = 75000 };

            schemeColor39.Append(luminanceModulation21);

            solidFill35.Append(schemeColor39);
            A.Round round9 = new A.Round();

            outline23.Append(solidFill35);
            outline23.Append(round9);

            shapeProperties15.Append(outline23);

            errorBar1.Append(lineReference14);
            errorBar1.Append(fillReference14);
            errorBar1.Append(effectReference14);
            errorBar1.Append(fontReference14);
            errorBar1.Append(shapeProperties15);

            Cs.Floor floor1 = new Cs.Floor();
            Cs.LineReference lineReference15 = new Cs.LineReference() { Index = (UInt32Value)0U };
            Cs.FillReference fillReference15 = new Cs.FillReference() { Index = (UInt32Value)0U };
            Cs.EffectReference effectReference15 = new Cs.EffectReference() { Index = (UInt32Value)0U };

            Cs.FontReference fontReference15 = new Cs.FontReference() { Index = A.FontCollectionIndexValues.Minor };
            A.SchemeColor schemeColor40 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };

            fontReference15.Append(schemeColor40);

            floor1.Append(lineReference15);
            floor1.Append(fillReference15);
            floor1.Append(effectReference15);
            floor1.Append(fontReference15);

            Cs.GridlineMajor gridlineMajor1 = new Cs.GridlineMajor();
            Cs.LineReference lineReference16 = new Cs.LineReference() { Index = (UInt32Value)0U };
            Cs.FillReference fillReference16 = new Cs.FillReference() { Index = (UInt32Value)0U };
            Cs.EffectReference effectReference16 = new Cs.EffectReference() { Index = (UInt32Value)0U };

            Cs.FontReference fontReference16 = new Cs.FontReference() { Index = A.FontCollectionIndexValues.Minor };
            A.SchemeColor schemeColor41 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };

            fontReference16.Append(schemeColor41);

            Cs.ShapeProperties shapeProperties16 = new Cs.ShapeProperties();

            A.Outline outline24 = new A.Outline() { Width = 9525, CapType = A.LineCapValues.Flat, CompoundLineType = A.CompoundLineValues.Single, Alignment = A.PenAlignmentValues.Center };

            A.SolidFill solidFill36 = new A.SolidFill();

            A.SchemeColor schemeColor42 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };
            A.LuminanceModulation luminanceModulation22 = new A.LuminanceModulation() { Val = 15000 };
            A.LuminanceOffset luminanceOffset16 = new A.LuminanceOffset() { Val = 85000 };

            schemeColor42.Append(luminanceModulation22);
            schemeColor42.Append(luminanceOffset16);

            solidFill36.Append(schemeColor42);
            A.Round round10 = new A.Round();

            outline24.Append(solidFill36);
            outline24.Append(round10);

            shapeProperties16.Append(outline24);

            gridlineMajor1.Append(lineReference16);
            gridlineMajor1.Append(fillReference16);
            gridlineMajor1.Append(effectReference16);
            gridlineMajor1.Append(fontReference16);
            gridlineMajor1.Append(shapeProperties16);

            Cs.GridlineMinor gridlineMinor1 = new Cs.GridlineMinor();
            Cs.LineReference lineReference17 = new Cs.LineReference() { Index = (UInt32Value)0U };
            Cs.FillReference fillReference17 = new Cs.FillReference() { Index = (UInt32Value)0U };
            Cs.EffectReference effectReference17 = new Cs.EffectReference() { Index = (UInt32Value)0U };

            Cs.FontReference fontReference17 = new Cs.FontReference() { Index = A.FontCollectionIndexValues.Minor };
            A.SchemeColor schemeColor43 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };

            fontReference17.Append(schemeColor43);

            Cs.ShapeProperties shapeProperties17 = new Cs.ShapeProperties();

            A.Outline outline25 = new A.Outline();

            A.SolidFill solidFill37 = new A.SolidFill();

            A.SchemeColor schemeColor44 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };
            A.LuminanceModulation luminanceModulation23 = new A.LuminanceModulation() { Val = 5000 };
            A.LuminanceOffset luminanceOffset17 = new A.LuminanceOffset() { Val = 95000 };

            schemeColor44.Append(luminanceModulation23);
            schemeColor44.Append(luminanceOffset17);

            solidFill37.Append(schemeColor44);

            outline25.Append(solidFill37);

            shapeProperties17.Append(outline25);

            gridlineMinor1.Append(lineReference17);
            gridlineMinor1.Append(fillReference17);
            gridlineMinor1.Append(effectReference17);
            gridlineMinor1.Append(fontReference17);
            gridlineMinor1.Append(shapeProperties17);

            Cs.HiLoLine hiLoLine1 = new Cs.HiLoLine();
            Cs.LineReference lineReference18 = new Cs.LineReference() { Index = (UInt32Value)0U };
            Cs.FillReference fillReference18 = new Cs.FillReference() { Index = (UInt32Value)0U };
            Cs.EffectReference effectReference18 = new Cs.EffectReference() { Index = (UInt32Value)0U };

            Cs.FontReference fontReference18 = new Cs.FontReference() { Index = A.FontCollectionIndexValues.Minor };
            A.SchemeColor schemeColor45 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };

            fontReference18.Append(schemeColor45);

            Cs.ShapeProperties shapeProperties18 = new Cs.ShapeProperties();

            A.Outline outline26 = new A.Outline() { Width = 9525 };

            A.SolidFill solidFill38 = new A.SolidFill();

            A.SchemeColor schemeColor46 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };
            A.LuminanceModulation luminanceModulation24 = new A.LuminanceModulation() { Val = 60000 };
            A.LuminanceOffset luminanceOffset18 = new A.LuminanceOffset() { Val = 40000 };

            schemeColor46.Append(luminanceModulation24);
            schemeColor46.Append(luminanceOffset18);

            solidFill38.Append(schemeColor46);
            A.PresetDash presetDash2 = new A.PresetDash() { Val = A.PresetLineDashValues.Dash };

            outline26.Append(solidFill38);
            outline26.Append(presetDash2);

            shapeProperties18.Append(outline26);

            hiLoLine1.Append(lineReference18);
            hiLoLine1.Append(fillReference18);
            hiLoLine1.Append(effectReference18);
            hiLoLine1.Append(fontReference18);
            hiLoLine1.Append(shapeProperties18);

            Cs.LeaderLine leaderLine1 = new Cs.LeaderLine();
            Cs.LineReference lineReference19 = new Cs.LineReference() { Index = (UInt32Value)0U };
            Cs.FillReference fillReference19 = new Cs.FillReference() { Index = (UInt32Value)0U };
            Cs.EffectReference effectReference19 = new Cs.EffectReference() { Index = (UInt32Value)0U };

            Cs.FontReference fontReference19 = new Cs.FontReference() { Index = A.FontCollectionIndexValues.Minor };
            A.SchemeColor schemeColor47 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };

            fontReference19.Append(schemeColor47);

            Cs.ShapeProperties shapeProperties19 = new Cs.ShapeProperties();

            A.Outline outline27 = new A.Outline() { Width = 9525 };

            A.SolidFill solidFill39 = new A.SolidFill();

            A.SchemeColor schemeColor48 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };
            A.LuminanceModulation luminanceModulation25 = new A.LuminanceModulation() { Val = 35000 };
            A.LuminanceOffset luminanceOffset19 = new A.LuminanceOffset() { Val = 65000 };

            schemeColor48.Append(luminanceModulation25);
            schemeColor48.Append(luminanceOffset19);

            solidFill39.Append(schemeColor48);

            outline27.Append(solidFill39);

            shapeProperties19.Append(outline27);

            leaderLine1.Append(lineReference19);
            leaderLine1.Append(fillReference19);
            leaderLine1.Append(effectReference19);
            leaderLine1.Append(fontReference19);
            leaderLine1.Append(shapeProperties19);

            Cs.LegendStyle legendStyle1 = new Cs.LegendStyle();
            Cs.LineReference lineReference20 = new Cs.LineReference() { Index = (UInt32Value)0U };
            Cs.FillReference fillReference20 = new Cs.FillReference() { Index = (UInt32Value)0U };
            Cs.EffectReference effectReference20 = new Cs.EffectReference() { Index = (UInt32Value)0U };

            Cs.FontReference fontReference20 = new Cs.FontReference() { Index = A.FontCollectionIndexValues.Minor };
            A.SchemeColor schemeColor49 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };

            fontReference20.Append(schemeColor49);
            Cs.TextCharacterPropertiesType textCharacterPropertiesType7 = new Cs.TextCharacterPropertiesType() { FontSize = 900, Kerning = 1200 };

            legendStyle1.Append(lineReference20);
            legendStyle1.Append(fillReference20);
            legendStyle1.Append(effectReference20);
            legendStyle1.Append(fontReference20);
            legendStyle1.Append(textCharacterPropertiesType7);

            Cs.PlotArea plotArea2 = new Cs.PlotArea();
            Cs.LineReference lineReference21 = new Cs.LineReference() { Index = (UInt32Value)0U };
            Cs.FillReference fillReference21 = new Cs.FillReference() { Index = (UInt32Value)0U };
            Cs.EffectReference effectReference21 = new Cs.EffectReference() { Index = (UInt32Value)0U };

            Cs.FontReference fontReference21 = new Cs.FontReference() { Index = A.FontCollectionIndexValues.Minor };
            A.SchemeColor schemeColor50 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };

            fontReference21.Append(schemeColor50);

            plotArea2.Append(lineReference21);
            plotArea2.Append(fillReference21);
            plotArea2.Append(effectReference21);
            plotArea2.Append(fontReference21);

            Cs.PlotArea3D plotArea3D1 = new Cs.PlotArea3D();
            Cs.LineReference lineReference22 = new Cs.LineReference() { Index = (UInt32Value)0U };
            Cs.FillReference fillReference22 = new Cs.FillReference() { Index = (UInt32Value)0U };
            Cs.EffectReference effectReference22 = new Cs.EffectReference() { Index = (UInt32Value)0U };

            Cs.FontReference fontReference22 = new Cs.FontReference() { Index = A.FontCollectionIndexValues.Minor };
            A.SchemeColor schemeColor51 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };

            fontReference22.Append(schemeColor51);

            plotArea3D1.Append(lineReference22);
            plotArea3D1.Append(fillReference22);
            plotArea3D1.Append(effectReference22);
            plotArea3D1.Append(fontReference22);

            Cs.SeriesAxis seriesAxis1 = new Cs.SeriesAxis();
            Cs.LineReference lineReference23 = new Cs.LineReference() { Index = (UInt32Value)0U };
            Cs.FillReference fillReference23 = new Cs.FillReference() { Index = (UInt32Value)0U };
            Cs.EffectReference effectReference23 = new Cs.EffectReference() { Index = (UInt32Value)0U };

            Cs.FontReference fontReference23 = new Cs.FontReference() { Index = A.FontCollectionIndexValues.Minor };
            A.SchemeColor schemeColor52 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };

            fontReference23.Append(schemeColor52);

            Cs.ShapeProperties shapeProperties20 = new Cs.ShapeProperties();

            A.Outline outline28 = new A.Outline() { Width = 9525, CapType = A.LineCapValues.Flat, CompoundLineType = A.CompoundLineValues.Single, Alignment = A.PenAlignmentValues.Center };

            A.SolidFill solidFill40 = new A.SolidFill();

            A.SchemeColor schemeColor53 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };
            A.LuminanceModulation luminanceModulation26 = new A.LuminanceModulation() { Val = 15000 };
            A.LuminanceOffset luminanceOffset20 = new A.LuminanceOffset() { Val = 85000 };

            schemeColor53.Append(luminanceModulation26);
            schemeColor53.Append(luminanceOffset20);

            solidFill40.Append(schemeColor53);
            A.Round round11 = new A.Round();

            outline28.Append(solidFill40);
            outline28.Append(round11);

            shapeProperties20.Append(outline28);
            Cs.TextCharacterPropertiesType textCharacterPropertiesType8 = new Cs.TextCharacterPropertiesType() { FontSize = 900, Kerning = 1200 };

            seriesAxis1.Append(lineReference23);
            seriesAxis1.Append(fillReference23);
            seriesAxis1.Append(effectReference23);
            seriesAxis1.Append(fontReference23);
            seriesAxis1.Append(shapeProperties20);
            seriesAxis1.Append(textCharacterPropertiesType8);

            Cs.SeriesLine seriesLine1 = new Cs.SeriesLine();
            Cs.LineReference lineReference24 = new Cs.LineReference() { Index = (UInt32Value)0U };
            Cs.FillReference fillReference24 = new Cs.FillReference() { Index = (UInt32Value)0U };
            Cs.EffectReference effectReference24 = new Cs.EffectReference() { Index = (UInt32Value)0U };

            Cs.FontReference fontReference24 = new Cs.FontReference() { Index = A.FontCollectionIndexValues.Minor };
            A.SchemeColor schemeColor54 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };

            fontReference24.Append(schemeColor54);

            Cs.ShapeProperties shapeProperties21 = new Cs.ShapeProperties();

            A.Outline outline29 = new A.Outline() { Width = 9525 };

            A.SolidFill solidFill41 = new A.SolidFill();

            A.SchemeColor schemeColor55 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };
            A.LuminanceModulation luminanceModulation27 = new A.LuminanceModulation() { Val = 60000 };
            A.LuminanceOffset luminanceOffset21 = new A.LuminanceOffset() { Val = 40000 };

            schemeColor55.Append(luminanceModulation27);
            schemeColor55.Append(luminanceOffset21);

            solidFill41.Append(schemeColor55);
            A.PresetDash presetDash3 = new A.PresetDash() { Val = A.PresetLineDashValues.Dash };

            outline29.Append(solidFill41);
            outline29.Append(presetDash3);

            shapeProperties21.Append(outline29);

            seriesLine1.Append(lineReference24);
            seriesLine1.Append(fillReference24);
            seriesLine1.Append(effectReference24);
            seriesLine1.Append(fontReference24);
            seriesLine1.Append(shapeProperties21);

            Cs.TitleStyle titleStyle1 = new Cs.TitleStyle();
            Cs.LineReference lineReference25 = new Cs.LineReference() { Index = (UInt32Value)0U };
            Cs.FillReference fillReference25 = new Cs.FillReference() { Index = (UInt32Value)0U };
            Cs.EffectReference effectReference25 = new Cs.EffectReference() { Index = (UInt32Value)0U };

            Cs.FontReference fontReference25 = new Cs.FontReference() { Index = A.FontCollectionIndexValues.Minor };
            A.SchemeColor schemeColor56 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };

            fontReference25.Append(schemeColor56);
            Cs.TextCharacterPropertiesType textCharacterPropertiesType9 = new Cs.TextCharacterPropertiesType() { FontSize = 1600, Bold = true, Kerning = 1200 };

            titleStyle1.Append(lineReference25);
            titleStyle1.Append(fillReference25);
            titleStyle1.Append(effectReference25);
            titleStyle1.Append(fontReference25);
            titleStyle1.Append(textCharacterPropertiesType9);

            Cs.TrendlineStyle trendlineStyle1 = new Cs.TrendlineStyle();

            Cs.LineReference lineReference26 = new Cs.LineReference() { Index = (UInt32Value)0U };
            Cs.StyleColor styleColor6 = new Cs.StyleColor() { Val = "auto" };

            lineReference26.Append(styleColor6);
            Cs.FillReference fillReference26 = new Cs.FillReference() { Index = (UInt32Value)0U };
            Cs.EffectReference effectReference26 = new Cs.EffectReference() { Index = (UInt32Value)0U };

            Cs.FontReference fontReference26 = new Cs.FontReference() { Index = A.FontCollectionIndexValues.Minor };
            A.SchemeColor schemeColor57 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };

            fontReference26.Append(schemeColor57);

            Cs.ShapeProperties shapeProperties22 = new Cs.ShapeProperties();

            A.Outline outline30 = new A.Outline() { Width = 19050, CapType = A.LineCapValues.Round };

            A.SolidFill solidFill42 = new A.SolidFill();
            A.SchemeColor schemeColor58 = new A.SchemeColor() { Val = A.SchemeColorValues.PhColor };

            solidFill42.Append(schemeColor58);
            A.PresetDash presetDash4 = new A.PresetDash() { Val = A.PresetLineDashValues.SystemDash };

            outline30.Append(solidFill42);
            outline30.Append(presetDash4);

            shapeProperties22.Append(outline30);

            trendlineStyle1.Append(lineReference26);
            trendlineStyle1.Append(fillReference26);
            trendlineStyle1.Append(effectReference26);
            trendlineStyle1.Append(fontReference26);
            trendlineStyle1.Append(shapeProperties22);

            Cs.TrendlineLabel trendlineLabel1 = new Cs.TrendlineLabel();
            Cs.LineReference lineReference27 = new Cs.LineReference() { Index = (UInt32Value)0U };
            Cs.FillReference fillReference27 = new Cs.FillReference() { Index = (UInt32Value)0U };
            Cs.EffectReference effectReference27 = new Cs.EffectReference() { Index = (UInt32Value)0U };

            Cs.FontReference fontReference27 = new Cs.FontReference() { Index = A.FontCollectionIndexValues.Minor };
            A.SchemeColor schemeColor59 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };

            fontReference27.Append(schemeColor59);
            Cs.TextCharacterPropertiesType textCharacterPropertiesType10 = new Cs.TextCharacterPropertiesType() { FontSize = 900, Kerning = 1200 };

            trendlineLabel1.Append(lineReference27);
            trendlineLabel1.Append(fillReference27);
            trendlineLabel1.Append(effectReference27);
            trendlineLabel1.Append(fontReference27);
            trendlineLabel1.Append(textCharacterPropertiesType10);

            Cs.UpBar upBar1 = new Cs.UpBar();
            Cs.LineReference lineReference28 = new Cs.LineReference() { Index = (UInt32Value)0U };
            Cs.FillReference fillReference28 = new Cs.FillReference() { Index = (UInt32Value)0U };
            Cs.EffectReference effectReference28 = new Cs.EffectReference() { Index = (UInt32Value)0U };

            Cs.FontReference fontReference28 = new Cs.FontReference() { Index = A.FontCollectionIndexValues.Minor };
            A.SchemeColor schemeColor60 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };

            fontReference28.Append(schemeColor60);

            Cs.ShapeProperties shapeProperties23 = new Cs.ShapeProperties();

            A.SolidFill solidFill43 = new A.SolidFill();
            A.SchemeColor schemeColor61 = new A.SchemeColor() { Val = A.SchemeColorValues.Light1 };

            solidFill43.Append(schemeColor61);

            A.Outline outline31 = new A.Outline() { Width = 9525 };

            A.SolidFill solidFill44 = new A.SolidFill();

            A.SchemeColor schemeColor62 = new A.SchemeColor() { Val = A.SchemeColorValues.Text1 };
            A.LuminanceModulation luminanceModulation28 = new A.LuminanceModulation() { Val = 15000 };
            A.LuminanceOffset luminanceOffset22 = new A.LuminanceOffset() { Val = 85000 };

            schemeColor62.Append(luminanceModulation28);
            schemeColor62.Append(luminanceOffset22);

            solidFill44.Append(schemeColor62);

            outline31.Append(solidFill44);

            shapeProperties23.Append(solidFill43);
            shapeProperties23.Append(outline31);

            upBar1.Append(lineReference28);
            upBar1.Append(fillReference28);
            upBar1.Append(effectReference28);
            upBar1.Append(fontReference28);
            upBar1.Append(shapeProperties23);

            Cs.ValueAxis valueAxis2 = new Cs.ValueAxis();
            Cs.LineReference lineReference29 = new Cs.LineReference() { Index = (UInt32Value)0U };
            Cs.FillReference fillReference29 = new Cs.FillReference() { Index = (UInt32Value)0U };
            Cs.EffectReference effectReference29 = new Cs.EffectReference() { Index = (UInt32Value)0U };

            Cs.FontReference fontReference29 = new Cs.FontReference() { Index = A.FontCollectionIndexValues.Minor };
            A.SchemeColor schemeColor63 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };

            fontReference29.Append(schemeColor63);
            Cs.TextCharacterPropertiesType textCharacterPropertiesType11 = new Cs.TextCharacterPropertiesType() { FontSize = 900, Kerning = 1200 };

            valueAxis2.Append(lineReference29);
            valueAxis2.Append(fillReference29);
            valueAxis2.Append(effectReference29);
            valueAxis2.Append(fontReference29);
            valueAxis2.Append(textCharacterPropertiesType11);

            Cs.Wall wall1 = new Cs.Wall();
            Cs.LineReference lineReference30 = new Cs.LineReference() { Index = (UInt32Value)0U };
            Cs.FillReference fillReference30 = new Cs.FillReference() { Index = (UInt32Value)0U };
            Cs.EffectReference effectReference30 = new Cs.EffectReference() { Index = (UInt32Value)0U };

            Cs.FontReference fontReference30 = new Cs.FontReference() { Index = A.FontCollectionIndexValues.Minor };
            A.SchemeColor schemeColor64 = new A.SchemeColor() { Val = A.SchemeColorValues.Text2 };

            fontReference30.Append(schemeColor64);

            wall1.Append(lineReference30);
            wall1.Append(fillReference30);
            wall1.Append(effectReference30);
            wall1.Append(fontReference30);

            chartStyle1.Append(axisTitle1);
            chartStyle1.Append(categoryAxis2);
            chartStyle1.Append(chartArea1);
            chartStyle1.Append(dataLabel1);
            chartStyle1.Append(dataLabelCallout1);
            chartStyle1.Append(dataPoint1);
            chartStyle1.Append(dataPoint3D1);
            chartStyle1.Append(dataPointLine1);
            chartStyle1.Append(dataPointMarker1);
            chartStyle1.Append(markerLayoutProperties1);
            chartStyle1.Append(dataPointWireframe1);
            chartStyle1.Append(dataTableStyle1);
            chartStyle1.Append(downBar1);
            chartStyle1.Append(dropLine1);
            chartStyle1.Append(errorBar1);
            chartStyle1.Append(floor1);
            chartStyle1.Append(gridlineMajor1);
            chartStyle1.Append(gridlineMinor1);
            chartStyle1.Append(hiLoLine1);
            chartStyle1.Append(leaderLine1);
            chartStyle1.Append(legendStyle1);
            chartStyle1.Append(plotArea2);
            chartStyle1.Append(plotArea3D1);
            chartStyle1.Append(seriesAxis1);
            chartStyle1.Append(seriesLine1);
            chartStyle1.Append(titleStyle1);
            chartStyle1.Append(trendlineStyle1);
            chartStyle1.Append(trendlineLabel1);
            chartStyle1.Append(upBar1);
            chartStyle1.Append(valueAxis2);
            chartStyle1.Append(wall1);

            chartStylePart1.ChartStyle = chartStyle1;
        }

        public void GenerateDrawingsPart1Content(DrawingsPart drawingsPart1)
        {
            Xdr.WorksheetDrawing worksheetDrawing1 = new Xdr.WorksheetDrawing();
            worksheetDrawing1.AddNamespaceDeclaration("xdr", "http://schemas.openxmlformats.org/drawingml/2006/spreadsheetDrawing");
            worksheetDrawing1.AddNamespaceDeclaration("a", "http://schemas.openxmlformats.org/drawingml/2006/main");

            Xdr.AbsoluteAnchor absoluteAnchor1 = new Xdr.AbsoluteAnchor();
            Xdr.Position position1 = new Xdr.Position() { X = 0L, Y = 0L };
            Xdr.Extent extent1 = new Xdr.Extent() { Cx = 8659091L, Cy = 6286500L };

            Xdr.GraphicFrame graphicFrame1 = new Xdr.GraphicFrame() { Macro = "" };

            Xdr.NonVisualGraphicFrameProperties nonVisualGraphicFrameProperties1 = new Xdr.NonVisualGraphicFrameProperties();

            Xdr.NonVisualDrawingProperties nonVisualDrawingProperties1 = new Xdr.NonVisualDrawingProperties() { Id = (UInt32Value)2U, Name = "Chart 1" };

            A.NonVisualDrawingPropertiesExtensionList nonVisualDrawingPropertiesExtensionList1 = new A.NonVisualDrawingPropertiesExtensionList();

            A.NonVisualDrawingPropertiesExtension nonVisualDrawingPropertiesExtension1 = new A.NonVisualDrawingPropertiesExtension() { Uri = "{FF2B5EF4-FFF2-40B4-BE49-F238E27FC236}" };

            OpenXmlUnknownElement openXmlUnknownElement2 = OpenXmlUnknownElement.CreateOpenXmlUnknownElement("<a16:creationId xmlns:a16=\"http://schemas.microsoft.com/office/drawing/2014/main\" id=\"{580F3107-54FC-DDAF-B0F9-14B508FC97EE}\" />");

            nonVisualDrawingPropertiesExtension1.Append(openXmlUnknownElement2);

            nonVisualDrawingPropertiesExtensionList1.Append(nonVisualDrawingPropertiesExtension1);

            nonVisualDrawingProperties1.Append(nonVisualDrawingPropertiesExtensionList1);

            Xdr.NonVisualGraphicFrameDrawingProperties nonVisualGraphicFrameDrawingProperties1 = new Xdr.NonVisualGraphicFrameDrawingProperties();
            A.GraphicFrameLocks graphicFrameLocks1 = new A.GraphicFrameLocks() { NoGrouping = true };

            nonVisualGraphicFrameDrawingProperties1.Append(graphicFrameLocks1);

            nonVisualGraphicFrameProperties1.Append(nonVisualDrawingProperties1);
            nonVisualGraphicFrameProperties1.Append(nonVisualGraphicFrameDrawingProperties1);

            Xdr.Transform transform1 = new Xdr.Transform();
            A.Offset offset1 = new A.Offset() { X = 0L, Y = 0L };
            A.Extents extents1 = new A.Extents() { Cx = 0L, Cy = 0L };

            transform1.Append(offset1);
            transform1.Append(extents1);

            A.Graphic graphic1 = new A.Graphic();

            A.GraphicData graphicData1 = new A.GraphicData() { Uri = "http://schemas.openxmlformats.org/drawingml/2006/chart" };

            C.ChartReference chartReference1 = new C.ChartReference() { Id = "rId1" };
            chartReference1.AddNamespaceDeclaration("c", "http://schemas.openxmlformats.org/drawingml/2006/chart");
            chartReference1.AddNamespaceDeclaration("r", "http://schemas.openxmlformats.org/officeDocument/2006/relationships");

            graphicData1.Append(chartReference1);

            graphic1.Append(graphicData1);

            graphicFrame1.Append(nonVisualGraphicFrameProperties1);
            graphicFrame1.Append(transform1);
            graphicFrame1.Append(graphic1);
            Xdr.ClientData clientData1 = new Xdr.ClientData();

            absoluteAnchor1.Append(position1);
            absoluteAnchor1.Append(extent1);
            absoluteAnchor1.Append(graphicFrame1);
            absoluteAnchor1.Append(clientData1);

            worksheetDrawing1.Append(absoluteAnchor1);

            drawingsPart1.WorksheetDrawing = worksheetDrawing1;
        }

        public void GenerateExtendedFilePropertiesPart1Content(ExtendedFilePropertiesPart extendedFilePropertiesPart1)
        {
            Properties properties1 = new Properties();
            properties1.AddNamespaceDeclaration("vt", "http://schemas.openxmlformats.org/officeDocument/2006/docPropsVTypes");
            DocumentSecurity documentSecurity1 = new DocumentSecurity();
            documentSecurity1.Text = "0";
            ScaleCrop scaleCrop1 = new ScaleCrop();
            scaleCrop1.Text = "false";

            HeadingPairs headingPairs1 = new HeadingPairs();

            VTVector vTVector1 = new VTVector() { BaseType = VectorBaseValues.Variant, Size = (UInt32Value)4U };

            Variant variant1 = new Variant();
            VTLPSTR vTLPSTR1 = new VTLPSTR();
            vTLPSTR1.Text = "Worksheets";

            variant1.Append(vTLPSTR1);

            Variant variant2 = new Variant();
            VTInt32 vTInt321 = new VTInt32();
            vTInt321.Text = "2";

            variant2.Append(vTInt321);

            Variant variant3 = new Variant();
            VTLPSTR vTLPSTR2 = new VTLPSTR();
            vTLPSTR2.Text = "Charts";

            variant3.Append(vTLPSTR2);

            Variant variant4 = new Variant();
            VTInt32 vTInt322 = new VTInt32();
            vTInt322.Text = "1";

            variant4.Append(vTInt322);

            vTVector1.Append(variant1);
            vTVector1.Append(variant2);
            vTVector1.Append(variant3);
            vTVector1.Append(variant4);

            headingPairs1.Append(vTVector1);

            TitlesOfParts titlesOfParts1 = new TitlesOfParts();

            VTVector vTVector2 = new VTVector() { BaseType = VectorBaseValues.Lpstr, Size = (UInt32Value)3U };
            VTLPSTR vTLPSTR3 = new VTLPSTR();
            vTLPSTR3.Text = "HISTORICO";
            VTLPSTR vTLPSTR4 = new VTLPSTR();
            vTLPSTR4.Text = "Tabla promedios";
            VTLPSTR vTLPSTR5 = new VTLPSTR();
            vTLPSTR5.Text = "Gráfico Cumplimiento";

            vTVector2.Append(vTLPSTR3);
            vTVector2.Append(vTLPSTR4);
            vTVector2.Append(vTLPSTR5);

            titlesOfParts1.Append(vTVector2);
            Company company1 = new Company();
            company1.Text = "";
            LinksUpToDate linksUpToDate1 = new LinksUpToDate();
            linksUpToDate1.Text = "false";
            SharedDocument sharedDocument1 = new SharedDocument();
            sharedDocument1.Text = "false";
            HyperlinksChanged hyperlinksChanged1 = new HyperlinksChanged();
            hyperlinksChanged1.Text = "false";
            ApplicationVersion applicationVersion1 = new ApplicationVersion();
            applicationVersion1.Text = "16.0300";

            properties1.Append(documentSecurity1);
            properties1.Append(scaleCrop1);
            properties1.Append(headingPairs1);
            properties1.Append(titlesOfParts1);
            properties1.Append(company1);
            properties1.Append(linksUpToDate1);
            properties1.Append(sharedDocument1);
            properties1.Append(hyperlinksChanged1);
            properties1.Append(applicationVersion1);

            extendedFilePropertiesPart1.Properties = properties1;

        }

        public void GenerarLogoTq1Content(ImagePart imagePart1)
        {
            Stream data = GetBinaryDataStream(logoTQPequenio);
            imagePart1.FeedData(data);
            data.Close();
        }

        public void GenerarLogoTq2Content(ImagePart imagePart2)
        {
            Stream data = GetBinaryDataStream(logoTQGrande);
            imagePart2.FeedData(data);
            data.Close();
        }

        private void GenerateSharedStringTablePart1Content(SharedStringTablePart sharedStringTablePart1)
        {
            SharedStringTable sharedStringTable1 = new SharedStringTable() { Count = (UInt32Value)995U, UniqueCount = (UInt32Value)346U };

            SharedStringItem sharedStringItem1 = new SharedStringItem();
            Text text5 = new Text();
            text5.Text = "Indicador Cantidad";

            sharedStringItem1.Append(text5);

            SharedStringItem sharedStringItem2 = new SharedStringItem();
            Text text6 = new Text();
            text6.Text = "Indicador Calidad";

            sharedStringItem2.Append(text6);

            SharedStringItem sharedStringItem9 = new SharedStringItem();
            Text text13 = new Text();
            text13.Text = "PERIODO";

            sharedStringItem9.Append(text13);

            SharedStringItem sharedStringItem14 = new SharedStringItem();
            Text text18 = new Text();
            text18.Text = "Total general";

            sharedStringItem14.Append(text18);

            SharedStringItem sharedStringItem17 = new SharedStringItem();
            Text text21 = new Text();
            text21.Text = "Indicador Fecha oportuna";

            sharedStringItem17.Append(text21);

            SharedStringItem sharedStringItem18 = new SharedStringItem();
            Text text22 = new Text();
            text22.Text = "Desempeño";

            sharedStringItem18.Append(text22);

            SharedStringItem sharedStringItem19 = new SharedStringItem();
            Text text23 = new Text();
            text23.Text = "Cantidad Órdenes Compra";

            sharedStringItem19.Append(text23);

            sharedStringTable1.Append(sharedStringItem1);
            sharedStringTable1.Append(sharedStringItem2);

            sharedStringTable1.Append(sharedStringItem9);
            sharedStringTable1.Append(sharedStringItem14);
            sharedStringTable1.Append(sharedStringItem17);
            sharedStringTable1.Append(sharedStringItem18);
            sharedStringTable1.Append(sharedStringItem19);

            sharedStringTablePart1.SharedStringTable = sharedStringTable1;
        }

        public void GenerateThemePart1Content(ThemePart themePart1)
        {
            A.Theme theme1 = new A.Theme() { Name = "Office Theme" };
            theme1.AddNamespaceDeclaration("a", "http://schemas.openxmlformats.org/drawingml/2006/main");

            A.ThemeElements themeElements1 = new A.ThemeElements();

            A.ColorScheme colorScheme1 = new A.ColorScheme() { Name = "Office" };

            A.Dark1Color dark1Color1 = new A.Dark1Color();
            A.SystemColor systemColor1 = new A.SystemColor() { Val = A.SystemColorValues.WindowText, LastColor = "000000" };

            dark1Color1.Append(systemColor1);

            A.Light1Color light1Color1 = new A.Light1Color();
            A.SystemColor systemColor2 = new A.SystemColor() { Val = A.SystemColorValues.Window, LastColor = "FFFFFF" };

            light1Color1.Append(systemColor2);

            A.Dark2Color dark2Color1 = new A.Dark2Color();
            A.RgbColorModelHex rgbColorModelHex14 = new A.RgbColorModelHex() { Val = "44546A" };

            dark2Color1.Append(rgbColorModelHex14);

            A.Light2Color light2Color1 = new A.Light2Color();
            A.RgbColorModelHex rgbColorModelHex15 = new A.RgbColorModelHex() { Val = "E7E6E6" };

            light2Color1.Append(rgbColorModelHex15);

            A.Accent1Color accent1Color1 = new A.Accent1Color();
            A.RgbColorModelHex rgbColorModelHex16 = new A.RgbColorModelHex() { Val = "4472C4" };

            accent1Color1.Append(rgbColorModelHex16);

            A.Accent2Color accent2Color1 = new A.Accent2Color();
            A.RgbColorModelHex rgbColorModelHex17 = new A.RgbColorModelHex() { Val = "ED7D31" };

            accent2Color1.Append(rgbColorModelHex17);

            A.Accent3Color accent3Color1 = new A.Accent3Color();
            A.RgbColorModelHex rgbColorModelHex18 = new A.RgbColorModelHex() { Val = "A5A5A5" };

            accent3Color1.Append(rgbColorModelHex18);

            A.Accent4Color accent4Color1 = new A.Accent4Color();
            A.RgbColorModelHex rgbColorModelHex19 = new A.RgbColorModelHex() { Val = "FFC000" };

            accent4Color1.Append(rgbColorModelHex19);

            A.Accent5Color accent5Color1 = new A.Accent5Color();
            A.RgbColorModelHex rgbColorModelHex20 = new A.RgbColorModelHex() { Val = "5B9BD5" };

            accent5Color1.Append(rgbColorModelHex20);

            A.Accent6Color accent6Color1 = new A.Accent6Color();
            A.RgbColorModelHex rgbColorModelHex21 = new A.RgbColorModelHex() { Val = "70AD47" };

            accent6Color1.Append(rgbColorModelHex21);

            A.Hyperlink hyperlink1 = new A.Hyperlink();
            A.RgbColorModelHex rgbColorModelHex22 = new A.RgbColorModelHex() { Val = "0563C1" };

            hyperlink1.Append(rgbColorModelHex22);

            A.FollowedHyperlinkColor followedHyperlinkColor1 = new A.FollowedHyperlinkColor();
            A.RgbColorModelHex rgbColorModelHex23 = new A.RgbColorModelHex() { Val = "954F72" };

            followedHyperlinkColor1.Append(rgbColorModelHex23);

            colorScheme1.Append(dark1Color1);
            colorScheme1.Append(light1Color1);
            colorScheme1.Append(dark2Color1);
            colorScheme1.Append(light2Color1);
            colorScheme1.Append(accent1Color1);
            colorScheme1.Append(accent2Color1);
            colorScheme1.Append(accent3Color1);
            colorScheme1.Append(accent4Color1);
            colorScheme1.Append(accent5Color1);
            colorScheme1.Append(accent6Color1);
            colorScheme1.Append(hyperlink1);
            colorScheme1.Append(followedHyperlinkColor1);

            A.FontScheme fontScheme3 = new A.FontScheme() { Name = "Office" };

            A.MajorFont majorFont1 = new A.MajorFont();
            A.LatinFont latinFont13 = new A.LatinFont() { Typeface = "Calibri Light", Panose = "020F0302020204030204" };
            A.EastAsianFont eastAsianFont13 = new A.EastAsianFont() { Typeface = "" };
            A.ComplexScriptFont complexScriptFont13 = new A.ComplexScriptFont() { Typeface = "" };
            A.SupplementalFont supplementalFont1 = new A.SupplementalFont() { Script = "Jpan", Typeface = "游ゴシック Light" };
            A.SupplementalFont supplementalFont2 = new A.SupplementalFont() { Script = "Hang", Typeface = "맑은 고딕" };
            A.SupplementalFont supplementalFont3 = new A.SupplementalFont() { Script = "Hans", Typeface = "等线 Light" };
            A.SupplementalFont supplementalFont4 = new A.SupplementalFont() { Script = "Hant", Typeface = "新細明體" };
            A.SupplementalFont supplementalFont5 = new A.SupplementalFont() { Script = "Arab", Typeface = "Times New Roman" };
            A.SupplementalFont supplementalFont6 = new A.SupplementalFont() { Script = "Hebr", Typeface = "Times New Roman" };
            A.SupplementalFont supplementalFont7 = new A.SupplementalFont() { Script = "Thai", Typeface = "Tahoma" };
            A.SupplementalFont supplementalFont8 = new A.SupplementalFont() { Script = "Ethi", Typeface = "Nyala" };
            A.SupplementalFont supplementalFont9 = new A.SupplementalFont() { Script = "Beng", Typeface = "Vrinda" };
            A.SupplementalFont supplementalFont10 = new A.SupplementalFont() { Script = "Gujr", Typeface = "Shruti" };
            A.SupplementalFont supplementalFont11 = new A.SupplementalFont() { Script = "Khmr", Typeface = "MoolBoran" };
            A.SupplementalFont supplementalFont12 = new A.SupplementalFont() { Script = "Knda", Typeface = "Tunga" };
            A.SupplementalFont supplementalFont13 = new A.SupplementalFont() { Script = "Guru", Typeface = "Raavi" };
            A.SupplementalFont supplementalFont14 = new A.SupplementalFont() { Script = "Cans", Typeface = "Euphemia" };
            A.SupplementalFont supplementalFont15 = new A.SupplementalFont() { Script = "Cher", Typeface = "Plantagenet Cherokee" };
            A.SupplementalFont supplementalFont16 = new A.SupplementalFont() { Script = "Yiii", Typeface = "Microsoft Yi Baiti" };
            A.SupplementalFont supplementalFont17 = new A.SupplementalFont() { Script = "Tibt", Typeface = "Microsoft Himalaya" };
            A.SupplementalFont supplementalFont18 = new A.SupplementalFont() { Script = "Thaa", Typeface = "MV Boli" };
            A.SupplementalFont supplementalFont19 = new A.SupplementalFont() { Script = "Deva", Typeface = "Mangal" };
            A.SupplementalFont supplementalFont20 = new A.SupplementalFont() { Script = "Telu", Typeface = "Gautami" };
            A.SupplementalFont supplementalFont21 = new A.SupplementalFont() { Script = "Taml", Typeface = "Latha" };
            A.SupplementalFont supplementalFont22 = new A.SupplementalFont() { Script = "Syrc", Typeface = "Estrangelo Edessa" };
            A.SupplementalFont supplementalFont23 = new A.SupplementalFont() { Script = "Orya", Typeface = "Kalinga" };
            A.SupplementalFont supplementalFont24 = new A.SupplementalFont() { Script = "Mlym", Typeface = "Kartika" };
            A.SupplementalFont supplementalFont25 = new A.SupplementalFont() { Script = "Laoo", Typeface = "DokChampa" };
            A.SupplementalFont supplementalFont26 = new A.SupplementalFont() { Script = "Sinh", Typeface = "Iskoola Pota" };
            A.SupplementalFont supplementalFont27 = new A.SupplementalFont() { Script = "Mong", Typeface = "Mongolian Baiti" };
            A.SupplementalFont supplementalFont28 = new A.SupplementalFont() { Script = "Viet", Typeface = "Times New Roman" };
            A.SupplementalFont supplementalFont29 = new A.SupplementalFont() { Script = "Uigh", Typeface = "Microsoft Uighur" };
            A.SupplementalFont supplementalFont30 = new A.SupplementalFont() { Script = "Geor", Typeface = "Sylfaen" };
            A.SupplementalFont supplementalFont31 = new A.SupplementalFont() { Script = "Armn", Typeface = "Arial" };
            A.SupplementalFont supplementalFont32 = new A.SupplementalFont() { Script = "Bugi", Typeface = "Leelawadee UI" };
            A.SupplementalFont supplementalFont33 = new A.SupplementalFont() { Script = "Bopo", Typeface = "Microsoft JhengHei" };
            A.SupplementalFont supplementalFont34 = new A.SupplementalFont() { Script = "Java", Typeface = "Javanese Text" };
            A.SupplementalFont supplementalFont35 = new A.SupplementalFont() { Script = "Lisu", Typeface = "Segoe UI" };
            A.SupplementalFont supplementalFont36 = new A.SupplementalFont() { Script = "Mymr", Typeface = "Myanmar Text" };
            A.SupplementalFont supplementalFont37 = new A.SupplementalFont() { Script = "Nkoo", Typeface = "Ebrima" };
            A.SupplementalFont supplementalFont38 = new A.SupplementalFont() { Script = "Olck", Typeface = "Nirmala UI" };
            A.SupplementalFont supplementalFont39 = new A.SupplementalFont() { Script = "Osma", Typeface = "Ebrima" };
            A.SupplementalFont supplementalFont40 = new A.SupplementalFont() { Script = "Phag", Typeface = "Phagspa" };
            A.SupplementalFont supplementalFont41 = new A.SupplementalFont() { Script = "Syrn", Typeface = "Estrangelo Edessa" };
            A.SupplementalFont supplementalFont42 = new A.SupplementalFont() { Script = "Syrj", Typeface = "Estrangelo Edessa" };
            A.SupplementalFont supplementalFont43 = new A.SupplementalFont() { Script = "Syre", Typeface = "Estrangelo Edessa" };
            A.SupplementalFont supplementalFont44 = new A.SupplementalFont() { Script = "Sora", Typeface = "Nirmala UI" };
            A.SupplementalFont supplementalFont45 = new A.SupplementalFont() { Script = "Tale", Typeface = "Microsoft Tai Le" };
            A.SupplementalFont supplementalFont46 = new A.SupplementalFont() { Script = "Talu", Typeface = "Microsoft New Tai Lue" };
            A.SupplementalFont supplementalFont47 = new A.SupplementalFont() { Script = "Tfng", Typeface = "Ebrima" };

            majorFont1.Append(latinFont13);
            majorFont1.Append(eastAsianFont13);
            majorFont1.Append(complexScriptFont13);
            majorFont1.Append(supplementalFont1);
            majorFont1.Append(supplementalFont2);
            majorFont1.Append(supplementalFont3);
            majorFont1.Append(supplementalFont4);
            majorFont1.Append(supplementalFont5);
            majorFont1.Append(supplementalFont6);
            majorFont1.Append(supplementalFont7);
            majorFont1.Append(supplementalFont8);
            majorFont1.Append(supplementalFont9);
            majorFont1.Append(supplementalFont10);
            majorFont1.Append(supplementalFont11);
            majorFont1.Append(supplementalFont12);
            majorFont1.Append(supplementalFont13);
            majorFont1.Append(supplementalFont14);
            majorFont1.Append(supplementalFont15);
            majorFont1.Append(supplementalFont16);
            majorFont1.Append(supplementalFont17);
            majorFont1.Append(supplementalFont18);
            majorFont1.Append(supplementalFont19);
            majorFont1.Append(supplementalFont20);
            majorFont1.Append(supplementalFont21);
            majorFont1.Append(supplementalFont22);
            majorFont1.Append(supplementalFont23);
            majorFont1.Append(supplementalFont24);
            majorFont1.Append(supplementalFont25);
            majorFont1.Append(supplementalFont26);
            majorFont1.Append(supplementalFont27);
            majorFont1.Append(supplementalFont28);
            majorFont1.Append(supplementalFont29);
            majorFont1.Append(supplementalFont30);
            majorFont1.Append(supplementalFont31);
            majorFont1.Append(supplementalFont32);
            majorFont1.Append(supplementalFont33);
            majorFont1.Append(supplementalFont34);
            majorFont1.Append(supplementalFont35);
            majorFont1.Append(supplementalFont36);
            majorFont1.Append(supplementalFont37);
            majorFont1.Append(supplementalFont38);
            majorFont1.Append(supplementalFont39);
            majorFont1.Append(supplementalFont40);
            majorFont1.Append(supplementalFont41);
            majorFont1.Append(supplementalFont42);
            majorFont1.Append(supplementalFont43);
            majorFont1.Append(supplementalFont44);
            majorFont1.Append(supplementalFont45);
            majorFont1.Append(supplementalFont46);
            majorFont1.Append(supplementalFont47);

            A.MinorFont minorFont1 = new A.MinorFont();
            A.LatinFont latinFont14 = new A.LatinFont() { Typeface = "Calibri", Panose = "020F0502020204030204" };
            A.EastAsianFont eastAsianFont14 = new A.EastAsianFont() { Typeface = "" };
            A.ComplexScriptFont complexScriptFont14 = new A.ComplexScriptFont() { Typeface = "" };
            A.SupplementalFont supplementalFont48 = new A.SupplementalFont() { Script = "Jpan", Typeface = "游ゴシック" };
            A.SupplementalFont supplementalFont49 = new A.SupplementalFont() { Script = "Hang", Typeface = "맑은 고딕" };
            A.SupplementalFont supplementalFont50 = new A.SupplementalFont() { Script = "Hans", Typeface = "等线" };
            A.SupplementalFont supplementalFont51 = new A.SupplementalFont() { Script = "Hant", Typeface = "新細明體" };
            A.SupplementalFont supplementalFont52 = new A.SupplementalFont() { Script = "Arab", Typeface = "Arial" };
            A.SupplementalFont supplementalFont53 = new A.SupplementalFont() { Script = "Hebr", Typeface = "Arial" };
            A.SupplementalFont supplementalFont54 = new A.SupplementalFont() { Script = "Thai", Typeface = "Tahoma" };
            A.SupplementalFont supplementalFont55 = new A.SupplementalFont() { Script = "Ethi", Typeface = "Nyala" };
            A.SupplementalFont supplementalFont56 = new A.SupplementalFont() { Script = "Beng", Typeface = "Vrinda" };
            A.SupplementalFont supplementalFont57 = new A.SupplementalFont() { Script = "Gujr", Typeface = "Shruti" };
            A.SupplementalFont supplementalFont58 = new A.SupplementalFont() { Script = "Khmr", Typeface = "DaunPenh" };
            A.SupplementalFont supplementalFont59 = new A.SupplementalFont() { Script = "Knda", Typeface = "Tunga" };
            A.SupplementalFont supplementalFont60 = new A.SupplementalFont() { Script = "Guru", Typeface = "Raavi" };
            A.SupplementalFont supplementalFont61 = new A.SupplementalFont() { Script = "Cans", Typeface = "Euphemia" };
            A.SupplementalFont supplementalFont62 = new A.SupplementalFont() { Script = "Cher", Typeface = "Plantagenet Cherokee" };
            A.SupplementalFont supplementalFont63 = new A.SupplementalFont() { Script = "Yiii", Typeface = "Microsoft Yi Baiti" };
            A.SupplementalFont supplementalFont64 = new A.SupplementalFont() { Script = "Tibt", Typeface = "Microsoft Himalaya" };
            A.SupplementalFont supplementalFont65 = new A.SupplementalFont() { Script = "Thaa", Typeface = "MV Boli" };
            A.SupplementalFont supplementalFont66 = new A.SupplementalFont() { Script = "Deva", Typeface = "Mangal" };
            A.SupplementalFont supplementalFont67 = new A.SupplementalFont() { Script = "Telu", Typeface = "Gautami" };
            A.SupplementalFont supplementalFont68 = new A.SupplementalFont() { Script = "Taml", Typeface = "Latha" };
            A.SupplementalFont supplementalFont69 = new A.SupplementalFont() { Script = "Syrc", Typeface = "Estrangelo Edessa" };
            A.SupplementalFont supplementalFont70 = new A.SupplementalFont() { Script = "Orya", Typeface = "Kalinga" };
            A.SupplementalFont supplementalFont71 = new A.SupplementalFont() { Script = "Mlym", Typeface = "Kartika" };
            A.SupplementalFont supplementalFont72 = new A.SupplementalFont() { Script = "Laoo", Typeface = "DokChampa" };
            A.SupplementalFont supplementalFont73 = new A.SupplementalFont() { Script = "Sinh", Typeface = "Iskoola Pota" };
            A.SupplementalFont supplementalFont74 = new A.SupplementalFont() { Script = "Mong", Typeface = "Mongolian Baiti" };
            A.SupplementalFont supplementalFont75 = new A.SupplementalFont() { Script = "Viet", Typeface = "Arial" };
            A.SupplementalFont supplementalFont76 = new A.SupplementalFont() { Script = "Uigh", Typeface = "Microsoft Uighur" };
            A.SupplementalFont supplementalFont77 = new A.SupplementalFont() { Script = "Geor", Typeface = "Sylfaen" };
            A.SupplementalFont supplementalFont78 = new A.SupplementalFont() { Script = "Armn", Typeface = "Arial" };
            A.SupplementalFont supplementalFont79 = new A.SupplementalFont() { Script = "Bugi", Typeface = "Leelawadee UI" };
            A.SupplementalFont supplementalFont80 = new A.SupplementalFont() { Script = "Bopo", Typeface = "Microsoft JhengHei" };
            A.SupplementalFont supplementalFont81 = new A.SupplementalFont() { Script = "Java", Typeface = "Javanese Text" };
            A.SupplementalFont supplementalFont82 = new A.SupplementalFont() { Script = "Lisu", Typeface = "Segoe UI" };
            A.SupplementalFont supplementalFont83 = new A.SupplementalFont() { Script = "Mymr", Typeface = "Myanmar Text" };
            A.SupplementalFont supplementalFont84 = new A.SupplementalFont() { Script = "Nkoo", Typeface = "Ebrima" };
            A.SupplementalFont supplementalFont85 = new A.SupplementalFont() { Script = "Olck", Typeface = "Nirmala UI" };
            A.SupplementalFont supplementalFont86 = new A.SupplementalFont() { Script = "Osma", Typeface = "Ebrima" };
            A.SupplementalFont supplementalFont87 = new A.SupplementalFont() { Script = "Phag", Typeface = "Phagspa" };
            A.SupplementalFont supplementalFont88 = new A.SupplementalFont() { Script = "Syrn", Typeface = "Estrangelo Edessa" };
            A.SupplementalFont supplementalFont89 = new A.SupplementalFont() { Script = "Syrj", Typeface = "Estrangelo Edessa" };
            A.SupplementalFont supplementalFont90 = new A.SupplementalFont() { Script = "Syre", Typeface = "Estrangelo Edessa" };
            A.SupplementalFont supplementalFont91 = new A.SupplementalFont() { Script = "Sora", Typeface = "Nirmala UI" };
            A.SupplementalFont supplementalFont92 = new A.SupplementalFont() { Script = "Tale", Typeface = "Microsoft Tai Le" };
            A.SupplementalFont supplementalFont93 = new A.SupplementalFont() { Script = "Talu", Typeface = "Microsoft New Tai Lue" };
            A.SupplementalFont supplementalFont94 = new A.SupplementalFont() { Script = "Tfng", Typeface = "Ebrima" };

            minorFont1.Append(latinFont14);
            minorFont1.Append(eastAsianFont14);
            minorFont1.Append(complexScriptFont14);
            minorFont1.Append(supplementalFont48);
            minorFont1.Append(supplementalFont49);
            minorFont1.Append(supplementalFont50);
            minorFont1.Append(supplementalFont51);
            minorFont1.Append(supplementalFont52);
            minorFont1.Append(supplementalFont53);
            minorFont1.Append(supplementalFont54);
            minorFont1.Append(supplementalFont55);
            minorFont1.Append(supplementalFont56);
            minorFont1.Append(supplementalFont57);
            minorFont1.Append(supplementalFont58);
            minorFont1.Append(supplementalFont59);
            minorFont1.Append(supplementalFont60);
            minorFont1.Append(supplementalFont61);
            minorFont1.Append(supplementalFont62);
            minorFont1.Append(supplementalFont63);
            minorFont1.Append(supplementalFont64);
            minorFont1.Append(supplementalFont65);
            minorFont1.Append(supplementalFont66);
            minorFont1.Append(supplementalFont67);
            minorFont1.Append(supplementalFont68);
            minorFont1.Append(supplementalFont69);
            minorFont1.Append(supplementalFont70);
            minorFont1.Append(supplementalFont71);
            minorFont1.Append(supplementalFont72);
            minorFont1.Append(supplementalFont73);
            minorFont1.Append(supplementalFont74);
            minorFont1.Append(supplementalFont75);
            minorFont1.Append(supplementalFont76);
            minorFont1.Append(supplementalFont77);
            minorFont1.Append(supplementalFont78);
            minorFont1.Append(supplementalFont79);
            minorFont1.Append(supplementalFont80);
            minorFont1.Append(supplementalFont81);
            minorFont1.Append(supplementalFont82);
            minorFont1.Append(supplementalFont83);
            minorFont1.Append(supplementalFont84);
            minorFont1.Append(supplementalFont85);
            minorFont1.Append(supplementalFont86);
            minorFont1.Append(supplementalFont87);
            minorFont1.Append(supplementalFont88);
            minorFont1.Append(supplementalFont89);
            minorFont1.Append(supplementalFont90);
            minorFont1.Append(supplementalFont91);
            minorFont1.Append(supplementalFont92);
            minorFont1.Append(supplementalFont93);
            minorFont1.Append(supplementalFont94);

            fontScheme3.Append(majorFont1);
            fontScheme3.Append(minorFont1);

            A.FormatScheme formatScheme1 = new A.FormatScheme() { Name = "Office" };

            A.FillStyleList fillStyleList1 = new A.FillStyleList();

            A.SolidFill solidFill45 = new A.SolidFill();
            A.SchemeColor schemeColor65 = new A.SchemeColor() { Val = A.SchemeColorValues.PhColor };

            solidFill45.Append(schemeColor65);

            A.GradientFill gradientFill1 = new A.GradientFill() { RotateWithShape = true };

            A.GradientStopList gradientStopList1 = new A.GradientStopList();

            A.GradientStop gradientStop1 = new A.GradientStop() { Position = 0 };

            A.SchemeColor schemeColor66 = new A.SchemeColor() { Val = A.SchemeColorValues.PhColor };
            A.LuminanceModulation luminanceModulation29 = new A.LuminanceModulation() { Val = 110000 };
            A.SaturationModulation saturationModulation1 = new A.SaturationModulation() { Val = 105000 };
            A.Tint tint1 = new A.Tint() { Val = 67000 };

            schemeColor66.Append(luminanceModulation29);
            schemeColor66.Append(saturationModulation1);
            schemeColor66.Append(tint1);

            gradientStop1.Append(schemeColor66);

            A.GradientStop gradientStop2 = new A.GradientStop() { Position = 50000 };

            A.SchemeColor schemeColor67 = new A.SchemeColor() { Val = A.SchemeColorValues.PhColor };
            A.LuminanceModulation luminanceModulation30 = new A.LuminanceModulation() { Val = 105000 };
            A.SaturationModulation saturationModulation2 = new A.SaturationModulation() { Val = 103000 };
            A.Tint tint2 = new A.Tint() { Val = 73000 };

            schemeColor67.Append(luminanceModulation30);
            schemeColor67.Append(saturationModulation2);
            schemeColor67.Append(tint2);

            gradientStop2.Append(schemeColor67);

            A.GradientStop gradientStop3 = new A.GradientStop() { Position = 100000 };

            A.SchemeColor schemeColor68 = new A.SchemeColor() { Val = A.SchemeColorValues.PhColor };
            A.LuminanceModulation luminanceModulation31 = new A.LuminanceModulation() { Val = 105000 };
            A.SaturationModulation saturationModulation3 = new A.SaturationModulation() { Val = 109000 };
            A.Tint tint3 = new A.Tint() { Val = 81000 };

            schemeColor68.Append(luminanceModulation31);
            schemeColor68.Append(saturationModulation3);
            schemeColor68.Append(tint3);

            gradientStop3.Append(schemeColor68);

            gradientStopList1.Append(gradientStop1);
            gradientStopList1.Append(gradientStop2);
            gradientStopList1.Append(gradientStop3);
            A.LinearGradientFill linearGradientFill1 = new A.LinearGradientFill() { Angle = 5400000, Scaled = false };

            gradientFill1.Append(gradientStopList1);
            gradientFill1.Append(linearGradientFill1);

            A.GradientFill gradientFill2 = new A.GradientFill() { RotateWithShape = true };

            A.GradientStopList gradientStopList2 = new A.GradientStopList();

            A.GradientStop gradientStop4 = new A.GradientStop() { Position = 0 };

            A.SchemeColor schemeColor69 = new A.SchemeColor() { Val = A.SchemeColorValues.PhColor };
            A.SaturationModulation saturationModulation4 = new A.SaturationModulation() { Val = 103000 };
            A.LuminanceModulation luminanceModulation32 = new A.LuminanceModulation() { Val = 102000 };
            A.Tint tint4 = new A.Tint() { Val = 94000 };

            schemeColor69.Append(saturationModulation4);
            schemeColor69.Append(luminanceModulation32);
            schemeColor69.Append(tint4);

            gradientStop4.Append(schemeColor69);

            A.GradientStop gradientStop5 = new A.GradientStop() { Position = 50000 };

            A.SchemeColor schemeColor70 = new A.SchemeColor() { Val = A.SchemeColorValues.PhColor };
            A.SaturationModulation saturationModulation5 = new A.SaturationModulation() { Val = 110000 };
            A.LuminanceModulation luminanceModulation33 = new A.LuminanceModulation() { Val = 100000 };
            A.Shade shade1 = new A.Shade() { Val = 100000 };

            schemeColor70.Append(saturationModulation5);
            schemeColor70.Append(luminanceModulation33);
            schemeColor70.Append(shade1);

            gradientStop5.Append(schemeColor70);

            A.GradientStop gradientStop6 = new A.GradientStop() { Position = 100000 };

            A.SchemeColor schemeColor71 = new A.SchemeColor() { Val = A.SchemeColorValues.PhColor };
            A.LuminanceModulation luminanceModulation34 = new A.LuminanceModulation() { Val = 99000 };
            A.SaturationModulation saturationModulation6 = new A.SaturationModulation() { Val = 120000 };
            A.Shade shade2 = new A.Shade() { Val = 78000 };

            schemeColor71.Append(luminanceModulation34);
            schemeColor71.Append(saturationModulation6);
            schemeColor71.Append(shade2);

            gradientStop6.Append(schemeColor71);

            gradientStopList2.Append(gradientStop4);
            gradientStopList2.Append(gradientStop5);
            gradientStopList2.Append(gradientStop6);
            A.LinearGradientFill linearGradientFill2 = new A.LinearGradientFill() { Angle = 5400000, Scaled = false };

            gradientFill2.Append(gradientStopList2);
            gradientFill2.Append(linearGradientFill2);

            fillStyleList1.Append(solidFill45);
            fillStyleList1.Append(gradientFill1);
            fillStyleList1.Append(gradientFill2);

            A.LineStyleList lineStyleList1 = new A.LineStyleList();

            A.Outline outline32 = new A.Outline() { Width = 6350, CapType = A.LineCapValues.Flat, CompoundLineType = A.CompoundLineValues.Single, Alignment = A.PenAlignmentValues.Center };

            A.SolidFill solidFill46 = new A.SolidFill();
            A.SchemeColor schemeColor72 = new A.SchemeColor() { Val = A.SchemeColorValues.PhColor };

            solidFill46.Append(schemeColor72);
            A.PresetDash presetDash5 = new A.PresetDash() { Val = A.PresetLineDashValues.Solid };
            A.Miter miter1 = new A.Miter() { Limit = 800000 };

            outline32.Append(solidFill46);
            outline32.Append(presetDash5);
            outline32.Append(miter1);

            A.Outline outline33 = new A.Outline() { Width = 12700, CapType = A.LineCapValues.Flat, CompoundLineType = A.CompoundLineValues.Single, Alignment = A.PenAlignmentValues.Center };

            A.SolidFill solidFill47 = new A.SolidFill();
            A.SchemeColor schemeColor73 = new A.SchemeColor() { Val = A.SchemeColorValues.PhColor };

            solidFill47.Append(schemeColor73);
            A.PresetDash presetDash6 = new A.PresetDash() { Val = A.PresetLineDashValues.Solid };
            A.Miter miter2 = new A.Miter() { Limit = 800000 };

            outline33.Append(solidFill47);
            outline33.Append(presetDash6);
            outline33.Append(miter2);

            A.Outline outline34 = new A.Outline() { Width = 19050, CapType = A.LineCapValues.Flat, CompoundLineType = A.CompoundLineValues.Single, Alignment = A.PenAlignmentValues.Center };

            A.SolidFill solidFill48 = new A.SolidFill();
            A.SchemeColor schemeColor74 = new A.SchemeColor() { Val = A.SchemeColorValues.PhColor };

            solidFill48.Append(schemeColor74);
            A.PresetDash presetDash7 = new A.PresetDash() { Val = A.PresetLineDashValues.Solid };
            A.Miter miter3 = new A.Miter() { Limit = 800000 };

            outline34.Append(solidFill48);
            outline34.Append(presetDash7);
            outline34.Append(miter3);

            lineStyleList1.Append(outline32);
            lineStyleList1.Append(outline33);
            lineStyleList1.Append(outline34);

            A.EffectStyleList effectStyleList1 = new A.EffectStyleList();

            A.EffectStyle effectStyle1 = new A.EffectStyle();
            A.EffectList effectList14 = new A.EffectList();

            effectStyle1.Append(effectList14);

            A.EffectStyle effectStyle2 = new A.EffectStyle();
            A.EffectList effectList15 = new A.EffectList();

            effectStyle2.Append(effectList15);

            A.EffectStyle effectStyle3 = new A.EffectStyle();

            A.EffectList effectList16 = new A.EffectList();

            A.OuterShadow outerShadow1 = new A.OuterShadow() { BlurRadius = 57150L, Distance = 19050L, Direction = 5400000, Alignment = A.RectangleAlignmentValues.Center, RotateWithShape = false };

            A.RgbColorModelHex rgbColorModelHex24 = new A.RgbColorModelHex() { Val = "000000" };
            A.Alpha alpha1 = new A.Alpha() { Val = 63000 };

            rgbColorModelHex24.Append(alpha1);

            outerShadow1.Append(rgbColorModelHex24);

            effectList16.Append(outerShadow1);

            effectStyle3.Append(effectList16);

            effectStyleList1.Append(effectStyle1);
            effectStyleList1.Append(effectStyle2);
            effectStyleList1.Append(effectStyle3);

            A.BackgroundFillStyleList backgroundFillStyleList1 = new A.BackgroundFillStyleList();

            A.SolidFill solidFill49 = new A.SolidFill();
            A.SchemeColor schemeColor75 = new A.SchemeColor() { Val = A.SchemeColorValues.PhColor };

            solidFill49.Append(schemeColor75);

            A.SolidFill solidFill50 = new A.SolidFill();

            A.SchemeColor schemeColor76 = new A.SchemeColor() { Val = A.SchemeColorValues.PhColor };
            A.Tint tint5 = new A.Tint() { Val = 95000 };
            A.SaturationModulation saturationModulation7 = new A.SaturationModulation() { Val = 170000 };

            schemeColor76.Append(tint5);
            schemeColor76.Append(saturationModulation7);

            solidFill50.Append(schemeColor76);

            A.GradientFill gradientFill3 = new A.GradientFill() { RotateWithShape = true };

            A.GradientStopList gradientStopList3 = new A.GradientStopList();

            A.GradientStop gradientStop7 = new A.GradientStop() { Position = 0 };

            A.SchemeColor schemeColor77 = new A.SchemeColor() { Val = A.SchemeColorValues.PhColor };
            A.Tint tint6 = new A.Tint() { Val = 93000 };
            A.SaturationModulation saturationModulation8 = new A.SaturationModulation() { Val = 150000 };
            A.Shade shade3 = new A.Shade() { Val = 98000 };
            A.LuminanceModulation luminanceModulation35 = new A.LuminanceModulation() { Val = 102000 };

            schemeColor77.Append(tint6);
            schemeColor77.Append(saturationModulation8);
            schemeColor77.Append(shade3);
            schemeColor77.Append(luminanceModulation35);

            gradientStop7.Append(schemeColor77);

            A.GradientStop gradientStop8 = new A.GradientStop() { Position = 50000 };

            A.SchemeColor schemeColor78 = new A.SchemeColor() { Val = A.SchemeColorValues.PhColor };
            A.Tint tint7 = new A.Tint() { Val = 98000 };
            A.SaturationModulation saturationModulation9 = new A.SaturationModulation() { Val = 130000 };
            A.Shade shade4 = new A.Shade() { Val = 90000 };
            A.LuminanceModulation luminanceModulation36 = new A.LuminanceModulation() { Val = 103000 };

            schemeColor78.Append(tint7);
            schemeColor78.Append(saturationModulation9);
            schemeColor78.Append(shade4);
            schemeColor78.Append(luminanceModulation36);

            gradientStop8.Append(schemeColor78);

            A.GradientStop gradientStop9 = new A.GradientStop() { Position = 100000 };

            A.SchemeColor schemeColor79 = new A.SchemeColor() { Val = A.SchemeColorValues.PhColor };
            A.Shade shade5 = new A.Shade() { Val = 63000 };
            A.SaturationModulation saturationModulation10 = new A.SaturationModulation() { Val = 120000 };

            schemeColor79.Append(shade5);
            schemeColor79.Append(saturationModulation10);

            gradientStop9.Append(schemeColor79);

            gradientStopList3.Append(gradientStop7);
            gradientStopList3.Append(gradientStop8);
            gradientStopList3.Append(gradientStop9);
            A.LinearGradientFill linearGradientFill3 = new A.LinearGradientFill() { Angle = 5400000, Scaled = false };

            gradientFill3.Append(gradientStopList3);
            gradientFill3.Append(linearGradientFill3);

            backgroundFillStyleList1.Append(solidFill49);
            backgroundFillStyleList1.Append(solidFill50);
            backgroundFillStyleList1.Append(gradientFill3);

            formatScheme1.Append(fillStyleList1);
            formatScheme1.Append(lineStyleList1);
            formatScheme1.Append(effectStyleList1);
            formatScheme1.Append(backgroundFillStyleList1);

            themeElements1.Append(colorScheme1);
            themeElements1.Append(fontScheme3);
            themeElements1.Append(formatScheme1);
            A.ObjectDefaults objectDefaults1 = new A.ObjectDefaults();
            A.ExtraColorSchemeList extraColorSchemeList1 = new A.ExtraColorSchemeList();

            A.OfficeStyleSheetExtensionList officeStyleSheetExtensionList1 = new A.OfficeStyleSheetExtensionList();

            A.OfficeStyleSheetExtension officeStyleSheetExtension1 = new A.OfficeStyleSheetExtension() { Uri = "{05A4C25C-085E-4340-85A3-A5531E510DB2}" };

            Thm15.ThemeFamily themeFamily1 = new Thm15.ThemeFamily() { Name = "Office Theme", Id = "{62F939B6-93AF-4DB8-9C6B-D6C7DFDC589F}", Vid = "{4A3C46E8-61CC-4603-A589-7422A47A8E4A}" };
            themeFamily1.AddNamespaceDeclaration("thm15", "http://schemas.microsoft.com/office/thememl/2012/main");

            officeStyleSheetExtension1.Append(themeFamily1);

            officeStyleSheetExtensionList1.Append(officeStyleSheetExtension1);

            theme1.Append(themeElements1);
            theme1.Append(objectDefaults1);
            theme1.Append(extraColorSchemeList1);
            theme1.Append(officeStyleSheetExtensionList1);

            themePart1.Theme = theme1;
        }

        public void GenerateWorkbookPart1Content(WorkbookPart workbookPart1)
        {
            Workbook workbook1 = new Workbook() { MCAttributes = new MarkupCompatibilityAttributes() { Ignorable = "x15 xr xr6 xr10 xr2" } };
            workbook1.AddNamespaceDeclaration("r", "http://schemas.openxmlformats.org/officeDocument/2006/relationships");
            workbook1.AddNamespaceDeclaration("mc", "http://schemas.openxmlformats.org/markup-compatibility/2006");
            workbook1.AddNamespaceDeclaration("x15", "http://schemas.microsoft.com/office/spreadsheetml/2010/11/main");
            workbook1.AddNamespaceDeclaration("xr", "http://schemas.microsoft.com/office/spreadsheetml/2014/revision");
            workbook1.AddNamespaceDeclaration("xr6", "http://schemas.microsoft.com/office/spreadsheetml/2016/revision6");
            workbook1.AddNamespaceDeclaration("xr10", "http://schemas.microsoft.com/office/spreadsheetml/2016/revision10");
            workbook1.AddNamespaceDeclaration("xr2", "http://schemas.microsoft.com/office/spreadsheetml/2015/revision2");
            FileVersion fileVersion1 = new FileVersion() { ApplicationName = "xl", LastEdited = "7", LowestEdited = "7", BuildVersion = "27531" };
            WorkbookProperties workbookProperties1 = new WorkbookProperties() { DefaultThemeVersion = (UInt32Value)166925U };

            AlternateContent alternateContent1 = new AlternateContent();
            alternateContent1.AddNamespaceDeclaration("mc", "http://schemas.openxmlformats.org/markup-compatibility/2006");

            AlternateContentChoice alternateContentChoice1 = new AlternateContentChoice() { Requires = "x15" };
            alternateContent1.Append(alternateContentChoice1);

            OpenXmlUnknownElement openXmlUnknownElement1 = OpenXmlUnknownElement.CreateOpenXmlUnknownElement("<xr:revisionPtr revIDLastSave=\"3\" documentId=\"8_{769E88BB-BA37-4C82-B55C-93F7D59A9716}\" xr6:coauthVersionLast=\"47\" xr6:coauthVersionMax=\"47\" xr10:uidLastSave=\"{374F97B6-67E8-4A83-AB60-1A028108A151}\" xmlns:xr10=\"http://schemas.microsoft.com/office/spreadsheetml/2016/revision10\" xmlns:xr6=\"http://schemas.microsoft.com/office/spreadsheetml/2016/revision6\" xmlns:xr=\"http://schemas.microsoft.com/office/spreadsheetml/2014/revision\" />");

            BookViews bookViews1 = new BookViews();

            WorkbookView workbookView1 = new WorkbookView() { XWindow = -120, YWindow = -120, WindowWidth = (UInt32Value)29040U, WindowHeight = (UInt32Value)15720U };
            workbookView1.SetAttribute(new OpenXmlAttribute("xr2", "uid", "http://schemas.microsoft.com/office/spreadsheetml/2015/revision2", "{907F27AB-63C2-44BC-A382-26709FD32A45}"));

            bookViews1.Append(workbookView1);

            Sheets sheets1 = new Sheets();
            Sheet sheet1 = new Sheet() { Name = "Gráfico Cumplimiento", SheetId = (UInt32Value)3U, Id = "rId1" };
            Sheet sheet2 = new Sheet() { Name = "HISTORICO", SheetId = (UInt32Value)4U, Id = "rId2" };
            Sheet sheet3 = new Sheet() { Name = "Tabla promedios", SheetId = (UInt32Value)2U, State = SheetStateValues.Hidden, Id = "rId3" };

            sheets1.Append(sheet1);
            sheets1.Append(sheet2);
            sheets1.Append(sheet3);
            CalculationProperties calculationProperties1 = new CalculationProperties() { CalculationId = (UInt32Value)191029U };

            WorkbookExtensionList workbookExtensionList1 = new WorkbookExtensionList();

            WorkbookExtension workbookExtension1 = new WorkbookExtension() { Uri = "{140A7094-0E35-4892-8432-C4D2E57EDEB5}" };
            workbookExtension1.AddNamespaceDeclaration("x15", "http://schemas.microsoft.com/office/spreadsheetml/2010/11/main");
            X15.WorkbookProperties workbookProperties2 = new X15.WorkbookProperties() { ChartTrackingReferenceBase = true };

            workbookExtension1.Append(workbookProperties2);

            workbookExtensionList1.Append(workbookExtension1);

            workbook1.Append(fileVersion1);
            workbook1.Append(workbookProperties1);
            workbook1.Append(alternateContent1);
            workbook1.Append(openXmlUnknownElement1);
            workbook1.Append(bookViews1);
            workbook1.Append(sheets1);
            workbook1.Append(calculationProperties1);
            workbook1.Append(workbookExtensionList1);

            workbookPart1.Workbook = workbook1;

        }

        public void GenerateWorkbookStylesPart1Content(WorkbookStylesPart workbookStylesPart1)
        {
            Stylesheet stylesheet1 = new Stylesheet() { MCAttributes = new MarkupCompatibilityAttributes() { Ignorable = "x14ac x16r2 xr" } };
            stylesheet1.AddNamespaceDeclaration("mc", "http://schemas.openxmlformats.org/markup-compatibility/2006");
            stylesheet1.AddNamespaceDeclaration("x14ac", "http://schemas.microsoft.com/office/spreadsheetml/2009/9/ac");
            stylesheet1.AddNamespaceDeclaration("x16r2", "http://schemas.microsoft.com/office/spreadsheetml/2015/02/main");
            stylesheet1.AddNamespaceDeclaration("xr", "http://schemas.microsoft.com/office/spreadsheetml/2014/revision");

            NumberingFormats numberingFormats1 = new NumberingFormats() { Count = (UInt32Value)1U };
            NumberingFormat numberingFormat3 = new NumberingFormat() { NumberFormatId = (UInt32Value)164U, FormatCode = "0.0" };

            numberingFormats1.Append(numberingFormat3);

            Fonts fonts1 = new Fonts() { Count = (UInt32Value)6U, KnownFonts = true };

            Font font1 = new Font();
            FontSize fontSize1 = new FontSize() { Val = 11D };
            Color color1 = new Color() { Theme = (UInt32Value)1U };
            FontName fontName1 = new FontName() { Val = "Calibri" };
            FontFamilyNumbering fontFamilyNumbering1 = new FontFamilyNumbering() { Val = 2 };
            FontScheme fontScheme1 = new FontScheme() { Val = FontSchemeValues.Minor };

            font1.Append(fontSize1);
            font1.Append(color1);
            font1.Append(fontName1);
            font1.Append(fontFamilyNumbering1);
            font1.Append(fontScheme1);

            Font font2 = new Font();
            FontSize fontSize2 = new FontSize() { Val = 11D };
            Color color2 = new Color() { Theme = (UInt32Value)1U };
            FontName fontName2 = new FontName() { Val = "Calibri" };
            FontFamilyNumbering fontFamilyNumbering2 = new FontFamilyNumbering() { Val = 2 };
            FontScheme fontScheme2 = new FontScheme() { Val = FontSchemeValues.Minor };

            font2.Append(fontSize2);
            font2.Append(color2);
            font2.Append(fontName2);
            font2.Append(fontFamilyNumbering2);
            font2.Append(fontScheme2);

            Font font3 = new Font();
            Bold bold1 = new Bold();
            FontSize fontSize3 = new FontSize() { Val = 10D };
            Color color3 = new Color() { Indexed = (UInt32Value)9U };
            FontName fontName3 = new FontName() { Val = "Open Sans" };

            font3.Append(bold1);
            font3.Append(fontSize3);
            font3.Append(color3);
            font3.Append(fontName3);

            Font font4 = new Font();
            FontSize fontSize4 = new FontSize() { Val = 10D };
            Color color4 = new Color() { Indexed = (UInt32Value)8U };
            FontName fontName4 = new FontName() { Val = "Open Sans" };

            font4.Append(fontSize4);
            font4.Append(color4);
            font4.Append(fontName4);

            Font font5 = new Font();
            FontSize fontSize5 = new FontSize() { Val = 10D };
            FontName fontName5 = new FontName() { Val = "Open Sans" };

            font5.Append(fontSize5);
            font5.Append(fontName5);

            Font font6 = new Font();
            FontSize fontSize6 = new FontSize() { Val = 10D };
            Color color5 = new Color() { Rgb = "FFFF0000" };
            FontName fontName6 = new FontName() { Val = "Open Sans" };

            font6.Append(fontSize6);
            font6.Append(color5);
            font6.Append(fontName6);

            fonts1.Append(font1);
            fonts1.Append(font2);
            fonts1.Append(font3);
            fonts1.Append(font4);
            fonts1.Append(font5);
            fonts1.Append(font6);

            Fills fills1 = new Fills() { Count = (UInt32Value)4U };

            Fill fill1 = new Fill();
            PatternFill patternFill1 = new PatternFill() { PatternType = PatternValues.None };

            fill1.Append(patternFill1);

            Fill fill2 = new Fill();
            PatternFill patternFill2 = new PatternFill() { PatternType = PatternValues.Gray125 };

            fill2.Append(patternFill2);

            Fill fill3 = new Fill();

            PatternFill patternFill3 = new PatternFill() { PatternType = PatternValues.Solid };
            ForegroundColor foregroundColor1 = new ForegroundColor() { Rgb = "FF2559BF" };
            BackgroundColor backgroundColor1 = new BackgroundColor() { Indexed = (UInt32Value)64U };

            patternFill3.Append(foregroundColor1);
            patternFill3.Append(backgroundColor1);

            fill3.Append(patternFill3);

            Fill fill4 = new Fill();

            PatternFill patternFill4 = new PatternFill() { PatternType = PatternValues.Solid };
            ForegroundColor foregroundColor2 = new ForegroundColor() { Rgb = "FFC6E7FE" };
            BackgroundColor backgroundColor2 = new BackgroundColor() { Indexed = (UInt32Value)64U };

            patternFill4.Append(foregroundColor2);
            patternFill4.Append(backgroundColor2);

            fill4.Append(patternFill4);

            fills1.Append(fill1);
            fills1.Append(fill2);
            fills1.Append(fill3);
            fills1.Append(fill4);

            Borders borders1 = new Borders() { Count = (UInt32Value)2U };

            Border border1 = new Border();
            LeftBorder leftBorder1 = new LeftBorder();
            RightBorder rightBorder1 = new RightBorder();
            TopBorder topBorder1 = new TopBorder();
            BottomBorder bottomBorder1 = new BottomBorder();
            DiagonalBorder diagonalBorder1 = new DiagonalBorder();

            border1.Append(leftBorder1);
            border1.Append(rightBorder1);
            border1.Append(topBorder1);
            border1.Append(bottomBorder1);
            border1.Append(diagonalBorder1);

            Border border2 = new Border();

            LeftBorder leftBorder2 = new LeftBorder() { Style = BorderStyleValues.Thin };
            Color color6 = new Color() { Indexed = (UInt32Value)64U };

            leftBorder2.Append(color6);

            RightBorder rightBorder2 = new RightBorder() { Style = BorderStyleValues.Thin };
            Color color7 = new Color() { Indexed = (UInt32Value)64U };

            rightBorder2.Append(color7);

            TopBorder topBorder2 = new TopBorder() { Style = BorderStyleValues.Thin };
            Color color8 = new Color() { Indexed = (UInt32Value)64U };

            topBorder2.Append(color8);

            BottomBorder bottomBorder2 = new BottomBorder() { Style = BorderStyleValues.Thin };
            Color color9 = new Color() { Indexed = (UInt32Value)64U };

            bottomBorder2.Append(color9);
            DiagonalBorder diagonalBorder2 = new DiagonalBorder();

            border2.Append(leftBorder2);
            border2.Append(rightBorder2);
            border2.Append(topBorder2);
            border2.Append(bottomBorder2);
            border2.Append(diagonalBorder2);

            borders1.Append(border1);
            borders1.Append(border2);

            CellStyleFormats cellStyleFormats1 = new CellStyleFormats() { Count = (UInt32Value)2U };
            CellFormat cellFormat1 = new CellFormat() { NumberFormatId = (UInt32Value)0U, FontId = (UInt32Value)0U, FillId = (UInt32Value)0U, BorderId = (UInt32Value)0U };
            CellFormat cellFormat2 = new CellFormat() { NumberFormatId = (UInt32Value)9U, FontId = (UInt32Value)1U, FillId = (UInt32Value)0U, BorderId = (UInt32Value)0U, ApplyFont = false, ApplyFill = false, ApplyBorder = false, ApplyAlignment = false, ApplyProtection = false };

            cellStyleFormats1.Append(cellFormat1);
            cellStyleFormats1.Append(cellFormat2);

            CellFormats cellFormats1 = new CellFormats() { Count = (UInt32Value)19U };
            CellFormat cellFormat3 = new CellFormat() { NumberFormatId = (UInt32Value)0U, FontId = (UInt32Value)0U, FillId = (UInt32Value)0U, BorderId = (UInt32Value)0U, FormatId = (UInt32Value)0U };
            CellFormat cellFormat4 = new CellFormat() { NumberFormatId = (UInt32Value)0U, FontId = (UInt32Value)0U, FillId = (UInt32Value)0U, BorderId = (UInt32Value)0U, FormatId = (UInt32Value)0U, QuotePrefix = true };
            CellFormat cellFormat5 = new CellFormat() { NumberFormatId = (UInt32Value)16U, FontId = (UInt32Value)0U, FillId = (UInt32Value)0U, BorderId = (UInt32Value)0U, FormatId = (UInt32Value)0U, QuotePrefix = true, ApplyNumberFormat = true };
            CellFormat cellFormat6 = new CellFormat() { NumberFormatId = (UInt32Value)9U, FontId = (UInt32Value)0U, FillId = (UInt32Value)0U, BorderId = (UInt32Value)0U, FormatId = (UInt32Value)1U, ApplyFont = true };
            CellFormat cellFormat7 = new CellFormat() { NumberFormatId = (UInt32Value)1U, FontId = (UInt32Value)0U, FillId = (UInt32Value)0U, BorderId = (UInt32Value)0U, FormatId = (UInt32Value)0U, ApplyNumberFormat = true };

            CellFormat cellFormat8 = new CellFormat() { NumberFormatId = (UInt32Value)0U, FontId = (UInt32Value)3U, FillId = (UInt32Value)0U, BorderId = (UInt32Value)1U, FormatId = (UInt32Value)0U, ApplyFont = true, ApplyBorder = true, ApplyAlignment = true };
            Alignment alignment1 = new Alignment() { Horizontal = HorizontalAlignmentValues.Center };

            cellFormat8.Append(alignment1);
            CellFormat cellFormat9 = new CellFormat() { NumberFormatId = (UInt32Value)0U, FontId = (UInt32Value)3U, FillId = (UInt32Value)0U, BorderId = (UInt32Value)1U, FormatId = (UInt32Value)0U, ApplyFont = true, ApplyBorder = true };
            CellFormat cellFormat10 = new CellFormat() { NumberFormatId = (UInt32Value)164U, FontId = (UInt32Value)3U, FillId = (UInt32Value)0U, BorderId = (UInt32Value)1U, FormatId = (UInt32Value)0U, ApplyNumberFormat = true, ApplyFont = true, ApplyBorder = true };
            CellFormat cellFormat11 = new CellFormat() { NumberFormatId = (UInt32Value)0U, FontId = (UInt32Value)5U, FillId = (UInt32Value)0U, BorderId = (UInt32Value)1U, FormatId = (UInt32Value)0U, ApplyFont = true, ApplyBorder = true };

            CellFormat cellFormat12 = new CellFormat() { NumberFormatId = (UInt32Value)0U, FontId = (UInt32Value)5U, FillId = (UInt32Value)0U, BorderId = (UInt32Value)1U, FormatId = (UInt32Value)0U, ApplyFont = true, ApplyBorder = true, ApplyAlignment = true };
            Alignment alignment2 = new Alignment() { WrapText = true };

            cellFormat12.Append(alignment2);
            CellFormat cellFormat13 = new CellFormat() { NumberFormatId = (UInt32Value)14U, FontId = (UInt32Value)4U, FillId = (UInt32Value)0U, BorderId = (UInt32Value)1U, FormatId = (UInt32Value)0U, ApplyNumberFormat = true, ApplyFont = true, ApplyBorder = true };
            CellFormat cellFormat14 = new CellFormat() { NumberFormatId = (UInt32Value)14U, FontId = (UInt32Value)5U, FillId = (UInt32Value)0U, BorderId = (UInt32Value)1U, FormatId = (UInt32Value)0U, ApplyNumberFormat = true, ApplyFont = true, ApplyBorder = true };

            CellFormat cellFormat15 = new CellFormat() { NumberFormatId = (UInt32Value)0U, FontId = (UInt32Value)0U, FillId = (UInt32Value)0U, BorderId = (UInt32Value)0U, FormatId = (UInt32Value)0U, ApplyAlignment = true };
            Alignment alignment3 = new Alignment() { WrapText = true };

            cellFormat15.Append(alignment3);

            CellFormat cellFormat16 = new CellFormat() { NumberFormatId = (UInt32Value)0U, FontId = (UInt32Value)2U, FillId = (UInt32Value)2U, BorderId = (UInt32Value)1U, FormatId = (UInt32Value)0U, ApplyFont = true, ApplyFill = true, ApplyBorder = true, ApplyAlignment = true };
            Alignment alignment4 = new Alignment() { Horizontal = HorizontalAlignmentValues.Center, Vertical = VerticalAlignmentValues.Center, WrapText = true };

            cellFormat16.Append(alignment4);

            CellFormat cellFormat17 = new CellFormat() { NumberFormatId = (UInt32Value)1U, FontId = (UInt32Value)2U, FillId = (UInt32Value)2U, BorderId = (UInt32Value)1U, FormatId = (UInt32Value)0U, ApplyNumberFormat = true, ApplyFont = true, ApplyFill = true, ApplyBorder = true, ApplyAlignment = true };
            Alignment alignment5 = new Alignment() { Horizontal = HorizontalAlignmentValues.Center, Vertical = VerticalAlignmentValues.Center, WrapText = true };

            cellFormat17.Append(alignment5);

            CellFormat cellFormat18 = new CellFormat() { NumberFormatId = (UInt32Value)14U, FontId = (UInt32Value)2U, FillId = (UInt32Value)2U, BorderId = (UInt32Value)1U, FormatId = (UInt32Value)0U, ApplyNumberFormat = true, ApplyFont = true, ApplyFill = true, ApplyBorder = true, ApplyAlignment = true };
            Alignment alignment6 = new Alignment() { Horizontal = HorizontalAlignmentValues.Center, Vertical = VerticalAlignmentValues.Center, WrapText = true };

            cellFormat18.Append(alignment6);

            CellFormat cellFormat19 = new CellFormat() { NumberFormatId = (UInt32Value)164U, FontId = (UInt32Value)2U, FillId = (UInt32Value)2U, BorderId = (UInt32Value)1U, FormatId = (UInt32Value)0U, ApplyNumberFormat = true, ApplyFont = true, ApplyFill = true, ApplyBorder = true, ApplyAlignment = true };
            Alignment alignment7 = new Alignment() { Horizontal = HorizontalAlignmentValues.Center, Vertical = VerticalAlignmentValues.Center, WrapText = true };

            cellFormat19.Append(alignment7);
            CellFormat cellFormat20 = new CellFormat() { NumberFormatId = (UInt32Value)164U, FontId = (UInt32Value)4U, FillId = (UInt32Value)3U, BorderId = (UInt32Value)1U, FormatId = (UInt32Value)0U, ApplyNumberFormat = true, ApplyFont = true, ApplyFill = true, ApplyBorder = true };
            CellFormat cellFormat21 = new CellFormat() { NumberFormatId = (UInt32Value)164U, FontId = (UInt32Value)3U, FillId = (UInt32Value)3U, BorderId = (UInt32Value)1U, FormatId = (UInt32Value)0U, ApplyNumberFormat = true, ApplyFont = true, ApplyFill = true, ApplyBorder = true };

            cellFormats1.Append(cellFormat3);
            cellFormats1.Append(cellFormat4);
            cellFormats1.Append(cellFormat5);
            cellFormats1.Append(cellFormat6);
            cellFormats1.Append(cellFormat7);
            cellFormats1.Append(cellFormat8);
            cellFormats1.Append(cellFormat9);
            cellFormats1.Append(cellFormat10);
            cellFormats1.Append(cellFormat11);
            cellFormats1.Append(cellFormat12);
            cellFormats1.Append(cellFormat13);
            cellFormats1.Append(cellFormat14);
            cellFormats1.Append(cellFormat15);
            cellFormats1.Append(cellFormat16);
            cellFormats1.Append(cellFormat17);
            cellFormats1.Append(cellFormat18);
            cellFormats1.Append(cellFormat19);
            cellFormats1.Append(cellFormat20);
            cellFormats1.Append(cellFormat21);

            CellStyles cellStyles1 = new CellStyles() { Count = (UInt32Value)2U };
            CellStyle cellStyle1 = new CellStyle() { Name = "Normal", FormatId = (UInt32Value)0U, BuiltinId = (UInt32Value)0U };
            CellStyle cellStyle2 = new CellStyle() { Name = "Percent", FormatId = (UInt32Value)1U, BuiltinId = (UInt32Value)5U };

            cellStyles1.Append(cellStyle1);
            cellStyles1.Append(cellStyle2);
            DifferentialFormats differentialFormats1 = new DifferentialFormats() { Count = (UInt32Value)0U };
            TableStyles tableStyles1 = new TableStyles() { Count = (UInt32Value)0U, DefaultTableStyle = "TableStyleMedium2", DefaultPivotStyle = "PivotStyleLight16" };

            Colors colors1 = new Colors();

            MruColors mruColors1 = new MruColors();
            Color color10 = new Color() { Rgb = "FF193A73" };
            Color color11 = new Color() { Rgb = "FF147AA0" };
            Color color12 = new Color() { Rgb = "FF2559BF" };
            Color color13 = new Color() { Rgb = "FF093246" };
            Color color14 = new Color() { Rgb = "FFC6E7FE" };
            Color color15 = new Color() { Rgb = "FFDAE2FF" };

            mruColors1.Append(color10);
            mruColors1.Append(color11);
            mruColors1.Append(color12);
            mruColors1.Append(color13);
            mruColors1.Append(color14);
            mruColors1.Append(color15);

            colors1.Append(mruColors1);

            StylesheetExtensionList stylesheetExtensionList1 = new StylesheetExtensionList();

            StylesheetExtension stylesheetExtension1 = new StylesheetExtension() { Uri = "{EB79DEF2-80B8-43e5-95BD-54CBDDF9020C}" };
            stylesheetExtension1.AddNamespaceDeclaration("x14", "http://schemas.microsoft.com/office/spreadsheetml/2009/9/main");
            X14.SlicerStyles slicerStyles1 = new X14.SlicerStyles() { DefaultSlicerStyle = "SlicerStyleLight1" };

            stylesheetExtension1.Append(slicerStyles1);

            StylesheetExtension stylesheetExtension2 = new StylesheetExtension() { Uri = "{9260A510-F301-46a8-8635-F512D64BE5F5}" };
            stylesheetExtension2.AddNamespaceDeclaration("x15", "http://schemas.microsoft.com/office/spreadsheetml/2010/11/main");
            X15.TimelineStyles timelineStyles1 = new X15.TimelineStyles() { DefaultTimelineStyle = "TimeSlicerStyleLight1" };

            stylesheetExtension2.Append(timelineStyles1);

            stylesheetExtensionList1.Append(stylesheetExtension1);
            stylesheetExtensionList1.Append(stylesheetExtension2);

            stylesheet1.Append(numberingFormats1);
            stylesheet1.Append(fonts1);
            stylesheet1.Append(fills1);
            stylesheet1.Append(borders1);
            stylesheet1.Append(cellStyleFormats1);
            stylesheet1.Append(cellFormats1);
            stylesheet1.Append(cellStyles1);
            stylesheet1.Append(differentialFormats1);
            stylesheet1.Append(tableStyles1);
            stylesheet1.Append(colors1);
            stylesheet1.Append(stylesheetExtensionList1);

            workbookStylesPart1.Stylesheet = stylesheet1;
        }

        public void GenerateWorksheetPart1Content(WorksheetPart worksheetPart1, List<SummaryDTO> summary)
        {
            Worksheet worksheet1 = new Worksheet() { MCAttributes = new MarkupCompatibilityAttributes() { Ignorable = "x14ac xr xr2 xr3" } };
            worksheet1.AddNamespaceDeclaration("r", "http://schemas.openxmlformats.org/officeDocument/2006/relationships");
            worksheet1.AddNamespaceDeclaration("mc", "http://schemas.openxmlformats.org/markup-compatibility/2006");
            worksheet1.AddNamespaceDeclaration("x14ac", "http://schemas.microsoft.com/office/spreadsheetml/2009/9/ac");
            worksheet1.AddNamespaceDeclaration("xr", "http://schemas.microsoft.com/office/spreadsheetml/2014/revision");
            worksheet1.AddNamespaceDeclaration("xr2", "http://schemas.microsoft.com/office/spreadsheetml/2015/revision2");
            worksheet1.AddNamespaceDeclaration("xr3", "http://schemas.microsoft.com/office/spreadsheetml/2016/revision3");
            worksheet1.SetAttribute(new OpenXmlAttribute("xr", "uid", "http://schemas.microsoft.com/office/spreadsheetml/2014/revision", "{1BF885D3-4247-43CD-9DDC-AC4278A81DE1}"));
            SheetDimension sheetDimension1 = new SheetDimension() { Reference = "A1:F14" };

            SheetViews sheetViews1 = new SheetViews();

            SheetView sheetView1 = new SheetView() { WorkbookViewId = (UInt32Value)0U };
            Selection selection1 = new Selection() { ActiveCell = "E14", SequenceOfReferences = new ListValue<StringValue>() { InnerText = "E14" } };

            sheetView1.Append(selection1);

            sheetViews1.Append(sheetView1);
            SheetFormatProperties sheetFormatProperties1 = new SheetFormatProperties() { DefaultRowHeight = 15D, DyDescent = 0.25D };

            Columns columns1 = new Columns();
            Column column1 = new Column() { Min = (UInt32Value)1U, Max = (UInt32Value)1U, Width = 12.5703125D, BestFit = true, CustomWidth = true };
            Column column2 = new Column() { Min = (UInt32Value)2U, Max = (UInt32Value)2U, Width = 19.7109375D, BestFit = true, CustomWidth = true };
            Column column3 = new Column() { Min = (UInt32Value)3U, Max = (UInt32Value)3U, Width = 19.42578125D, BestFit = true, CustomWidth = true };
            Column column4 = new Column() { Min = (UInt32Value)4U, Max = (UInt32Value)4U, Width = 19.5703125D, BestFit = true, CustomWidth = true };
            Column column5 = new Column() { Min = (UInt32Value)5U, Max = (UInt32Value)5U, Width = 22.42578125D, BestFit = true, CustomWidth = true };
            Column column6 = new Column() { Min = (UInt32Value)6U, Max = (UInt32Value)6U, Width = 18.7109375D, BestFit = true, CustomWidth = true };

            columns1.Append(column1);
            columns1.Append(column2);
            columns1.Append(column3);
            columns1.Append(column4);
            columns1.Append(column5);
            columns1.Append(column6);

            SheetData sheetData1 = new SheetData();

            Row row1 = new Row() { RowIndex = (UInt32Value)1U, Spans = new ListValue<StringValue>() { InnerText = "1:6" }, DyDescent = 0.25D };

            Cell cell1 = new Cell() { CellReference = "A1", DataType = CellValues.String };
            CellValue cellValue1 = new CellValue();
            cellValue1.Text = "Periodo";

            cell1.Append(cellValue1);

            Cell cell2 = new Cell() { CellReference = "B1", DataType = CellValues.String };
            CellValue cellValue2 = new CellValue();
            cellValue2.Text = "Indicador Cantidad";

            cell2.Append(cellValue2);

            Cell cell3 = new Cell() { CellReference = "C1", DataType = CellValues.String };
            CellValue cellValue3 = new CellValue();
            cellValue3.Text = "Indicador Fecha oportuna";

            cell3.Append(cellValue3);

            Cell cell4 = new Cell() { CellReference = "D1", DataType = CellValues.String };
            CellValue cellValue4 = new CellValue();
            cellValue4.Text = "Indicador Calidad";

            cell4.Append(cellValue4);

            Cell cell5 = new Cell() { CellReference = "E1", DataType = CellValues.String };
            CellValue cellValue5 = new CellValue();
            cellValue5.Text = "Desempeño";

            cell5.Append(cellValue5);

            Cell cell6 = new Cell() { CellReference = "F1", DataType = CellValues.String };
            CellValue cellValue6 = new CellValue();
            cellValue6.Text = "Cantidad Órdenes Compra";

            cell6.Append(cellValue6);

            row1.Append(cell1);
            row1.Append(cell2);
            row1.Append(cell3);
            row1.Append(cell4);
            row1.Append(cell5);
            row1.Append(cell6);

            sheetData1.Append(row1);

            int i = 2;

            foreach (var ele in summary)
            {
                Row row = new Row() { RowIndex = (UInt32Value)UInt32.Parse($"{i}"), Spans = new ListValue<StringValue>() { InnerText = "1:6" }, DyDescent = 0.25D };
                Cell cell7 = new Cell() { CellReference = $"A{i}", StyleIndex = (UInt32Value)2U, DataType = CellValues.String };
                CellValue cellValue7 = new CellValue() { Text = ele.Periodo };
                cell7.Append(cellValue7);
                Cell cell8 = new Cell() { CellReference = $"B{i}", StyleIndex = (UInt32Value)3U };
                CellValue cellValue8 = new CellValue() { Text = ele.IndicadorCantidad.ToString() };
                cell8.Append(cellValue8);
                Cell cell9 = new Cell() { CellReference = $"C{i}", StyleIndex = (UInt32Value)3U };
                CellValue cellValue9 = new CellValue() { Text = ele.IndicadorFecha.ToString() };
                cell9.Append(cellValue9);
                Cell cell10 = new Cell() { CellReference = $"D{i}", StyleIndex = (UInt32Value)3U };
                CellValue cellValue10 = new CellValue() { Text = ele.IndicadorCalidad.ToString() };
                cell10.Append(cellValue10);
                Cell cell11 = new Cell() { CellReference = $"E{i}", StyleIndex = (UInt32Value)3U };
                CellValue cellValue11 = new CellValue() { Text = ele.Desempenio.ToString() };
                cell11.Append(cellValue11);
                Cell cell12 = new Cell() { CellReference = $"F{i}", StyleIndex = (UInt32Value)4U };
                CellValue cellValue12 = new CellValue() { Text = ele.CantidadOC.ToString() };
                cell12.Append(cellValue12);

                row.Append(cell7);
                row.Append(cell8);
                row.Append(cell9);
                row.Append(cell10);
                row.Append(cell11);
                row.Append(cell12);

                sheetData1.Append(row);
                i++;
            }

            for (int j = i; j < 14; j++)
            {
                Row row03 = new Row() { RowIndex = (UInt32Value)UInt32.Parse($"{j}") };
                Cell cell03 = new Cell() { CellReference = $"A{j}", DataType = CellValues.String };
                CellValue cellValue03 = new CellValue() { Text = "" };
                cell03.Append(cellValue03);
                row03.AddChild(cell03);
                sheetData1.Append(row03);
            }

            Row row3 = new Row() { RowIndex = (UInt32Value)14U, Spans = new ListValue<StringValue>() { InnerText = "1:6" }, DyDescent = 0.25D };
            Cell cell13 = new Cell() { CellReference = "A14", DataType = CellValues.String };
            CellValue cellValue13 = new CellValue() { Text = "Total general" };
            cell13.Append(cellValue13);
            Cell cell14 = new Cell() { CellReference = "B14", StyleIndex = (UInt32Value)3U };
            CellValue cellValue14 = new CellValue() { Text = summary.Average(x => x.IndicadorCantidad).ToString() };
            cell14.Append(cellValue14);
            Cell cell15 = new Cell() { CellReference = "C14", StyleIndex = (UInt32Value)3U };
            CellValue cellValue15 = new CellValue() { Text = summary.Average(x => x.IndicadorFecha).ToString() };
            cell15.Append(cellValue15);
            Cell cell16 = new Cell() { CellReference = "D14", StyleIndex = (UInt32Value)3U };
            CellValue cellValue16 = new CellValue() { Text = summary.Average(x => x.IndicadorCalidad).ToString() };
            cell16.Append(cellValue16);
            Cell cell17 = new Cell() { CellReference = "E14", StyleIndex = (UInt32Value)3U };
            CellValue cellValue17 = new CellValue() { Text = summary.Average(x => x.Desempenio).ToString() };
            cell17.Append(cellValue17);
            Cell cell18 = new Cell() { CellReference = "F14", StyleIndex = (UInt32Value)4U };
            CellValue cellValue18 = new CellValue() { Text = summary.Sum(x => x.CantidadOC).ToString() };
            cell18.Append(cellValue18);

            row3.Append(cell13);
            row3.Append(cell14);
            row3.Append(cell15);
            row3.Append(cell16);
            row3.Append(cell17);
            row3.Append(cell18);

            sheetData1.Append(row3);

            PageMargins pageMargins1 = new PageMargins() { Left = 0.7D, Right = 0.7D, Top = 0.75D, Bottom = 0.75D, Header = 0.3D, Footer = 0.3D };

            worksheet1.Append(sheetDimension1);
            worksheet1.Append(sheetViews1);
            worksheet1.Append(sheetFormatProperties1);
            worksheet1.Append(columns1);
            worksheet1.Append(sheetData1);
            worksheet1.Append(pageMargins1);

            worksheetPart1.Worksheet = worksheet1;
        }

        public void GenerateWorksheetPart2Content(WorksheetPart worksheetPart2, List<EvaluacionProveedorDTO> data)
        {
            Worksheet worksheet2 = new Worksheet() { MCAttributes = new MarkupCompatibilityAttributes() { Ignorable = "x14ac xr xr2 xr3" } };
            worksheet2.AddNamespaceDeclaration("r", "http://schemas.openxmlformats.org/officeDocument/2006/relationships");
            worksheet2.AddNamespaceDeclaration("mc", "http://schemas.openxmlformats.org/markup-compatibility/2006");
            worksheet2.AddNamespaceDeclaration("x14ac", "http://schemas.microsoft.com/office/spreadsheetml/2009/9/ac");
            worksheet2.AddNamespaceDeclaration("xr", "http://schemas.microsoft.com/office/spreadsheetml/2014/revision");
            worksheet2.AddNamespaceDeclaration("xr2", "http://schemas.microsoft.com/office/spreadsheetml/2015/revision2");
            worksheet2.AddNamespaceDeclaration("xr3", "http://schemas.microsoft.com/office/spreadsheetml/2016/revision3");
            worksheet2.SetAttribute(new OpenXmlAttribute("xr", "uid", "http://schemas.microsoft.com/office/spreadsheetml/2014/revision", "{54F8487F-FECB-4C85-8274-AC1E53D6AA34}"));
            SheetDimension sheetDimension2 = new SheetDimension() { Reference = "A1:Y177" };

            SheetViews sheetViews2 = new SheetViews();

            SheetView sheetView2 = new SheetView() { ZoomScale = (UInt32Value)85U, ZoomScaleNormal = (UInt32Value)85U, WorkbookViewId = (UInt32Value)0U };
            Selection selection2 = new Selection() { ActiveCell = "V9", SequenceOfReferences = new ListValue<StringValue>() { InnerText = "V9" } };

            sheetView2.Append(selection2);

            sheetViews2.Append(sheetView2);
            SheetFormatProperties sheetFormatProperties2 = new SheetFormatProperties() { DefaultRowHeight = 15D, DyDescent = 0.25D };

            Columns columns2 = new Columns();
            columns2.Append(new Column() { Min = (UInt32Value)1U, Max = (UInt32Value)1U, Width = 10D, BestFit = true, CustomWidth = true });
            columns2.Append(new Column() { Min = (UInt32Value)2U, Max = (UInt32Value)2U, Width = 10.140625D, BestFit = true, CustomWidth = true });
            columns2.Append(new Column() { Min = (UInt32Value)3U, Max = (UInt32Value)3U, Width = 47D, BestFit = true, CustomWidth = true });
            columns2.Append(new Column() { Min = (UInt32Value)4U, Max = (UInt32Value)4U, Width = 13.42578125D, CustomWidth = true });
            columns2.Append(new Column() { Min = (UInt32Value)5U, Max = (UInt32Value)5U, Width = 4.85546875D, BestFit = true, CustomWidth = true });
            columns2.Append(new Column() { Min = (UInt32Value)6U, Max = (UInt32Value)6U, Width = 5.28515625D, BestFit = true, CustomWidth = true });
            columns2.Append(new Column() { Min = (UInt32Value)7U, Max = (UInt32Value)8U, Width = 6.5703125D, BestFit = true, CustomWidth = true });
            columns2.Append(new Column() { Min = (UInt32Value)9U, Max = (UInt32Value)9U, Width = 8.42578125D, BestFit = true, CustomWidth = true });
            columns2.Append(new Column() { Min = (UInt32Value)10U, Max = (UInt32Value)10U, Width = 6.140625D, CustomWidth = true });
            columns2.Append(new Column() { Min = (UInt32Value)11U, Max = (UInt32Value)11U, Width = 7.85546875D, BestFit = true, CustomWidth = true });
            columns2.Append(new Column() { Min = (UInt32Value)12U, Max = (UInt32Value)12U, Width = 6.85546875D, CustomWidth = true });
            columns2.Append(new Column() { Min = (UInt32Value)13U, Max = (UInt32Value)13U, Width = 11.42578125D, CustomWidth = true });
            columns2.Append(new Column() { Min = (UInt32Value)14U, Max = (UInt32Value)14U, Width = 12.7109375D, CustomWidth = true });
            columns2.Append(new Column() { Min = (UInt32Value)15U, Max = (UInt32Value)15U, Width = 10D, CustomWidth = true });
            columns2.Append(new Column() { Min = (UInt32Value)16U, Max = (UInt32Value)16U, Width = 7.42578125D, CustomWidth = true });
            columns2.Append(new Column() { Min = (UInt32Value)17U, Max = (UInt32Value)17U, Width = 9.5703125D, BestFit = true, CustomWidth = true });
            columns2.Append(new Column() { Min = (UInt32Value)18U, Max = (UInt32Value)19U, Width = 8D, BestFit = true, CustomWidth = true });
            columns2.Append(new Column() { Min = (UInt32Value)20U, Max = (UInt32Value)20U, Width = 24.28515625D, Style = (UInt32Value)12U, BestFit = true, CustomWidth = true });
            columns2.Append(new Column() { Min = (UInt32Value)21U, Max = (UInt32Value)21U, Width = 40.28515625D, BestFit = true, CustomWidth = true });
            columns2.Append(new Column() { Min = (UInt32Value)22U, Max = (UInt32Value)22U, Width = 32.42578125D, BestFit = true, CustomWidth = true });
            columns2.Append(new Column() { Min = (UInt32Value)23U, Max = (UInt32Value)23U, Width = 10.42578125D, BestFit = true, CustomWidth = true });
            columns2.Append(new Column() { Min = (UInt32Value)24U, Max = (UInt32Value)24U, Width = 13D, CustomWidth = true });
            columns2.Append(new Column() { Min = (UInt32Value)25U, Max = (UInt32Value)25U, Width = 10.42578125D, BestFit = true, CustomWidth = true });

            SheetData sheetData2 = new SheetData();

            Row row15 = new Row() { RowIndex = (UInt32Value)1U, Spans = new ListValue<StringValue>() { InnerText = "1:25" }, Height = 49.5D, DyDescent = 0.25D };

            Cell cell85 = new Cell() { CellReference = "A1", StyleIndex = (UInt32Value)13U, DataType = CellValues.String };
            CellValue cellValue85 = new CellValue();
            cellValue85.Text = "NUM_OC";

            cell85.Append(cellValue85);

            Cell cell86 = new Cell() { CellReference = "B1", StyleIndex = (UInt32Value)13U, DataType = CellValues.String };
            CellValue cellValue86 = new CellValue();
            cellValue86.Text = "CÓDIGO";

            cell86.Append(cellValue86);

            Cell cell87 = new Cell() { CellReference = "C1", StyleIndex = (UInt32Value)13U, DataType = CellValues.String };
            CellValue cellValue87 = new CellValue();
            cellValue87.Text = "DESCRIPCIÓN ARTICULO";

            cell87.Append(cellValue87);

            Cell cell88 = new Cell() { CellReference = "D1", StyleIndex = (UInt32Value)13U, DataType = CellValues.String };
            CellValue cellValue88 = new CellValue();
            cellValue88.Text = "UNIDAD MEDIDA";

            cell88.Append(cellValue88);

            Cell cell89 = new Cell() { CellReference = "E1", StyleIndex = (UInt32Value)14U, DataType = CellValues.String };
            CellValue cellValue89 = new CellValue();
            cellValue89.Text = "LTM";

            cell89.Append(cellValue89);

            Cell cell90 = new Cell() { CellReference = "F1", StyleIndex = (UInt32Value)13U, DataType = CellValues.String };
            CellValue cellValue90 = new CellValue();
            cellValue90.Text = "LTC";

            cell90.Append(cellValue90);

            Cell cell91 = new Cell() { CellReference = "G1", StyleIndex = (UInt32Value)13U, DataType = CellValues.String };
            CellValue cellValue91 = new CellValue();
            cellValue91.Text = "LTR";

            cell91.Append(cellValue91);

            Cell cell92 = new Cell() { CellReference = "H1", StyleIndex = (UInt32Value)13U, DataType = CellValues.String };
            CellValue cellValue92 = new CellValue();
            cellValue92.Text = "DÍAS";

            cell92.Append(cellValue92);

            Cell cell93 = new Cell() { CellReference = "I1", StyleIndex = (UInt32Value)13U, DataType = CellValues.String };
            CellValue cellValue93 = new CellValue();
            cellValue93.Text = "DÍAS ATRASO";

            cell93.Append(cellValue93);

            Cell cell94 = new Cell() { CellReference = "J1", StyleIndex = (UInt32Value)16U, DataType = CellValues.String };
            CellValue cellValue94 = new CellValue();
            cellValue94.Text = "IND. FECHA";

            cell94.Append(cellValue94);

            Cell cell95 = new Cell() { CellReference = "K1", StyleIndex = (UInt32Value)15U, DataType = CellValues.String };
            CellValue cellValue95 = new CellValue();
            cellValue95.Text = "CTD PEDIDA";

            cell95.Append(cellValue95);

            Cell cell96 = new Cell() { CellReference = "L1", StyleIndex = (UInt32Value)16U, DataType = CellValues.String };
            CellValue cellValue96 = new CellValue();
            cellValue96.Text = "IND. CANTIDAD";

            cell96.Append(cellValue96);

            Cell cell97 = new Cell() { CellReference = "M1", StyleIndex = (UInt32Value)15U, DataType = CellValues.String };
            CellValue cellValue97 = new CellValue();
            cellValue97.Text = "CTD ACEPTADA";

            cell97.Append(cellValue97);

            Cell cell98 = new Cell() { CellReference = "N1", StyleIndex = (UInt32Value)15U, DataType = CellValues.String };
            CellValue cellValue98 = new CellValue();
            cellValue98.Text = "CTD RECHAZADA";

            cell98.Append(cellValue98);

            Cell cell99 = new Cell() { CellReference = "O1", StyleIndex = (UInt32Value)15U, DataType = CellValues.String };
            CellValue cellValue99 = new CellValue();
            cellValue99.Text = "CTD DEVUELTA";

            cell99.Append(cellValue99);

            Cell cell100 = new Cell() { CellReference = "P1", StyleIndex = (UInt32Value)13U, DataType = CellValues.String };
            CellValue cellValue100 = new CellValue();
            cellValue100.Text = "IND. CALIDAD";

            cell100.Append(cellValue100);

            Cell cell101 = new Cell() { CellReference = "Q1", StyleIndex = (UInt32Value)13U, DataType = CellValues.String };
            CellValue cellValue101 = new CellValue();
            cellValue101.Text = "CÓD. CALIDAD";

            cell101.Append(cellValue101);

            Cell cell102 = new Cell() { CellReference = "R1", StyleIndex = (UInt32Value)13U, DataType = CellValues.String };
            CellValue cellValue102 = new CellValue();
            cellValue102.Text = "IND. TOTAL";

            cell102.Append(cellValue102);

            Cell cell103 = new Cell() { CellReference = "S1", StyleIndex = (UInt32Value)13U, DataType = CellValues.String };
            CellValue cellValue103 = new CellValue();
            cellValue103.Text = "IND. TOTAL DEF.";

            cell103.Append(cellValue103);

            Cell cell104 = new Cell() { CellReference = "T1", StyleIndex = (UInt32Value)13U, DataType = CellValues.String };
            CellValue cellValue104 = new CellValue();
            cellValue104.Text = "CAUSAL";

            cell104.Append(cellValue104);

            Cell cell105 = new Cell() { CellReference = "U1", StyleIndex = (UInt32Value)13U, DataType = CellValues.String };
            CellValue cellValue105 = new CellValue();
            cellValue105.Text = "COMENTARIO";

            cell105.Append(cellValue105);

            Cell cell106 = new Cell() { CellReference = "V1", StyleIndex = (UInt32Value)13U, DataType = CellValues.String };
            CellValue cellValue106 = new CellValue();
            cellValue106.Text = "COMPRADOR";

            cell106.Append(cellValue106);

            Cell cell107 = new Cell() { CellReference = "W1", StyleIndex = (UInt32Value)15U, DataType = CellValues.String };
            CellValue cellValue107 = new CellValue();
            cellValue107.Text = "FECHA CREACIÓN";

            cell107.Append(cellValue107);

            Cell cell108 = new Cell() { CellReference = "X1", StyleIndex = (UInt32Value)15U, DataType = CellValues.String };
            CellValue cellValue108 = new CellValue();
            cellValue108.Text = "FECHA DESPACHO";

            cell108.Append(cellValue108);

            Cell cell109 = new Cell() { CellReference = "Y1", StyleIndex = (UInt32Value)15U, DataType = CellValues.String };
            CellValue cellValue109 = new CellValue();
            cellValue109.Text = "FECHA RECIBO";

            cell109.Append(cellValue109);

            row15.Append(cell85);
            row15.Append(cell86);
            row15.Append(cell87);
            row15.Append(cell88);
            row15.Append(cell89);
            row15.Append(cell90);
            row15.Append(cell91);
            row15.Append(cell92);
            row15.Append(cell93);
            row15.Append(cell94);
            row15.Append(cell95);
            row15.Append(cell96);
            row15.Append(cell97);
            row15.Append(cell98);
            row15.Append(cell99);
            row15.Append(cell100);
            row15.Append(cell101);
            row15.Append(cell102);
            row15.Append(cell103);
            row15.Append(cell104);
            row15.Append(cell105);
            row15.Append(cell106);
            row15.Append(cell107);
            row15.Append(cell108);
            row15.Append(cell109);

            sheetData2.Append(row15);

            int i = 2;
            foreach (var ele in data)
            {
                Row row16 = new Row() { RowIndex = (UInt32Value)UInt32.Parse($"{i}"), Spans = new ListValue<StringValue>() { InnerText = "1:25" }, Height = 16.5D, DyDescent = 0.35D };

                Cell cell110 = new Cell() { CellReference = $"A{i}", StyleIndex = (UInt32Value)5U, DataType = CellValues.String };
                CellValue cellValue110 = new CellValue();
                cellValue110.Text = ele.NumOC;

                cell110.Append(cellValue110);

                Cell cell111 = new Cell() { CellReference = $"B{i}", StyleIndex = (UInt32Value)6U, DataType = CellValues.String };
                CellValue cellValue111 = new CellValue();
                cellValue111.Text = ele.Codigo;

                cell111.Append(cellValue111);

                Cell cell112 = new Cell() { CellReference = $"C{i}", StyleIndex = (UInt32Value)6U, DataType = CellValues.String };
                CellValue cellValue112 = new CellValue();
                cellValue112.Text = ele.Descripcion;

                cell112.Append(cellValue112);

                Cell cell113 = new Cell() { CellReference = $"D{i}", StyleIndex = (UInt32Value)6U, DataType = CellValues.String };
                CellValue cellValue113 = new CellValue();
                cellValue113.Text = ele.UnidadMedida;

                cell113.Append(cellValue113);

                Cell cell114 = new Cell() { CellReference = $"E{i}", StyleIndex = (UInt32Value)5U, DataType = CellValues.Number };
                CellValue cellValue114 = new CellValue();
                cellValue114.Text = ele.LTM.ToString();

                cell114.Append(cellValue114);

                Cell cell115 = new Cell() { CellReference = $"F{i}", StyleIndex = (UInt32Value)5U, DataType = CellValues.Number };
                CellValue cellValue115 = new CellValue();
                cellValue115.Text = ele.LTC.ToString();

                cell115.Append(cellValue115);

                Cell cell116 = new Cell() { CellReference = $"G{i}", StyleIndex = (UInt32Value)5U, DataType = CellValues.Number };
                CellValue cellValue116 = new CellValue();
                cellValue116.Text = ele.LTR.ToString();

                cell116.Append(cellValue116);

                Cell cell117 = new Cell() { CellReference = $"H{i}", StyleIndex = (UInt32Value)5U, DataType = CellValues.Number };
                CellValue cellValue117 = new CellValue();
                cellValue117.Text = ele.Dias.ToString();

                cell117.Append(cellValue117);

                Cell cell118 = new Cell() { CellReference = $"I{i}", StyleIndex = (UInt32Value)5U, DataType = CellValues.Number };
                CellValue cellValue118 = new CellValue();
                cellValue118.Text = ele.DiasAtraso.ToString();

                cell118.Append(cellValue118);

                Cell cell119 = new Cell() { CellReference = $"J{i}", StyleIndex = (UInt32Value)17U, DataType = CellValues.Number };
                CellValue cellValue119 = new CellValue();
                cellValue119.Text = ele.IndicadorFecha.ToString();

                cell119.Append(cellValue119);

                Cell cell120 = new Cell() { CellReference = $"K{i}", StyleIndex = (UInt32Value)5U, DataType = CellValues.Number };
                CellValue cellValue120 = new CellValue();
                cellValue120.Text = ele.CantidadPedida.ToString();

                cell120.Append(cellValue120);

                Cell cell121 = new Cell() { CellReference = $"L{i}", StyleIndex = (UInt32Value)18U, DataType = CellValues.Number };
                CellValue cellValue121 = new CellValue();
                cellValue121.Text = ele.IndicadorCantidad.ToString();

                cell121.Append(cellValue121);

                Cell cell122 = new Cell() { CellReference = $"M{i}", StyleIndex = (UInt32Value)5U, DataType = CellValues.Number };
                CellValue cellValue122 = new CellValue();
                cellValue122.Text = ele.CantidadAceptada.ToString();

                cell122.Append(cellValue122);

                Cell cell123 = new Cell() { CellReference = $"N{i}", StyleIndex = (UInt32Value)5U, DataType = CellValues.Number };
                CellValue cellValue123 = new CellValue() { Text = ele.CantidadRechazada.ToString() };
                cell123.Append(cellValue123);

                Cell cell124 = new Cell() { CellReference = $"O{i}", StyleIndex = (UInt32Value)5U, DataType = CellValues.Number };
                CellValue cellValue133 = new CellValue() { Text = ele.CantidadDevuelta.ToString() };
                cell124.Append(cellValue133);

                Cell cell125 = new Cell() { CellReference = $"P{i}", StyleIndex = (UInt32Value)18U, DataType = CellValues.Number };
                CellValue cellValue124 = new CellValue() { Text = ele.IndicadorCalidad.ToString("0.0") };
                cell125.Append(cellValue124);
                Cell cell126 = new Cell() { CellReference = $"Q{i}", StyleIndex = (UInt32Value)5U, DataType = CellValues.String };
                CellValue cellValue134 = new CellValue() { Text = ele.CodigoCalidad };
                cell126.Append(cellValue134);

                Cell cell127 = new Cell() { CellReference = $"R{i}", StyleIndex = (UInt32Value)7U, DataType = CellValues.Number };
                CellValue cellValue125 = new CellValue() { Text = ele.IndicadorCumplimiento.ToString("0.0") };
                cell127.Append(cellValue125);

                Cell cell128 = new Cell() { CellReference = $"S{i}", StyleIndex = (UInt32Value)7U, DataType = CellValues.Number };
                CellValue cellValue126 = new CellValue() { Text = ele.IndicadorCumplimientoDefinitivo.ToString("0.0") };
                cell128.Append(cellValue126);

                Cell cell129 = new Cell() { CellReference = $"T{i}", StyleIndex = (UInt32Value)9U, DataType = CellValues.String };
                CellValue cellValue127 = new CellValue() { Text = ele.Causal ?? "" };
                cell129.Append(cellValue127);
                Cell cell130 = new Cell() { CellReference = $"U{i}", StyleIndex = (UInt32Value)9U, DataType = CellValues.String };
                CellValue cellValue132 = new CellValue() { Text = ele.Comentario ?? "" };
                cell130.Append(cellValue132);

                Cell cell131 = new Cell() { CellReference = $"V{i}", StyleIndex = (UInt32Value)6U, DataType = CellValues.String };
                CellValue cellValue128 = new CellValue();
                cellValue128.Text = ele.Comprador;

                cell131.Append(cellValue128);

                Cell cell132 = new Cell() { CellReference = $"W{i}", StyleIndex = (UInt32Value)10U, DataType = new EnumValue<CellValues>(CellValues.Date), };
                CellValue cellValue129 = new CellValue();
                cellValue129.Text = ele.FechaCreacion.ToString("s");

                cell132.Append(cellValue129);

                Cell cell133 = new Cell() { CellReference = $"X{i}", StyleIndex = (UInt32Value)11U, DataType = new EnumValue<CellValues>(CellValues.Date) };
                CellValue cellValue130 = new CellValue();
                cellValue130.Text = ele.FechaDespacho.ToString("s");

                cell133.Append(cellValue130);

                Cell cell134 = new Cell() { CellReference = $"Y{i}", StyleIndex = (UInt32Value)11U, DataType = new EnumValue<CellValues>(CellValues.Date) };
                CellValue cellValue131 = new CellValue();
                cellValue131.Text = ele.FechaRecibo.ToString("s");

                cell134.Append(cellValue131);

                row16.Append(cell110);
                row16.Append(cell111);
                row16.Append(cell112);
                row16.Append(cell113);
                row16.Append(cell114);
                row16.Append(cell115);
                row16.Append(cell116);
                row16.Append(cell117);
                row16.Append(cell118);
                row16.Append(cell119);
                row16.Append(cell120);
                row16.Append(cell121);
                row16.Append(cell122);
                row16.Append(cell123);
                row16.Append(cell124);
                row16.Append(cell125);
                row16.Append(cell126);
                row16.Append(cell127);
                row16.Append(cell128);
                row16.Append(cell129);
                row16.Append(cell130);
                row16.Append(cell131);
                row16.Append(cell132);
                row16.Append(cell133);
                row16.Append(cell134);

                sheetData2.Append(row16);

                i++;
            }

            ProtectedRanges protectedRanges1 = new ProtectedRanges();
            ProtectedRange protectedRange1 = new ProtectedRange() { SequenceOfReferences = new ListValue<StringValue>() { InnerText = "L2:L177" }, Name = "Rango2" };
            ProtectedRange protectedRange2 = new ProtectedRange() { SequenceOfReferences = new ListValue<StringValue>() { InnerText = "L1" }, Name = "Rango2_1" };

            protectedRanges1.Append(protectedRange1);
            protectedRanges1.Append(protectedRange2);
            PageMargins pageMargins2 = new PageMargins() { Left = 0.7D, Right = 0.7D, Top = 0.75D, Bottom = 0.75D, Header = 0.3D, Footer = 0.3D };

            worksheet2.Append(sheetDimension2);
            worksheet2.Append(sheetViews2);
            worksheet2.Append(sheetFormatProperties2);
            worksheet2.Append(columns2);
            worksheet2.Append(sheetData2);
            worksheet2.Append(protectedRanges1);
            worksheet2.Append(pageMargins2);

            worksheetPart2.Worksheet = worksheet2;
        }


        public void GenerateChartPart1Content2(ChartPart chartPart1 , decimal objetivo)
        {
            C.ChartSpace chartSpace1 = chartPart1.ChartSpace;

            C.Chart chart1 = chartSpace1.GetFirstChild<C.Chart>();

            C.PlotArea plotArea1 = chart1.GetFirstChild<C.PlotArea>();

            C.CategoryAxis categoryAxis1 = plotArea1.GetFirstChild<C.CategoryAxis>();

            C.LineChart lineChart1 = new C.LineChart();
            C.Grouping grouping1 = new C.Grouping() { Val = C.GroupingValues.Standard };
            C.VaryColors varyColors1 = new C.VaryColors() { Val = false };

            C.LineChartSeries lineChartSeries1 = new C.LineChartSeries();
            C.Index index1 = new C.Index() { Val = (UInt32Value)5U };
            C.Order order1 = new C.Order() { Val = (UInt32Value)5U };

            C.SeriesText seriesText1 = new C.SeriesText();
            C.NumericValue numericValue1 = new C.NumericValue();
            numericValue1.Text = "Meta";

            seriesText1.Append(numericValue1);

            C.ChartShapeProperties chartShapeProperties1 = new C.ChartShapeProperties();

            A.Outline outline1 = new A.Outline() { Width = 31750, CapType = A.LineCapValues.Round };

            A.SolidFill solidFill1 = new A.SolidFill();
            A.RgbColorModelHex rgbColor = new A.RgbColorModelHex() { Val = "FF0000" };
            solidFill1.Append(rgbColor);

            A.Round round1 = new A.Round();

            outline1.Append(solidFill1);
            outline1.Append(round1);
            A.EffectList effectList1 = new A.EffectList();

            chartShapeProperties1.Append(outline1);
            chartShapeProperties1.Append(effectList1);

            C.Marker marker1 = new C.Marker();
            C.Symbol symbol1 = new C.Symbol() { Val = C.MarkerStyleValues.None };

            marker1.Append(symbol1);

            C.Values values1 = new C.Values();

            C.NumberLiteral numberLiteral1 = new C.NumberLiteral();
            C.FormatCode formatCode1 = new C.FormatCode();
            formatCode1.Text = "General";
            C.PointCount pointCount1 = new C.PointCount() { Val = (UInt32Value)12U };

            C.NumericPoint numericPoint1 = new C.NumericPoint() { Index = (UInt32Value)0U };
            C.NumericValue numericValue2 = new C.NumericValue();
            numericValue2.Text = objetivo.ToString("0.0");

            numericPoint1.Append(numericValue2);

            C.NumericPoint numericPoint2 = new C.NumericPoint() { Index = (UInt32Value)1U };
            C.NumericValue numericValue3 = new C.NumericValue();
            numericValue3.Text = objetivo.ToString("0.0");

            numericPoint2.Append(numericValue3);

            C.NumericPoint numericPoint3 = new C.NumericPoint() { Index = (UInt32Value)2U };
            C.NumericValue numericValue4 = new C.NumericValue();
            numericValue4.Text = objetivo.ToString("0.0");

            numericPoint3.Append(numericValue4);

            C.NumericPoint numericPoint4 = new C.NumericPoint() { Index = (UInt32Value)3U };
            C.NumericValue numericValue5 = new C.NumericValue();
            numericValue5.Text = objetivo.ToString("0.0");

            numericPoint4.Append(numericValue5);

            C.NumericPoint numericPoint5 = new C.NumericPoint() { Index = (UInt32Value)4U };
            C.NumericValue numericValue6 = new C.NumericValue();
            numericValue6.Text = objetivo.ToString("0.0");

            numericPoint5.Append(numericValue6);

            C.NumericPoint numericPoint6 = new C.NumericPoint() { Index = (UInt32Value)5U };
            C.NumericValue numericValue7 = new C.NumericValue();
            numericValue7.Text = objetivo.ToString("0.0");

            numericPoint6.Append(numericValue7);

            C.NumericPoint numericPoint7 = new C.NumericPoint() { Index = (UInt32Value)6U };
            C.NumericValue numericValue8 = new C.NumericValue();
            numericValue8.Text = objetivo.ToString("0.0");

            numericPoint7.Append(numericValue8);

            C.NumericPoint numericPoint8 = new C.NumericPoint() { Index = (UInt32Value)7U };
            C.NumericValue numericValue9 = new C.NumericValue();
            numericValue9.Text = objetivo.ToString("0.0");

            numericPoint8.Append(numericValue9);

            C.NumericPoint numericPoint9 = new C.NumericPoint() { Index = (UInt32Value)8U };
            C.NumericValue numericValue10 = new C.NumericValue();
            numericValue10.Text = objetivo.ToString("0.0");

            numericPoint9.Append(numericValue10);

            C.NumericPoint numericPoint10 = new C.NumericPoint() { Index = (UInt32Value)9U };
            C.NumericValue numericValue11 = new C.NumericValue();
            numericValue11.Text = objetivo.ToString("0.0");

            numericPoint10.Append(numericValue11);

            C.NumericPoint numericPoint11 = new C.NumericPoint() { Index = (UInt32Value)10U };
            C.NumericValue numericValue12 = new C.NumericValue();
            numericValue12.Text = objetivo.ToString("0.0");

            numericPoint11.Append(numericValue12);

            C.NumericPoint numericPoint12 = new C.NumericPoint() { Index = (UInt32Value)11U };
            C.NumericValue numericValue13 = new C.NumericValue();
            numericValue13.Text = objetivo.ToString("0.0");

            numericPoint12.Append(numericValue13);

            numberLiteral1.Append(formatCode1);
            numberLiteral1.Append(pointCount1);
            numberLiteral1.Append(numericPoint1);
            numberLiteral1.Append(numericPoint2);
            numberLiteral1.Append(numericPoint3);
            numberLiteral1.Append(numericPoint4);
            numberLiteral1.Append(numericPoint5);
            numberLiteral1.Append(numericPoint6);
            numberLiteral1.Append(numericPoint7);
            numberLiteral1.Append(numericPoint8);
            numberLiteral1.Append(numericPoint9);
            numberLiteral1.Append(numericPoint10);
            numberLiteral1.Append(numericPoint11);
            numberLiteral1.Append(numericPoint12);

            values1.Append(numberLiteral1);
            C.Smooth smooth1 = new C.Smooth() { Val = false };

            C.LineSerExtensionList lineSerExtensionList1 = new C.LineSerExtensionList();

            C.LineSerExtension lineSerExtension1 = new C.LineSerExtension() { Uri = "{C3380CC4-5D6E-409C-BE32-E72D297353CC}" };
            lineSerExtension1.AddNamespaceDeclaration("c16", "http://schemas.microsoft.com/office/drawing/2014/chart");

            OpenXmlUnknownElement openXmlUnknownElement1 = OpenXmlUnknownElement.CreateOpenXmlUnknownElement("<c16:uniqueId val=\"{00000000-AAE9-4B12-89BE-EAEEF0B82031}\" xmlns:c16=\"http://schemas.microsoft.com/office/drawing/2014/chart\" />");

            lineSerExtension1.Append(openXmlUnknownElement1);

            lineSerExtensionList1.Append(lineSerExtension1);

            lineChartSeries1.Append(index1);
            lineChartSeries1.Append(order1);
            lineChartSeries1.Append(seriesText1);
            lineChartSeries1.Append(chartShapeProperties1);
            lineChartSeries1.Append(marker1);
            lineChartSeries1.Append(values1);
            lineChartSeries1.Append(smooth1);
            lineChartSeries1.Append(lineSerExtensionList1);

            C.DataLabels dataLabels1 = new C.DataLabels();
            C.ShowLegendKey showLegendKey1 = new C.ShowLegendKey() { Val = false };
            C.ShowValue showValue1 = new C.ShowValue() { Val = false };
            C.ShowCategoryName showCategoryName1 = new C.ShowCategoryName() { Val = false };
            C.ShowSeriesName showSeriesName1 = new C.ShowSeriesName() { Val = false };
            C.ShowPercent showPercent1 = new C.ShowPercent() { Val = false };
            C.ShowBubbleSize showBubbleSize1 = new C.ShowBubbleSize() { Val = false };

            dataLabels1.Append(showLegendKey1);
            dataLabels1.Append(showValue1);
            dataLabels1.Append(showCategoryName1);
            dataLabels1.Append(showSeriesName1);
            dataLabels1.Append(showPercent1);
            dataLabels1.Append(showBubbleSize1);
            C.ShowMarker showMarker1 = new C.ShowMarker() { Val = true };
            C.Smooth smooth2 = new C.Smooth() { Val = false };
            C.AxisId axisId1 = new C.AxisId() { Val = (UInt32Value)350558559U };
            C.AxisId axisId2 = new C.AxisId() { Val = (UInt32Value)350559519U };

            lineChart1.Append(grouping1);
            lineChart1.Append(varyColors1);
            lineChart1.Append(lineChartSeries1);
            lineChart1.Append(dataLabels1);
            lineChart1.Append(showMarker1);
            lineChart1.Append(smooth2);
            lineChart1.Append(axisId1);
            lineChart1.Append(axisId2);
            plotArea1.InsertBefore(lineChart1, categoryAxis1);
        }
    }
}

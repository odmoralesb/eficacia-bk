using System.ComponentModel;

namespace TQ.Proveedores.Domain.Enums
{
    public enum EstadoEvaluacion
    {
        [Description("Pendiente de que el comprador apruebe la evaluación")]
        PENDIENTE_APROBACION = 1,
        [Description("El comprador aprobó la evaluación")]
        APROBADO = 2,
        [Description("La evaluación fue enviada al proveedor")]
        ENVIADO = 3
    }
}

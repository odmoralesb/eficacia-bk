using System.ComponentModel;

namespace TQ.Proveedores.Domain.Enums
{
    public enum TipoParametro
    {
        [Description("Valor numérico inferior en el intervalor")]
        INTERVALO_MENOR = 1,
        [Description("Valor numérico superior en el intervalor")]
        INTERVALO_MAYOR = 2,
        [Description("Valor numérico")]
        NUMERICO = 3,
        [Description("Valor entero mayor o igual a cero")]
        ENTERO_POSITIVO = 4,
        [Description("Cadena de texto")]
        TEXTO = 5
    }
}

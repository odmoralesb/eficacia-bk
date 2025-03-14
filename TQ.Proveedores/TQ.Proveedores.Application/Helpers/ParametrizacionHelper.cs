using System.Collections.Generic;
using System.Linq;
using TQ.Proveedores.Application.Parametros.Queries;
using TQ.Proveedores.Domain.Enums;

namespace TQ.Proveedores.Application.Helpers
{
    public static class ParametrizacionHelper
    {
        public static decimal ObtenerValorParametrizado(List<ParametroDTO> parametroIndicadores, string nombre, decimal valor, string tipo = "", bool urgencia = false, int organizacionId = 155)
        {
            var parametros = parametroIndicadores.Where(x => x.Nombre.Contains(nombre.ToUpper()));

            foreach (var p in parametros)
            {
                var numCampoInvervaloMayor = p.Detalles.FirstOrDefault(x => x.TipoParametro == TipoParametro.INTERVALO_MAYOR)?.NumCampo ?? 0;
                var numCampoInvervaloMenor = p.Detalles.FirstOrDefault(x => x.TipoParametro == TipoParametro.INTERVALO_MENOR)?.NumCampo ?? 0;
                var numCampoTipo = p.Detalles.FirstOrDefault(x => x.Nombre.ToUpper() == "TIPO OC")?.NumCampo ?? 0;
                var numCampoResultado = p.Detalles.FirstOrDefault(x => x.Nombre.ToUpper() == "DESEMPEÑO")?.NumCampo ?? 0;

                var campoItervaloMayor = typeof(ParametroValorDTO).GetProperty($"Campo{numCampoInvervaloMayor}");
                var campoItervaloMenor = typeof(ParametroValorDTO).GetProperty($"Campo{numCampoInvervaloMenor}");
                var campoTipo = typeof(ParametroValorDTO).GetProperty($"Campo{numCampoTipo}");
                var campoResultado = typeof(ParametroValorDTO).GetProperty($"Campo{numCampoResultado}");

                p.Valores.Sort((a, b) => (int)decimal.Parse(campoResultado.GetValue(b).ToString()) - (int)decimal.Parse(campoResultado.GetValue(a).ToString()));
                var query = p.Valores.AsEnumerable();

                if (campoTipo != null)
                {
                    query = query.Where(x => campoTipo.GetValue(x).ToString() == tipo);
                }

                if (!urgencia)
                {
                    if (campoItervaloMenor != null)
                    {
                        query = query.Where(x => decimal.Parse(campoItervaloMenor.GetValue(x).ToString()) <= valor);
                    }

                    if (campoItervaloMayor != null)
                    {
                        query = query.Where(x => decimal.Parse(campoItervaloMayor.GetValue(x).ToString()) >= valor);
                    }
                }

                var result = query.FirstOrDefault();
                if (result != null && campoResultado != null)
                {
                    return decimal.Parse(campoResultado.GetValue(result).ToString());
                }
            }

            return 0;
        }

        public static decimal ObtenerValorParametrizado(List<ParametroDTO> parametroIndicadores, string nombre, string etiqueta, string valor, bool urgencia = false, int organizacionId = 155)
        {
            var parametros = parametroIndicadores.Where(x => x.Nombre.Contains(nombre.ToUpper()));

            foreach (var p in parametros)
            {
                var numCampoEtiqueta = p.Detalles.FirstOrDefault(x => x.Nombre.ToUpper() == etiqueta)?.NumCampo ?? 0;
                var numCampoResultado = p.Detalles.FirstOrDefault(x => x.Nombre.ToUpper() == "DESEMPEÑO")?.NumCampo ?? 0;

                var campoEtiqueta = typeof(ParametroValorDTO).GetProperty($"Campo{numCampoEtiqueta}");
                var campoResultado = typeof(ParametroValorDTO).GetProperty($"Campo{numCampoResultado}");

                p.Valores.Sort((a, b) => (int)decimal.Parse(campoResultado.GetValue(b).ToString()) - (int)decimal.Parse(campoResultado.GetValue(a).ToString()));
                var query = p.Valores.AsEnumerable();

                if (!urgencia && campoEtiqueta != null)
                {
                    query = query.Where(x => campoEtiqueta.GetValue(x).ToString() == valor);
                }

                var result = query.FirstOrDefault();
                if (result != null && campoResultado != null)
                {
                    return decimal.Parse(campoResultado.GetValue(result).ToString());
                }
            }

            return 0;
        }
    }
}
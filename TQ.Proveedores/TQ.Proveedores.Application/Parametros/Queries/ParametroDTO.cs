using System.Collections.Generic;
using System;
using TQ.Utils.AutoMapperUtils;
using TQ.Proveedores.Domain.Parametros;
using TQ.Proveedores.Domain.Enums;

namespace TQ.Proveedores.Application.Parametros.Queries
{
    public class ParametroValorDTO : IMapFrom<ParametroValor>
    {
        public Guid Id { get; set; }
        public string Campo1 { get; set; }
        public string Campo2 { get; set; }
        public string Campo3 { get; set; }
        public string Campo4 { get; set; }
        public string Campo5 { get; set; }
        public string Campo6 { get; set; }
        public string Campo7 { get; set; }
        public string Campo8 { get; set; }
        public string Campo9 { get; set; }
        public string Campo10 { get; set; }
        public Guid ParametroId { get; set; }
    }

    public class ParametroDetalleDTO : IMapFrom<ParametroDetalle>
    {
        public Guid Id { get; set; }
        public int NumCampo { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public TipoParametro TipoParametro { get; set; }
        public Guid ParametroId { get; set; }
    }

    public class ParametroDTO : IMapFrom<Parametro>
    {
        public Guid Id { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public int OrganizacionId { get; set; }
        public List<ParametroDetalleDTO> Detalles { get; set; }
        public List<ParametroValorDTO> Valores { get; set; }
    }
}

using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using TQ.Proveedores.Domain.Maestras;
using TQ.Utils.AutoMapperUtils;

namespace TQ.Proveedores.Application.Proveedores.Queries
{
    public class ProveedorDTO : IMapFrom<Proveedor>
    {
        public Guid Id { get; set; }
        public string Nit { get; set; }
        public string RazonSocial { get; set; }
        public ICollection<string> ListaCorreoElectronico { get; set; }

        public void Mapping(Profile profile)
        {
            var c = profile.CreateMap<Proveedor, ProveedorDTO>()
                .ForMember(
                    d => d.ListaCorreoElectronico,
                    opt => opt.MapFrom(
                        s => s.ListaCorreoElectronico.Split(';', StringSplitOptions.None).ToList()
                        )
                    );
        }
    }
}

using AutoMapper;
using AutoMapper.QueryableExtensions;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using TQ.Proveedores.Application.Configuracion.Queries;
using TQ.Proveedores.Domain.Configuracion;
using TQ.Proveedores.Domain.Maestras;
using TQ.Proveedores.Domain.OrdenesDeCompra;
using TQ.Repository.Abstractions;
using TQ.Util.MediatRUtils;

namespace TQ.Proveedores.Application.Evaluaciones.Queries
{
    public class GetFiltrosReporteQuery: IRequest<ResponseBase<List<FiltroDTO>>>
    {
        public string UserName { get; set; }
    }

    public class GetFiltrosReporteQueryHandler : IRequestHandler<GetFiltrosReporteQuery, ResponseBase<List<FiltroDTO>>>
    {
        private readonly IRepository<Proveedor> _repositoryProveedor;
        private readonly IRepository<OrdenCompra> _repositoryOC;
        private readonly IRepository<Usuario> _repositoryUsuario;
        private readonly IRepository<CalendarioTQ> _repositoryCalendario;
        private readonly IMapper _mapper;

        public GetFiltrosReporteQueryHandler(IRepository<Proveedor> repositoryProveedor,
                                             IRepository<OrdenCompra> repositoryOC,
                                             IRepository<Usuario> repositoryUsuario,
                                             IRepository<CalendarioTQ> repositoryCalendario,
                                             IMapper mapper)
        {
            _repositoryProveedor = repositoryProveedor;
            _repositoryOC = repositoryOC;
            _repositoryUsuario = repositoryUsuario;
            _repositoryCalendario = repositoryCalendario;
            _mapper = mapper;
        }

        public Task<ResponseBase<List<FiltroDTO>>> Handle(GetFiltrosReporteQuery request, CancellationToken cancellationToken)
        {
            List<FiltroDTO> filtros = new List<FiltroDTO>();
            OptionDTO[] filtroProveedor = null;

            UsuarioDTO usuario = _repositoryUsuario.TableNoTracking
                                                    .ProjectTo<UsuarioDTO>(_mapper.ConfigurationProvider)
                                                    .FirstOrDefault(x => x.NombreUsuario.ToUpper() == request.UserName.ToUpper());
            if (usuario == null)
            {
                throw new Exception("No es posible obtener los filtros.");
            }

            var ocs = _repositoryOC.TableNoTracking.Where(x => x.UpdateTime.Year > (DateTime.Now.Year - 5));
            List<Guid> provIds = ocs.Select(x => x.ProveedorId).Distinct().ToList();
            List<string> ups = ocs.Select(x => x.UnidadProductiva).Distinct().ToList();

            filtroProveedor = _repositoryProveedor.TableNoTracking
                                                .Where(x => provIds.Contains(x.Id))
                                                .OrderBy(x => x.RazonSocial)
                                                .Select(x => new OptionDTO
                                                {
                                                    Label = x.RazonSocial,
                                                    Value = x.Id.ToString(),
                                                    Selected = false
                                                }).ToArray();
            filtros.Add(new FiltroDTO()
            {
                Key = "proveedores",
                Label = "Proveedor",
                Multiple = true,
                Options = filtroProveedor
            });

            OptionDTO[] filtroCompradores = _repositoryUsuario.TableNoTracking
                                                .Where(x =>
                                                    (x.Rol.Nombre == "Comprador")
                                                    && (x.JefeDirectoId != null)
                                                )
                                                .OrderBy(x => x.Nombre)
                                                .Select(x => new OptionDTO
                                                {
                                                    Label = x.GetNombreCompleto(),
                                                    Value = x.Id.ToString(),
                                                    Selected = false
                                                }).ToArray();

            filtros.Add(new FiltroDTO()
            {
                Key = "compradores",
                Label = "Comprador",
                Multiple = true,
                Options = filtroCompradores
            });

            filtros.Add(new FiltroDTO()
            {
                Key = "unidadProductiva",
                Label = "Unidad Productiva",
                Multiple = true,
                Options = ups.Select(x => new OptionDTO
                {
                    Label = x,
                    Value = x,
                    Selected = false
                }).ToArray()
            });

            var filtroCalendario = _repositoryCalendario.TableNoTracking
                                            .Where(x => x.Anio > DateTime.Now.Year - 5)
                                            .OrderBy(x => x.Anio)
                                            .ThenBy(x => x.Mes);

            filtros.Add(new FiltroDTO()
            {
                Key = "anio",
                Label = "Año",
                Multiple = false,
                Options = filtroCalendario.Select(x => new OptionDTO
                {
                    Label = x.Anio.ToString(),
                    Value = x.Anio.ToString(),
                    Selected = x.Anio == DateTime.Now.Year
                }).Distinct().ToArray()
            });

            filtros.Add(new FiltroDTO()
            {
                Key = "trimestre",
                Label = "Trimestre",
                Multiple = true,
                Options = filtroCalendario.Select(x => new OptionDTO
                {
                    Value = x.Trimestre.ToString(),
                    Label = $"T{x.Trimestre}",
                    Selected = false
                }).Distinct().ToArray()
            });

            filtros.Add(new FiltroDTO()
            {
                Key = "desempenio",
                Label = "Desempeño",
                Multiple = false,
                Options = new OptionDTO[]
                {
                    new()
                    {
                        Label = "Bajo Desempeño",
                        Value = "BD",
                        Selected = false
                    },
                   new() {
                        Label = "Alto Desempeño",
                        Value = "AD",
                        Selected = false
                    }
                }
            });

            return Task.FromResult(new ResponseBase<List<FiltroDTO>>(filtros));
        }
    }
}

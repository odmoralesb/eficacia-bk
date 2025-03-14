using AutoMapper.QueryableExtensions;
using MediatR;
using System.Collections.Generic;
using System;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using TQ.Proveedores.Application.Configuracion.Queries;
using TQ.Proveedores.Domain.Configuracion;
using TQ.Proveedores.Domain.Maestras;
using TQ.Proveedores.Domain.OrdenesDeCompra;
using TQ.Repository.Abstractions;
using TQ.Util.MediatRUtils;
using AutoMapper;
using TQ.Proveedores.Application.Parametros.Queries;
using TQ.Proveedores.Domain.Parametros;
using DocumentFormat.OpenXml.Wordprocessing;
using DocumentFormat.OpenXml.Spreadsheet;
using TQ.Proveedores.Application.OrdenesDeCompra.Queries;

namespace TQ.Proveedores.Application.Evaluaciones.Queries
{
    public class GetFiltrosEvaluacionQuery : IRequest<ResponseBase<List<OptionMWDTO>>>
    {
        public string UserName { get; set; }
        public string Busqueda { get; set; } = "";
        public string Tipo { get; set; } = null;
        public int Page { get; set; } = 1;
        public int PageSize { get; set; } = 10;

    }

    public class GetFiltrosEvaluacionQueryHandler : IRequestHandler<GetFiltrosEvaluacionQuery, ResponseBase<List<OptionMWDTO>>>
    {
        private readonly IRepository<Proveedor> _repositoryProveedor;
        private readonly IRepository<OrdenCompra> _repositoryOC;
        private readonly IRepository<Usuario> _repositoryUsuario;
        private readonly IRepository<CalendarioTQ> _repositoryCalendario;
        private readonly IRepository<Parametro> _repositoryParametro;
        private readonly IRepository<ParametroDetalle> _repositoryParametroDetalle;
        private readonly IRepository<ParametroValor> _repositoryParametroValor;
        private readonly IRepository<Evento> _repositoryEvento;
        private readonly IMapper _mapper;
        private readonly ICurrentUserService _currentUserService;

        public GetFiltrosEvaluacionQueryHandler(IRepository<Proveedor> repositoryProveedor,
                                                IRepository<OrdenCompra> repositoryOC,
                                                IRepository<Usuario> repositoryUsuario,
                                                IRepository<CalendarioTQ> repositoryCalendario,
                                                IRepository<Parametro> repositoryParametro,
                                                IRepository<ParametroDetalle> repositoryParametroDetalle,
                                                IRepository<ParametroValor> repositoryParametroValor,
                                                IRepository<Evento> repositoryEvento,
                                                IMapper mapper,
                                                ICurrentUserService currentUserService)
        {
            _repositoryProveedor = repositoryProveedor;
            _repositoryOC = repositoryOC;
            _repositoryUsuario = repositoryUsuario;
            _repositoryCalendario = repositoryCalendario;
            _repositoryParametro = repositoryParametro;
            _repositoryParametroDetalle = repositoryParametroDetalle;
            _repositoryParametroValor = repositoryParametroValor;
            _repositoryEvento = repositoryEvento;
            _mapper = mapper;
            _currentUserService = currentUserService;
        }

        public Task<ResponseBase<List<OptionMWDTO>>> Handle(GetFiltrosEvaluacionQuery request, CancellationToken cancellationToken)
        {
            User user = _currentUserService.GetUserAsync().Result;
            UsuarioDTO usuario = null;
            if (!string.IsNullOrEmpty(request.UserName))
            {
                usuario = _repositoryUsuario.TableNoTracking.ProjectTo<UsuarioDTO>(_mapper.ConfigurationProvider).FirstOrDefault(x => x.NombreUsuario.ToUpper() == request.UserName.ToUpper());
            }
            else
            {
                usuario = _repositoryUsuario.TableNoTracking.ProjectTo<UsuarioDTO>(_mapper.ConfigurationProvider).FirstOrDefault(x => x.NombreUsuario.ToUpper() == user.Name.ToUpper());
            }
            if (usuario == null)
            {
                throw new Exception("No es posible obtener los filtros.");
            }
            
            if(request.Busqueda == null)
            {
                request.Busqueda = "";
            }

            List<OptionMWDTO> filtroProveedor = null;

            #region FiltroGestion
            if (request.Tipo == "Proveedor")
            {
                if (usuario.Rol.Nombre == "Comprador")
                {
                    var ocs = _repositoryOC.TableNoTracking.Where(x => x.CompradorId == usuario.Id && x.Proveedor.RazonSocial.Contains(request.Busqueda)).Select(x => x.ProveedorId).Distinct().ToList();
                    filtroProveedor = _repositoryProveedor.TableNoTracking
                                                        .Where(x => ocs.Contains(x.Id))
                                                        .OrderBy(x => x.RazonSocial)
                                                        .Skip((request.Page - 1) * request.PageSize)
                                                        .Take(request.PageSize)
                                                        .Select(x => new OptionMWDTO
                                                        {
                                                            Id = x.Id.ToString(),
                                                            Value = x.RazonSocial
                                                        }).ToList();
                }
                else
                {
                    var ocs = _repositoryOC.TableNoTracking.Where(x => x.Proveedor.RazonSocial.Contains(request.Busqueda)).Select(x => x.ProveedorId).Distinct().ToList();
                    filtroProveedor = _repositoryProveedor.TableNoTracking
                                                        .Where(x => ocs.Contains(x.Id))
                                                        .OrderBy(x => x.RazonSocial)
                                                        .Skip((request.Page - 1) * request.PageSize)
                                                        .Take(request.PageSize)
                                                        .Select(x => new OptionMWDTO
                                                        {
                                                            Id = x.Id.ToString(),
                                                            Value = x.RazonSocial
                                                        }).ToList();
                }

                return Task.FromResult(new ResponseBase<List<OptionMWDTO>>(filtroProveedor));
            }

            if (request.Tipo == "Compradores")
            {
                List<OptionMWDTO> filtroCompradores = null;
                if (usuario.Rol.Nombre == "Jefe de Abastecimiento")
                {
                    filtroCompradores = _repositoryUsuario.TableNoTracking
                                                                    .Where(x =>
                                                                        (x.Rol.Nombre == "Comprador")
                                                                        && (x.JefeDirectoId == usuario.Id)
                                                                        && (x.Nombre.Contains(request.Busqueda))
                                                                    )
                                                                    .OrderBy(x => x.Nombre)
                                                                    .Skip((request.Page - 1) * request.PageSize)
                                                                    .Take(request.PageSize)
                                                                    .Select(x => new OptionMWDTO
                                                                    {
                                                                        Value = x.GetNombreCompleto(),
                                                                        Id = x.Id.ToString(),
                                                                    }).ToList();


                }
                else if (usuario.Rol.Nombre == "Administrador")
                {
                    filtroCompradores = _repositoryUsuario.TableNoTracking
                                                                    .Where(x =>
                                                                        (x.Rol.Nombre == "Comprador")
                                                                        && (x.Nombre.Contains(request.Busqueda))
                                                                    )
                                                                    .OrderBy(x => x.Nombre)
                                                                    .Skip((request.Page - 1) * request.PageSize)
                                                                    .Take(request.PageSize)
                                                                    .Select(x => new OptionMWDTO
                                                                    {
                                                                        Value = x.GetNombreCompleto(),
                                                                        Id = x.Id.ToString()
                                                                    }).ToList();
                }

                return Task.FromResult(new ResponseBase<List<OptionMWDTO>>(filtroCompradores));

            }

            if (request.Tipo == "Perido")
            {
                List<OptionMWDTO> filtroCalendario = null;
                filtroCalendario = _repositoryCalendario.TableNoTracking
                                                        .Where(x => x.NombrePeriodo.Contains(request.Busqueda))
                                                        .OrderBy(x => x.Anio)
                                                        .ThenBy(x => x.Mes)
                                                        .Skip((request.Page - 1) * request.PageSize)
                                                        .Take(request.PageSize)
                                                        .Select(x => new OptionMWDTO
                                                        {
                                                            Value = x.NombrePeriodo,
                                                            Id = x.NombrePeriodo.ToUpper()
                                                        }).ToList();

                return Task.FromResult(new ResponseBase<List<OptionMWDTO>>(filtroCalendario));
            }

            if (request.Tipo == "UnidadProductiva")
            {
                List<OptionMWDTO> filtrosUP = null;

                if (usuario.Rol.Nombre == "Comprador")
                {
                    filtrosUP = _repositoryOC.TableNoTracking
                                                        .Where(x => x.CompradorId == usuario.Id && x.UnidadProductiva.Contains(request.Busqueda))
                                                        .Select(x => x.UnidadProductiva).Distinct()
                                                        .Skip((request.Page - 1) * request.PageSize)
                                                        .Take(request.PageSize)
                                                        .Select(x => new OptionMWDTO
                                                        {
                                                            Value = x,
                                                            Id = x.ToUpper()
                                                        }).ToList();
                }
                else
                {
                    filtrosUP = _repositoryOC.TableNoTracking.Where(x => x.UnidadProductiva.Contains(request.Busqueda)).Select(x => x.UnidadProductiva).Distinct().Select(x => new OptionMWDTO
                    {
                        Value = x,
                        Id = x.ToUpper()
                    }).ToList();
                }

                return Task.FromResult(new ResponseBase<List<OptionMWDTO>>(filtrosUP));
            }

            if (request.Tipo == "IndicadorFecha")
            {
                List<OptionMWDTO> filtrosF = null;

                var parametrosF = _repositoryParametro.TableNoTracking.Where(x => x.Nombre.Contains("Indicador Fecha Oportuna")).Select(x => x.Id).Distinct().ToList();
                filtrosF = _repositoryParametroValor.TableNoTracking
                                                        .Where(x => parametrosF.Contains(x.ParametroId) && x.Campo6.Contains(request.Busqueda))
                                                        .Skip((request.Page - 1) * request.PageSize)
                                                        .Take(request.PageSize)
                                                        .Select(x => new OptionMWDTO
                                                        {
                                                            Value = x.Campo1 + "-" + x.Campo6,
                                                            Id = $"{x.Campo1} {x.Campo6}"
                                                        }).Distinct().ToList();

                return Task.FromResult(new ResponseBase<List<OptionMWDTO>>(filtrosF));

            }

            if (request.Tipo == "IndicadorCantidad")
            {
                List<OptionMWDTO> filtrosIC = null;

                var parametrosC = _repositoryParametro.TableNoTracking.Where(x => x.Nombre.Contains("Cantidad")).Select(x => x.Id).Distinct().ToList();
                filtrosIC = _repositoryParametroValor.TableNoTracking
                                                        .Where(x => parametrosC.Contains(x.ParametroId) && x.Campo5.Contains(request.Busqueda))
                                                        .Skip((request.Page - 1) * request.PageSize)
                                                          .Take(request.PageSize)
                                                        .Select(x => new OptionMWDTO
                                                        {
                                                            Value = x.Campo5,
                                                            Id = x.Campo5.ToString()
                                                        }).Distinct().ToList();


                return Task.FromResult(new ResponseBase<List<OptionMWDTO>>(filtrosIC));
            }
            if (request.Tipo == "IndicadorCalidad")
            {
                List<OptionMWDTO> filtrosICal = null;

                var parametrosCal = _repositoryParametro.TableNoTracking.Where(x => x.Nombre.Contains("Calidad")).Select(x => x.Id).Distinct().ToList();
                filtrosICal = _repositoryParametroValor.TableNoTracking
                                                        .Where(x => parametrosCal.Contains(x.ParametroId) && x.Campo3.Contains(request.Busqueda))
                                                        .Skip((request.Page - 1) * request.PageSize)
                                                        .Take(request.PageSize)
                                                        .Select(x => new OptionMWDTO
                                                        {
                                                            Value = x.Campo3,
                                                            Id = x.Campo3.ToString()
                                                        }).Distinct().ToList();


                return Task.FromResult(new ResponseBase<List<OptionMWDTO>>(filtrosICal));
            }
            if (request.Tipo == "IndicadorDesempeno")
            {
                List<OptionMWDTO> filtrosD = null;
                List<OptionMWDTO> filtrosDMayor = null;
                List<OptionMWDTO> filtrosDMenor = null;

                var parametrosD = _repositoryParametro.TableNoTracking.Where(x => x.Nombre.Contains("Calificacion Minima de recibido")).Select(x => x.Id).Distinct().ToList();
                filtrosDMayor = _repositoryParametroValor.TableNoTracking
                                                        .Where(x => parametrosD.Contains(x.ParametroId) && x.Campo2.Contains(request.Busqueda))
                                                        .Skip((request.Page - 1) * request.PageSize)
                                                        .Take(request.PageSize)
                                                        .Select(x => new OptionMWDTO
                                                        {
                                                            Value = $"Mayor o Igual {x.Campo2} - {x.Campo1}",
                                                            Id = $"> {x.Campo2} {x.Campo1}"
                                                        }).Distinct().ToList();

                filtrosDMenor = _repositoryParametroValor.TableNoTracking
                                                        .Where(x => parametrosD.Contains(x.ParametroId) && x.Campo2.Contains(request.Busqueda))
                                                        .Skip((request.Page - 1) * request.PageSize)
                                                        .Take(request.PageSize)
                                                        .Select(x => new OptionMWDTO
                                                        {
                                                            Value = $"Menor a {x.Campo2} - {x.Campo1}",
                                                            Id = $"< {x.Campo2} {x.Campo1}"
                                                        }).Distinct().ToList();

                filtrosD = filtrosDMayor.Concat(filtrosDMenor).ToList();

                return Task.FromResult(new ResponseBase<List<OptionMWDTO>>(filtrosD));
            }
            if (request.Tipo == "Consignado")
            {
                List<OptionMWDTO> filtrosC = null;

                filtrosC = new OptionMWDTO[]
                    {
                    new OptionMWDTO { Value = "SI" , Id = "SI"},
                    new OptionMWDTO { Value = "NO" , Id = "NO"}
                    }.ToList();

                filtrosC = filtrosC.Where(x => x.Value.Contains(request.Busqueda)).ToList();
                return Task.FromResult(new ResponseBase<List<OptionMWDTO>>(filtrosC));
            }

            if (request.Tipo == "OC")
            {
                List<OptionMWDTO> filtroOC = null;

                filtroOC = _repositoryOC.TableNoTracking
                                                        .Where(x => x.NumOC.Contains(request.Busqueda))
                                                        .OrderBy(x => x.NumOC)
                                                        .Select(x => x.NumOC).Distinct()
                                                        .Skip((request.Page - 1) * request.PageSize)
                                                        .Take(request.PageSize)
                                                        .Select(x => new OptionMWDTO
                                                        {
                                                            Id = x.ToString(),
                                                            Value = x
                                                        }).ToList();

                return Task.FromResult(new ResponseBase<List<OptionMWDTO>>(filtroOC));
            }

            if (request.Tipo == "CodigoInsumo")
            {
                List<OptionMWDTO> filtroCI = null;

                filtroCI = _repositoryOC.TableNoTracking
                                                        .Where(x => x.CodInsumoServ.Contains(request.Busqueda))
                                                        .OrderBy(x => x.CodInsumoServ)
                                                        .Select(x => x.CodInsumoServ).Distinct()
                                                        .Skip((request.Page - 1) * request.PageSize)
                                                        .Take(request.PageSize)
                                                        .Select(x => new OptionMWDTO
                                                        {
                                                            Id = x.ToString(),
                                                            Value = x
                                                        }).ToList();

                return Task.FromResult(new ResponseBase<List<OptionMWDTO>>(filtroCI));
            }
            #endregion






            #region FiltroReportes

            if (request.Tipo == "ProveedorReporte")
            {
                List<OptionMWDTO> filtroProveedorReporte = null;

                filtroProveedorReporte = _repositoryProveedor.TableNoTracking
                                                        .Where(x => x.RazonSocial.Contains(request.Busqueda))
                                                        .OrderBy(x => x.RazonSocial)
                                                        .Skip((request.Page - 1) * request.PageSize)
                                                        .Take(request.PageSize)
                                                        .Select(x => new OptionMWDTO
                                                        {
                                                            Id = x.Id.ToString(),
                                                            Value = x.RazonSocial
                                                        }).ToList();

                return Task.FromResult(new ResponseBase<List<OptionMWDTO>>(filtroProveedorReporte));
            }

            if (request.Tipo == "CompradoresReporte")
            {
                List<OptionMWDTO> filtroCompradoresReporte = null;

                filtroCompradoresReporte = _repositoryUsuario.TableNoTracking
                                                                    .Where(x =>
                                                                        (x.Rol.Nombre == "Comprador")
                                                                        && (x.Nombre.Contains(request.Busqueda))
                                                                    )
                                                                    .OrderBy(x => x.Nombre)
                                                                    .Skip((request.Page - 1) * request.PageSize)
                                                                    .Take(request.PageSize)
                                                                    .Select(x => new OptionMWDTO
                                                                    {
                                                                        Value = x.GetNombreCompleto(),
                                                                        Id = x.Id.ToString()
                                                                    }).ToList();

                return Task.FromResult(new ResponseBase<List<OptionMWDTO>>(filtroCompradoresReporte));
            }

            if (request.Tipo == "UnidadProductivaReporte")
            {
                List<OptionMWDTO> filtrosUPReporte = null;

                filtrosUPReporte = _repositoryOC.TableNoTracking.Where(x => x.UnidadProductiva.Contains(request.Busqueda)).Select(x => x.UnidadProductiva).Distinct().Select(x => new OptionMWDTO
                {
                    Value = x,
                    Id = x.ToUpper()
                }).ToList();

                return Task.FromResult(new ResponseBase<List<OptionMWDTO>>(filtrosUPReporte));
            }

            if (request.Tipo == "calendario")
            {
                List<OptionMWDTO> filtrosC = null;

                filtrosC = _repositoryCalendario.TableNoTracking
                                                        .OrderBy(x => x.Anio)
                                                        .ThenBy(x => x.Mes)
                                                        .Select(x => x.Anio).Distinct()
                                                        .Skip((request.Page - 1) * request.PageSize)
                                                        .Take(request.PageSize)
                                                        .Select(x => new OptionMWDTO
                                                        {
                                                            Id = x.ToString(),
                                                            Value = x.ToString()
                                                        }).ToList();

                filtrosC = filtrosC.Where(x => x.Value.Contains(request.Busqueda)).ToList();

                return Task.FromResult(new ResponseBase<List<OptionMWDTO>>(filtrosC));
            }

            if (request.Tipo == "trimestre")
            {
                List<OptionMWDTO> filtrosT = null;

                filtrosT = _repositoryCalendario.TableNoTracking
                                                        .Where(x => x.Anio > DateTime.Now.Year - 5)
                                                        .OrderBy(x => x.Anio)
                                                        .ThenBy(x => x.Mes)
                                                        .Skip((request.Page - 1) * request.PageSize)
                                                        .Take(request.PageSize)
                                                        .Select(x => new OptionMWDTO
                                                        {
                                                            Id = x.Trimestre.ToString(),
                                                            Value = $"T{x.Trimestre}"
                                                        }).Distinct().ToList();

                filtrosT = filtrosT.Where(x => x.Value.Contains(request.Busqueda)).ToList();

                return Task.FromResult(new ResponseBase<List<OptionMWDTO>>(filtrosT));
            }

            if (request.Tipo == "desempenio")
            {
                List<OptionMWDTO> filtrosD = null;

                filtrosD = new OptionMWDTO[]
                    {
                    new OptionMWDTO { Value = "Alto Desempeño" , Id = "AD"},
                    new OptionMWDTO { Value = "Bajo Desempeño" , Id = "BD"}
                    }.ToList();

                filtrosD = filtrosD.Where(x => x.Value.Contains(request.Busqueda)).ToList();
                return Task.FromResult(new ResponseBase<List<OptionMWDTO>>(filtrosD));
            }

            if (request.Tipo == "IndicadorFechaReporte")
            {
                List<OptionMWDTO> filtrosF = null;

                var parametrosF = _repositoryParametro.TableNoTracking.Where(x => x.Nombre.Contains("Indicador Fecha Oportuna")).Select(x => x.Id).Distinct().ToList();
                filtrosF = _repositoryParametroValor.TableNoTracking
                                                        .Where(x => parametrosF.Contains(x.ParametroId) && x.Campo6.Contains(request.Busqueda))
                                                        .Skip((request.Page - 1) * request.PageSize)
                                                        .Take(request.PageSize)
                                                        .Select(x => new OptionMWDTO
                                                        {
                                                            Value = $"{Convert.ToInt32(Convert.ToDecimal(x.Campo6) * 10)} %",
                                                            Id = $"{x.Campo6}"
                                                        }).Distinct().ToList();

                return Task.FromResult(new ResponseBase<List<OptionMWDTO>>(filtrosF));

            }

            if (request.Tipo == "IndicadorCantidadReporte")
            {
                List<OptionMWDTO> filtrosIC = null;

                var parametrosC = _repositoryParametro.TableNoTracking.Where(x => x.Nombre.Contains("Cantidad")).Select(x => x.Id).Distinct().ToList();
                filtrosIC = _repositoryParametroValor.TableNoTracking
                                                        .Where(x => parametrosC.Contains(x.ParametroId) && x.Campo5.Contains(request.Busqueda))
                                                        .Skip((request.Page - 1) * request.PageSize)
                                                          .Take(request.PageSize)
                                                        .Select(x => new OptionMWDTO
                                                        {
                                                            Value = $"{Convert.ToInt32(Convert.ToDecimal(x.Campo5) * 10)} %",
                                                            Id = x.Campo5.ToString()
                                                        }).Distinct().ToList();


                return Task.FromResult(new ResponseBase<List<OptionMWDTO>>(filtrosIC));
            }

            if (request.Tipo == "IndicadorCalidadReporte")
            {
                List<OptionMWDTO> filtrosICal = null;

                var parametrosCal = _repositoryParametro.TableNoTracking.Where(x => x.Nombre.Contains("Calidad")).Select(x => x.Id).Distinct().ToList();
                filtrosICal = _repositoryParametroValor.TableNoTracking
                                                        .Where(x => parametrosCal.Contains(x.ParametroId) && x.Campo3.Contains(request.Busqueda))
                                                        .Skip((request.Page - 1) * request.PageSize)
                                                        .Take(request.PageSize)
                                                        .Select(x => new OptionMWDTO
                                                        {
                                                            Value = $"{Convert.ToInt32(Convert.ToDecimal(x.Campo3) * 10)} %",
                                                            Id = x.Campo3.ToString()
                                                        }).Distinct().ToList();


                return Task.FromResult(new ResponseBase<List<OptionMWDTO>>(filtrosICal));
            }



            #endregion

            return Task.FromResult(new ResponseBase<List<OptionMWDTO>>(new List<OptionMWDTO>()));
        }
    }
}

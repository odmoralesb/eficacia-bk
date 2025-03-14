using AutoMapper;
using AutoMapper.QueryableExtensions;
using MediatR;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using TQ.Pagination;
using TQ.Proveedores.Domain.Evaluaciones;
using TQ.Repository.Abstractions;
using TQ.Util.MediatRUtils;

namespace TQ.Proveedores.Application.SolicitudesCambioEstado.Queries
{
    public class GetSolicitudesCambioEstadoQuery : IRequest<ResponseBase<PagedResult<SolicitudCambioEstadoDTO>>>
    {
        public int Page { get; set; }
        public int PageSize { get; set; }
        public string Term { get; set; }

        public GetSolicitudesCambioEstadoQuery()
        {
            Term = "";
            Page = 1;
            PageSize = 10;
        }
    }

    public class GetSolicitudCambioEstadoQueryHandler : IRequestHandler<GetSolicitudesCambioEstadoQuery, ResponseBase<PagedResult<SolicitudCambioEstadoDTO>>>
    {
        private readonly IRepository<SolicitudCambioEstado> _repository;
        private readonly IMapper _mapper;

        public GetSolicitudCambioEstadoQueryHandler(IRepository<SolicitudCambioEstado> repository, IMapper mapper)
        {
            _mapper = mapper;
            _repository = repository;
        }

        public Task<ResponseBase<PagedResult<SolicitudCambioEstadoDTO>>> Handle(GetSolicitudesCambioEstadoQuery request, CancellationToken cancellationToken)
        {
            IQueryable<SolicitudCambioEstadoDTO> solicitudes = _repository.TableNoTracking.Where(x => x.Estado != "Reenviada").Select(x => new SolicitudCambioEstadoDTO
            {
                Id = x.Id.ToString(),
                ProveedorId = x.ProveedorId.ToString(),
                NombreProveedor = x.Proveedor.RazonSocial,
                CompradorId = x.CompradorId.ToString(),
                NombreComprador = x.Comprador.Nombre + " " + x.Comprador.Apellido,
                AprobadorId = x.AprobadorId.ToString(),
                NombreAprobador = x.Aprobador.Nombre + " " + x.Aprobador.Apellido,
                NombreUsuarioComprador = x.Comprador.NombreUsuario,
                NombreUsuarioAprobador = x.Aprobador.NombreUsuario,
                Periodo = x.Periodo,
                FechaCreacion = x.FechaCreacion.ToString("dd/MM/yyyy"),
                Estado = x.Estado,
                Observaciones = x.Observaciones
            });

            return Task.FromResult(new ResponseBase<PagedResult<SolicitudCambioEstadoDTO>>(solicitudes.ToList().OrderByDescending(x => x.FechaCreacion).GetPaged(request.Page, request.PageSize)));
        }
    }
}

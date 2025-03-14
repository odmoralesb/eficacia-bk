using AutoMapper;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using TQ.Proveedores.Domain.OrdenesDeCompra;
using TQ.Repository.Abstractions;
using TQ.Util.MediatRUtils;

namespace TQ.Proveedores.Application.OrdenesDeCompra.Queries
{
    public class GetEventoQuery : IRequest<ResponseBase<List<EventoDTO>>>
    {
        public Guid OrdenCompraId { get; set; }
        public string Periodo { get; set; }
        public Guid eventoId { get; set; }
    }

    public class GetEventoQueryHandler : IRequestHandler<GetEventoQuery, ResponseBase<List<EventoDTO>>>
    {
        private readonly IRepository<Evento> _repositoryEvento;
        private readonly IMapper _mapper;

        public GetEventoQueryHandler(IRepository<Evento> repositoryEvento, IMapper mapper)
        {
            _repositoryEvento = repositoryEvento;
            _mapper = mapper;
        }

        public Task<ResponseBase<List<EventoDTO>>> Handle(GetEventoQuery request, CancellationToken cancellationToken)
        {
            List<EventoDTO> eventos = _repositoryEvento.TableNoTracking
                                                .Where(x =>
                                                    (x.Id == request.eventoId)
                                                    && (x.Periodo == request.Periodo)
                                                )
                                                .Select(x => new EventoDTO
                                                {
                                                    Id = x.Id,
                                                    Proveedor = x.OrdenCompra.Proveedor.RazonSocial,
                                                    NumOc = x.NumOC,
                                                    Periodo = x.Periodo,
                                                    Codigo = x.OrdenCompra.CodInsumoServ,
                                                    Descripcion = x.OrdenCompra.DescInsumoServ,
                                                    UnidadMedida = x.OrdenCompra.UnidadMedida,
                                                    TipoInsumo = x.OrdenCompra.TipoInsumo,
                                                    Moneda = x.OrdenCompra.Moneda,
                                                    FechaCreacion = x.OrdenCompra.FechaCreacion,
                                                    FechaDespacho = x.FechaDespacho,
                                                    FechaRecibo = x.FechaRecepcion,
                                                    LTM = x.LeadTimeMaestra,
                                                    LTC = x.LeadTimeCalculado,
                                                    LTR = x.LeadTimeReal,
                                                    Dias = x.Dias,
                                                    DiasAtraso = x.DiasAtraso,
                                                    CantidadPedida = x.CantidadSolicitada,
                                                    CantidadAceptada = x.CantidadAceptada,
                                                    CantidadDevuelta = x.CantidadDevuelta,
                                                    IndicadorFecha = x.IndicadorFecha,
                                                    IndicadorFechaSys = x.IndicadorFechaSys,
                                                    IndicadorCantidad = x.IndicadorCantidad,
                                                    IndicadorCantidadSys = x.IndicadorCantidadSys,
                                                    IndicadorCalidad = x.IndicadorCalidad,
                                                    IndicadorCalidadSys = x.IndicadorCalidadSys,
                                                    Cumplimiento = x.IndicadorCumplimientoDefinitivo,
                                                    Urgencia = x.Urgencia ? "SI" : "NO",
                                                    Rechazo = x.CodigoCalidad == "RECHAZADO" ? "SI" : "NO",
                                                    Consignado = x.Consignado ? "SI" : "NO",
                                                    CodigoCausal = x.Causal != null ? x.Causal.CodigoCausal : null,
                                                    Comentario = x.Comentario,
                                                    CompraDesarrollo = x.OrdenCompra.CompraDesarrollo
                                                })
                                                .ToList();


            return Task.FromResult(new ResponseBase<List<EventoDTO>>(eventos));

        }
    }
}

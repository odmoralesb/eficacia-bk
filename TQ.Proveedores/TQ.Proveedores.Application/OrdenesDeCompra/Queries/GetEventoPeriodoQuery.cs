using AutoMapper;
using AutoMapper.QueryableExtensions;
using DocumentFormat.OpenXml.Spreadsheet;
using DocumentFormat.OpenXml.Wordprocessing;
using MediatR;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using TQ.Proveedores.Application.Configuracion.Queries;
using TQ.Proveedores.Application.Evaluaciones.Queries;
using TQ.Proveedores.Domain.Configuracion;
using TQ.Proveedores.Domain.Maestras;
using TQ.Proveedores.Domain.OrdenesDeCompra;
using TQ.Repository.Abstractions;
using TQ.Util.MediatRUtils;

namespace TQ.Proveedores.Application.OrdenesDeCompra.Queries
{
    public class GetEventoPeriodoQuery : IRequest<List<string>>
    {
    }

    public class GetEventoPeriodoQueryHandler : IRequestHandler<GetEventoPeriodoQuery, List<string>>
    {
        private readonly IRepository<Evento> _repositoryEvento;

        public GetEventoPeriodoQueryHandler(IRepository<Evento> repositoryEvento)
        {
            _repositoryEvento = repositoryEvento;
        }

        public Task<List<string>> Handle(GetEventoPeriodoQuery request, CancellationToken cancellationToken)
        {
            List<string> response = _repositoryEvento.GetAll().Select(x => x.Periodo).Distinct().ToList();

            return Task.FromResult(new List<string>(response));

        }
    }
}

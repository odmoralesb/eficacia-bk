using AutoMapper;
using MediatR;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using TQ.Proveedores.Domain.Parametros;
using TQ.Repository.Abstractions;
using TQ.Util.MediatRUtils;

namespace TQ.Proveedores.Application.Parametros.Queries
{
    public class GetParametroQuery : IRequest<ResponseBase<List<ParametroDTO>>>
    {
    }

    public class GetParametroQueryHandler : IRequestHandler<GetParametroQuery, ResponseBase<List<ParametroDTO>>>
    {
        private readonly IRepository<Parametro> _repositoryParametro;
        private readonly IMapper _mapper;

        public GetParametroQueryHandler(IRepository<Parametro> repositoryParametro, IMapper mapper)
        {
            _repositoryParametro = repositoryParametro;
            _mapper = mapper;
        }

        public Task<ResponseBase<List<ParametroDTO>>> Handle(GetParametroQuery request, CancellationToken cancellationToken)
        {
            var parametros = _repositoryParametro.TableNoTracking.Select(x => new ParametroDTO()
            {
                Id = x.Id,
                Nombre = x.Nombre,
                Descripcion = x.Descripcion,
                Detalles = _mapper.Map<List<ParametroDetalleDTO>>(x.Detalles.OrderBy(x => x.NumCampo).ToList()),
                Valores = _mapper.Map<List<ParametroValorDTO>>(x.Valores.ToList())
            });
            var dto = parametros.ToList();
            return Task.FromResult(new ResponseBase<List<ParametroDTO>>(dto));
        }
    }
}

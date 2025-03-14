using AutoMapper;
using MediatR;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using TQ.GuidGenerator;
using TQ.Proveedores.Application.Exceptions;
using TQ.Proveedores.Domain.Enums;
using TQ.Proveedores.Domain.Parametros;
using TQ.Repository.Abstractions;
using TQ.Util.MediatRUtils;
using TQ.Utils.AutoMapperUtils;

namespace TQ.Proveedores.Application.Parametros.Commands
{
    public class CreateParametroDetalleCommand : IMapFrom<ParametroDetalle>
    {
        public int NumCampo { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public TipoParametro TipoParametro { get; set; }
    }

    public class CreateParametroValorCommand : IMapFrom<ParametroValor>
    {
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
    }

    public class CreateParametroCommand : IRequest<ResponseBase<Guid>>, IMapFrom<Parametro>
    {
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public List<CreateParametroDetalleCommand> Detalles { get; set;}
        public List<CreateParametroValorCommand> Valores { get; set; }
    }

    public class CreateParametroCommandHandler : IRequestHandler<CreateParametroCommand, ResponseBase<Guid>>
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IRepository<Parametro> _repositoryParametro;
        private readonly IRepository<ParametroDetalle> _repositoryDetalle;
        private readonly IRepository<ParametroValor> _repositoryValor;
        private readonly IMapper _mapper;

        public CreateParametroCommandHandler(IUnitOfWork unitOfWork, IRepository<Parametro> repositoryParametro, IRepository<ParametroDetalle> repositoryDetalle, IRepository<ParametroValor> repositoryValor, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _repositoryParametro = repositoryParametro;
            _repositoryDetalle = repositoryDetalle;
            _repositoryValor = repositoryValor;
            _mapper = mapper;
        }
        public async Task<ResponseBase<Guid>> Handle(CreateParametroCommand request, CancellationToken cancellationToken)
        {
            // Verificar que no exista un parámetro ya creado
            bool existParametro = _repositoryParametro.Count(x => x.Nombre == request.Nombre) > 0;
            if (existParametro)
            {
                throw new DataException("El parámetro que intenta crear ya existe");
            }

            // Se crea la entidad parámetro
            Parametro parametro = _mapper.Map<Parametro>(request);
            parametro.Detalles = new List<ParametroDetalle>();
            parametro.Valores = new List<ParametroValor>();
            parametro.Id = SequentialGuid.Create();
            _repositoryParametro.Insert(parametro);

            // Se crean los detalles del parámetro
            if (request.Detalles.Count == 0)
            {
                throw new BadRequestException("El parámetro que intenta crear no tiene una estructura definida");
            }

            bool hayRepetidos = false;
            hayRepetidos = request.Detalles.GroupBy(x => x.NumCampo).Where(g => g.Count() > 1).Select(g => g.Key).Any();
            if (hayRepetidos)
            {
                throw new BadRequestException("El parámetro que intenta actualizar tiene número de columnas repetidos.");
            }

            hayRepetidos = request.Detalles.GroupBy(x => x.Nombre).Where(g => g.Count() > 1).Select(g => g.Key).Any();
            if (hayRepetidos)
            {
                throw new BadRequestException("El parámetro que intenta actualizar tiene nombre de columnas repetidos.");
            }

            // Si se configura columnas de intervalos, que estén ambos limites
            int limiteInferior = request.Detalles.Where(x => x.TipoParametro == TipoParametro.INTERVALO_MENOR).Count();
            int limiteSuperior = request.Detalles.Where(x => x.TipoParametro == TipoParametro.INTERVALO_MAYOR).Count();
            if (limiteInferior != limiteSuperior)
            {
                throw new BadRequestException("Los intervalos no están bien definidos. Debe existir un intervalor mayor y uno menor");
            }

            foreach(CreateParametroDetalleCommand requestDetalle in request.Detalles)
            {
                ParametroDetalle detalle = _mapper.Map<ParametroDetalle>(requestDetalle);
                detalle.Id = SequentialGuid.Create();
                detalle.ParametroId = parametro.Id;
                _repositoryDetalle.Insert(detalle);
            }

            // Se crean los valores del parámetro
            if (request.Valores.Count == 0)
            {
                throw new BadRequestException("El parámetro que intenta crear no tiene valores parametrizados");
            }

            foreach (CreateParametroValorCommand requestValor in request.Valores)
            {
                ParametroValor valor = _mapper.Map<ParametroValor>(requestValor);
                valor.Id = SequentialGuid.Create();
                valor.ParametroId = parametro.Id;
                _repositoryValor.Insert(valor);
            }

            await _unitOfWork.CommitAsync(cancellationToken);

            return new ResponseBase<Guid>(parametro.Id);
        }
    }
}

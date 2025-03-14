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
    public class UpdateParametroDetalleCommand : IMapFrom<ParametroDetalle>
    {
        public Guid? Id { get; set; }
        public int NumCampo { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public TipoParametro TipoParametro { get; set; }
    }

    public class UpdateParametroValorCommand : IMapFrom<ParametroValor>
    {
        public Guid? Id { get; set; }
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

    public class UpdateParametroCommand : IRequest<ResponseBase<Guid>>, IMapFrom<Parametro>
    {
        public Guid Id { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public List<UpdateParametroDetalleCommand> Detalles { get; set; }
        public List<UpdateParametroValorCommand> Valores { get; set; }
    }

    public class UpdateParametroCommandHandler : IRequestHandler<UpdateParametroCommand, ResponseBase<Guid>>
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IRepository<Parametro> _repositoryParametro;
        private readonly IRepository<ParametroDetalle> _repositoryDetalle;
        private readonly IRepository<ParametroValor> _repositoryValor;
        private readonly IMapper _mapper;

        public UpdateParametroCommandHandler(IUnitOfWork unitOfWork, IRepository<Parametro> repositoryParametro, IRepository<ParametroDetalle> repositoryDetalle, IRepository<ParametroValor> repositoryValor, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _repositoryParametro = repositoryParametro;
            _repositoryDetalle = repositoryDetalle;
            _repositoryValor = repositoryValor;
            _mapper = mapper;
        }

        public async Task<ResponseBase<Guid>> Handle(UpdateParametroCommand request, CancellationToken cancellationToken)
        {
            // Verificar que el parámetro exista
            Parametro parametro = _repositoryParametro.GetById(request.Id);
            if (parametro == null)
            {
                throw new DataException("El parámetro que intenta actualizar no existe.");
            }
            // Actualizar los datos del parámetro
            parametro.Nombre = request.Nombre;
            parametro.Descripcion = request.Descripcion;
            _repositoryParametro.Update(parametro);

            // Se crean/actualizan los detalles del parámetro
            if (request.Detalles.Count == 0)
            {
                throw new BadRequestException("El parámetro que intenta actualizar no tiene una estructura definida");
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

            foreach (UpdateParametroDetalleCommand requestDetalle in request.Detalles)
            {
                if (requestDetalle.Id == null)
                {
                    ParametroDetalle detalle = _mapper.Map<ParametroDetalle>(requestDetalle);
                    detalle.Id = SequentialGuid.Create();
                    detalle.ParametroId = parametro.Id;
                    _repositoryDetalle.Insert(detalle);
                }
                else
                {
                    ParametroDetalle detalle = _repositoryDetalle.GetById(requestDetalle.Id);
                    detalle.NumCampo = requestDetalle.NumCampo;
                    detalle.Nombre = requestDetalle.Nombre;
                    detalle.Descripcion = requestDetalle.Descripcion;
                    detalle.TipoParametro = requestDetalle.TipoParametro;
                    _repositoryDetalle.Update(detalle);
                }   
            }

            // Eliminar los detalles que no estén
            List<Guid?> ids = request.Detalles.Select(x => x.Id).ToList();
            List<ParametroDetalle> detallesEliminar = _repositoryDetalle.GetMany(x => !ids.Contains(x.Id) && x.ParametroId == request.Id).ToList();
            foreach(ParametroDetalle detalleEliminar in detallesEliminar)
            {
                _repositoryDetalle.Delete(detalleEliminar);
            }

            // Se crean/actualizan los valores del parámetro
            if (request.Valores.Count == 0)
            {
                throw new BadRequestException("El parámetro que intenta crear no tiene valores parametrizados");
            }

            foreach (UpdateParametroValorCommand requestValor in request.Valores)
            {
                if (requestValor.Id == null)
                {
                    ParametroValor valor = _mapper.Map<ParametroValor>(requestValor);
                    valor.Id = SequentialGuid.Create();
                    valor.ParametroId = parametro.Id;
                    _repositoryValor.Insert(valor);
                }
                else
                {
                    ParametroValor valor = _repositoryValor.GetById(requestValor.Id);
                    valor.Campo1 = requestValor.Campo1;
                    valor.Campo2 = requestValor.Campo2;
                    valor.Campo3 = requestValor.Campo3;
                    valor.Campo4 = requestValor.Campo4;
                    valor.Campo5 = requestValor.Campo5;
                    valor.Campo6 = requestValor.Campo6;
                    valor.Campo7 = requestValor.Campo7;
                    valor.Campo8 = requestValor.Campo8;
                    valor.Campo9 = requestValor.Campo9;
                    valor.Campo10 = requestValor.Campo10;
                    _repositoryValor.Update(valor);
                }
            }

            // Eliminar los valores que no estén
            ids = request.Valores.Select(x => x.Id).ToList();
            List<ParametroValor> valoresEliminar = _repositoryValor.GetMany(x => !ids.Contains(x.Id) && x.ParametroId == request.Id).ToList();
            foreach (ParametroValor detalleEliminar in valoresEliminar)
            {
                _repositoryValor.Delete(detalleEliminar);
            }

            await _unitOfWork.CommitAsync(cancellationToken);

            return new ResponseBase<Guid>(parametro.Id);
        }
    }
}

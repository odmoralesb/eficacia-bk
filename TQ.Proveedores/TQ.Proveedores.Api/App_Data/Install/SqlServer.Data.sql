    -- /** 
-- CARGA INICIAL DE INFORMACIÓN

--- ROLES
IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'EP_Rol'))
    BEGIN
        IF ((SELECT COUNT(*) FROM EP_Rol) = 0)
            BEGIN                 
                INSERT INTO EP_Rol (Id,Nombre,CreateTime,UpdateTime,UpdatedBy,CreatedBy)
                VALUES (NEWID(),'Administrador',GETDATE(),GETDATE(),'SISTEMA','SISTEMA');
                INSERT INTO EP_Rol (Id,Nombre,CreateTime,UpdateTime,UpdatedBy,CreatedBy)
                VALUES (NEWID(),'Jefe de Abastecimiento',GETDATE(),GETDATE(),'SISTEMA','SISTEMA');
                INSERT INTO EP_Rol (Id,Nombre,CreateTime,UpdateTime,UpdatedBy,CreatedBy)
                VALUES (NEWID(),'Comprador',GETDATE(),GETDATE(),'SISTEMA','SISTEMA');
            END;
    END;

--- PARAMETROS
IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'EP_Parametro'))
    BEGIN
        IF ((SELECT COUNT(*) FROM EP_Parametro) = 0)
            BEGIN
                INSERT EP_Parametro (Id, Nombre, Descripcion, CreateTime, UpdateTime, UpdatedBy, CreatedBy, OrganizacionId) VALUES ('841d69ee-33bd-4005-a052-13a8112544e6', 'Dias Antes de la Fecha Limite Aprobacion', 'Cantidad de Dias Antes de la Fecha Limite para Aprobar', CAST('2024-07-15T16:02:31.5166667' AS DateTime2), CAST('2024-07-15T16:02:31.5166667' AS DateTime2), 'SISTEMA', 'SISTEMA', 155)
                INSERT EP_Parametro (Id, Nombre, Descripcion, CreateTime, UpdateTime, UpdatedBy, CreatedBy, OrganizacionId) VALUES ('c7114724-35ca-4563-bf8b-13b3e7893108', 'Dias Habiles Aprobacion', 'Cantidad Maxima de Dias Habiles para Aprobar despues del cierre TQ', CAST('2024-07-15T16:02:31.5166667' AS DateTime2), CAST('2024-07-15T16:02:31.5166667' AS DateTime2), 'SISTEMA', 'SISTEMA', 155)
                INSERT EP_Parametro (Id, Nombre, Descripcion, CreateTime, UpdateTime, UpdatedBy, CreatedBy, OrganizacionId) VALUES ('7745113e-625b-7d7f-d712-3a13ce82f092', 'Indicador Cantidad', 'Parámetro de desempeño del indicador de Cantidad.', CAST('2024-07-16T11:17:57.4816932' AS DateTime2), CAST('2024-07-16T11:56:47.1814295' AS DateTime2), 'SISTEMA', 'SISTEMA', 155)
                INSERT EP_Parametro (Id, Nombre, Descripcion, CreateTime, UpdateTime, UpdatedBy, CreatedBy, OrganizacionId) VALUES ('42b5a024-e432-c738-e9ea-3a13cfb7f102', 'Indicador Calidad', 'Parámetro de desempeño de indicador Calidad por estado de lotes', CAST('2024-07-16T16:55:31.8707718' AS DateTime2), CAST('2024-07-16T16:55:31.8707718' AS DateTime2), 'SISTEMA', 'SISTEMA', 155)
                INSERT EP_Parametro (Id, Nombre, Descripcion, CreateTime, UpdateTime, UpdatedBy, CreatedBy, OrganizacionId) VALUES ('32dc2bf1-e4cc-1b43-47db-3a13d3864165', 'Indicador Fecha Oportuna Nacional', 'Parámetro de desempeño del indicador de fecha para órdenes de compra nacional', CAST('2024-07-17T10:39:40.9258581' AS DateTime2), CAST('2024-07-17T10:39:40.9258581' AS DateTime2), 'SISTEMA', 'SISTEMA', 155)
                INSERT EP_Parametro (Id, Nombre, Descripcion, CreateTime, UpdateTime, UpdatedBy, CreatedBy, OrganizacionId) VALUES ('2ecba4d6-dc49-499b-7c74-3a13d3883059', 'Indicador Fecha Oportuna Importado', 'Parámetro de desempeño de fecha para órdenes de compra importados', CAST('2024-07-17T10:41:47.4827274' AS DateTime2), CAST('2024-07-17T10:41:47.4827274' AS DateTime2), 'SISTEMA', 'SISTEMA', 155)
                INSERT EP_Parametro (Id, Nombre, Descripcion, CreateTime, UpdateTime, UpdatedBy, CreatedBy, OrganizacionId) VALUES ('a34ba33e-f24f-2a2c-977a-3a13d38c4845', 'Calificacion Cualitativa Mensual', 'Calificación cualitativa del desempeño consolidado', CAST('2024-07-17T10:46:15.7504135' AS DateTime2), CAST('2024-07-17T10:46:15.7504135' AS DateTime2), 'SISTEMA', 'SISTEMA', 155)
                INSERT EP_Parametro (Id, Nombre, Descripcion, CreateTime, UpdateTime, UpdatedBy, CreatedBy, OrganizacionId) VALUES ('d99e711f-0baa-4690-ac55-5fde17ae169e', 'Frecuencia Envio Reporte Consolidado', 'Frecuencia en meses de envío del reporte consolidado trimestral a los proveedores', CAST('2024-07-15T16:02:31.5166667' AS DateTime2), CAST('2024-07-16T11:57:33.2391736' AS DateTime2), 'SISTEMA', 'SISTEMA', 155)
                INSERT EP_Parametro (Id, Nombre, Descripcion, CreateTime, UpdateTime, UpdatedBy, CreatedBy, OrganizacionId) VALUES ('f88e4340-e642-4dbc-9501-ca5b725d77d7', 'Calificacion Minima de recibido', 'Calificacion Minima de recibido para Insumo Nacional e Internacional', CAST('2024-07-15T16:02:31.5166667' AS DateTime2), CAST('2024-07-15T16:02:31.5166667' AS DateTime2), 'SISTEMA', 'SISTEMA', 155)
                INSERT EP_Parametro (Id, Nombre, Descripcion, CreateTime, UpdateTime, UpdatedBy, CreatedBy, OrganizacionId) VALUES ('cb48f3d6-8052-4e4d-b0dd-d38d4255ff0e', 'Excepciones', 'Excepciones en la Generacion de Reporte Consolidado Trimestral', CAST('2024-07-15T16:02:31.5166667' AS DateTime2), CAST('2024-07-15T16:02:31.5166667' AS DateTime2), 'SISTEMA', 'SISTEMA', 155)
                INSERT EP_Parametro (Id, Nombre, Descripcion, CreateTime, UpdateTime, UpdatedBy, CreatedBy, OrganizacionId) VALUES ('c905a3fc-4fcc-4bf9-a3d3-f0b4be17faad', 'Porcentaje Minimo Aprobacion Mensual', 'Porcentaje Minimo de Aprobacion Mensual del Proveedor', CAST('2024-07-15T16:02:31.5166667' AS DateTime2), CAST('2024-07-15T16:02:31.5166667' AS DateTime2), 'SISTEMA', 'SISTEMA', 155)
                INSERT EP_Parametro (Id, Nombre, Descripcion, CreateTime, UpdateTime, UpdatedBy, CreatedBy, OrganizacionId) VALUES ('136C9EE9-25BA-246F-E2D4-3A149346DB78','Objetivo Eficacia','Meta de la grafica', CAST('2024-07-15T16:02:31.5166667' AS DateTime2), CAST('2024-07-15T16:02:31.5166667' AS DateTime2),'SISTEMA','SISTEMA',155)
                INSERT EP_ParametroDetalle (Id, NumCampo, Nombre, Descripcion, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy, TipoParametro) VALUES ('1dc0794d-79d0-4167-a14a-0214d079beab', 3, 'Valor', 'Valor a excluir con la operacion', 'cb48f3d6-8052-4e4d-b0dd-d38d4255ff0e', CAST('2024-07-15T16:02:31.5466667' AS DateTime2), CAST('2024-07-15T16:02:31.5466667' AS DateTime2), 'SISTEMA', 'SISTEMA', 5)
                INSERT EP_ParametroDetalle (Id, NumCampo, Nombre, Descripcion, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy, TipoParametro) VALUES ('d110f3b5-0825-4c61-9da8-04fb286df137', 1, 'Porcentaje', 'N?mero porcentual', 'c905a3fc-4fcc-4bf9-a3d3-f0b4be17faad', CAST('2024-07-15T16:02:31.5266667' AS DateTime2), CAST('2024-07-15T16:02:31.5266667' AS DateTime2), 'SISTEMA', 'SISTEMA', 4)
                INSERT EP_ParametroDetalle (Id, NumCampo, Nombre, Descripcion, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy, TipoParametro) VALUES ('0a45cf5b-f7ac-4b24-8c9d-1259d4482ecd', 1, 'Dias', 'Cantidad Dias Limite', '841d69ee-33bd-4005-a052-13a8112544e6', CAST('2024-07-15T16:02:31.5300000' AS DateTime2), CAST('2024-07-15T16:02:31.5300000' AS DateTime2), 'SISTEMA', 'SISTEMA', 4)
                INSERT EP_ParametroDetalle (Id, NumCampo, Nombre, Descripcion, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy, TipoParametro) VALUES ('f3ccefb3-edc0-49b9-980e-16c27a663e86', 1, 'Columna', 'Nombre de la columna dato', 'cb48f3d6-8052-4e4d-b0dd-d38d4255ff0e', CAST('2024-07-15T16:02:31.5400000' AS DateTime2), CAST('2024-07-15T16:02:31.5400000' AS DateTime2), 'SISTEMA', 'SISTEMA', 5)
                INSERT EP_ParametroDetalle (Id, NumCampo, Nombre, Descripcion, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy, TipoParametro) VALUES ('bf56f11b-7ef2-40d4-85b8-1e718845d7c7', 2, 'Operacion', 'Que se debe hacer', 'cb48f3d6-8052-4e4d-b0dd-d38d4255ff0e', CAST('2024-07-15T16:02:31.5433333' AS DateTime2), CAST('2024-07-15T16:02:31.5433333' AS DateTime2), 'SISTEMA', 'SISTEMA', 5)
                INSERT EP_ParametroDetalle (Id, NumCampo, Nombre, Descripcion, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy, TipoParametro) VALUES ('780afc02-c969-4c0f-a398-37f08dd479e9', 1, 'Tipo Insumo', 'Insumo nacional o internacional', 'f88e4340-e642-4dbc-9501-ca5b725d77d7', CAST('2024-07-15T16:02:31.5200000' AS DateTime2), CAST('2024-07-15T16:02:31.5200000' AS DateTime2), 'SISTEMA', 'SISTEMA', 5)
                INSERT EP_ParametroDetalle (Id, NumCampo, Nombre, Descripcion, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy, TipoParametro) VALUES ('80ddc4f8-4564-456f-a842-39eb2558bf6b', 1, 'Dias', 'Cantidad de dias habiles', 'c7114724-35ca-4563-bf8b-13b3e7893108', CAST('2024-07-15T16:02:31.5300000' AS DateTime2), CAST('2024-07-15T16:02:31.5300000' AS DateTime2), 'SISTEMA', 'SISTEMA', 4)
                INSERT EP_ParametroDetalle (Id, NumCampo, Nombre, Descripcion, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy, TipoParametro) VALUES ('ae154272-3785-fbb2-bcaf-3a13ce82f0a2', 1, 'Concepto', 'Calificación del indicador', '7745113e-625b-7d7f-d712-3a13ce82f092', CAST('2024-07-16T11:17:57.4816932' AS DateTime2), CAST('2024-07-16T11:17:57.4816932' AS DateTime2), 'SISTEMA', 'SISTEMA', 5)
                INSERT EP_ParametroDetalle (Id, NumCampo, Nombre, Descripcion, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy, TipoParametro) VALUES ('78ca5d41-2f29-9142-4fc0-3a13ce82f0c0', 2, '% Cantidad Inicial', 'Inicio del intervalo', '7745113e-625b-7d7f-d712-3a13ce82f092', CAST('2024-07-16T11:17:57.4816932' AS DateTime2), CAST('2024-07-16T11:17:57.4816932' AS DateTime2), 'SISTEMA', 'SISTEMA', 1)
                INSERT EP_ParametroDetalle (Id, NumCampo, Nombre, Descripcion, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy, TipoParametro) VALUES ('bc7685ef-ea3c-81f1-57cd-3a13ce82f0c0', 3, '% Cantidad Final', 'Final del intervalo', '7745113e-625b-7d7f-d712-3a13ce82f092', CAST('2024-07-16T11:17:57.4816932' AS DateTime2), CAST('2024-07-16T11:17:57.4816932' AS DateTime2), 'SISTEMA', 'SISTEMA', 2)
                INSERT EP_ParametroDetalle (Id, NumCampo, Nombre, Descripcion, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy, TipoParametro) VALUES ('947dead2-8c1a-00de-68cc-3a13ce82f0c1', 4, '% Cumplimiento', 'Cumplimiento del indicador', '7745113e-625b-7d7f-d712-3a13ce82f092', CAST('2024-07-16T11:17:57.4816932' AS DateTime2), CAST('2024-07-16T11:17:57.4816932' AS DateTime2), 'SISTEMA', 'SISTEMA', 3)
                INSERT EP_ParametroDetalle (Id, NumCampo, Nombre, Descripcion, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy, TipoParametro) VALUES ('2f48f1c2-1be6-eead-dff9-3a13ce97a836', 5, 'Desempeño', 'Calificación de desempeño', '7745113e-625b-7d7f-d712-3a13ce82f092', CAST('2024-07-16T11:40:35.3019648' AS DateTime2), CAST('2024-07-16T11:56:47.1814295' AS DateTime2), 'SISTEMA', 'SISTEMA', 3)
                INSERT EP_ParametroDetalle (Id, NumCampo, Nombre, Descripcion, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy, TipoParametro) VALUES ('c07e1b8f-4161-e300-b84a-3a13cfb7ff96', 1, 'Estado', 'Estado del lote', '42b5a024-e432-c738-e9ea-3a13cfb7f102', CAST('2024-07-16T16:55:31.8707718' AS DateTime2), CAST('2024-07-16T16:55:31.8707718' AS DateTime2), 'SISTEMA', 'SISTEMA', 5)
                INSERT EP_ParametroDetalle (Id, NumCampo, Nombre, Descripcion, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy, TipoParametro) VALUES ('88fc7d00-d7f7-83f2-bb91-3a13cfb7ff99', 2, '% Cumplimiento', 'Porcentaje de cumplimiento por estado', '42b5a024-e432-c738-e9ea-3a13cfb7f102', CAST('2024-07-16T16:55:31.8707718' AS DateTime2), CAST('2024-07-16T16:55:31.8707718' AS DateTime2), 'SISTEMA', 'SISTEMA', 3)
                INSERT EP_ParametroDetalle (Id, NumCampo, Nombre, Descripcion, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy, TipoParametro) VALUES ('598e25ab-98f6-fa8c-bc98-3a13cfb7ff9a', 3, 'Desempeño', 'Desempeño por estado', '42b5a024-e432-c738-e9ea-3a13cfb7f102', CAST('2024-07-16T16:55:31.8707718' AS DateTime2), CAST('2024-07-16T16:55:31.8707718' AS DateTime2), 'SISTEMA', 'SISTEMA', 3)
                INSERT EP_ParametroDetalle (Id, NumCampo, Nombre, Descripcion, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy, TipoParametro) VALUES ('a10a5bc6-7ad6-bc13-b95f-3a13d38641ae', 1, 'Tipo OC', 'Tipo de la órden de compra', '32dc2bf1-e4cc-1b43-47db-3a13d3864165', CAST('2024-07-17T10:39:40.9258581' AS DateTime2), CAST('2024-07-17T10:39:40.9258581' AS DateTime2), 'SISTEMA', 'SISTEMA', 5)
                INSERT EP_ParametroDetalle (Id, NumCampo, Nombre, Descripcion, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy, TipoParametro) VALUES ('e41ec9d3-4ebb-4bb3-f7b6-3a13d38641d0', 2, 'Concepto', 'Concepto de la entrega', '32dc2bf1-e4cc-1b43-47db-3a13d3864165', CAST('2024-07-17T10:39:40.9258581' AS DateTime2), CAST('2024-07-17T10:39:40.9258581' AS DateTime2), 'SISTEMA', 'SISTEMA', 5)
                INSERT EP_ParametroDetalle (Id, NumCampo, Nombre, Descripcion, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy, TipoParametro) VALUES ('d3faafc3-698c-12cf-1805-3a13d38641d1', 5, '% Cumplimiento', 'Porcentaje de cumplimiento por intervalo', '32dc2bf1-e4cc-1b43-47db-3a13d3864165', CAST('2024-07-17T10:39:40.9258581' AS DateTime2), CAST('2024-07-17T10:39:40.9258581' AS DateTime2), 'SISTEMA', 'SISTEMA', 3)
                INSERT EP_ParametroDetalle (Id, NumCampo, Nombre, Descripcion, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy, TipoParametro) VALUES ('2b0517ea-c7aa-0372-25ec-3a13d38641d1', 3, 'Dias Inicio', 'Inicio del intervalo', '32dc2bf1-e4cc-1b43-47db-3a13d3864165', CAST('2024-07-17T10:39:40.9258581' AS DateTime2), CAST('2024-07-17T10:39:40.9258581' AS DateTime2), 'SISTEMA', 'SISTEMA', 1)
                INSERT EP_ParametroDetalle (Id, NumCampo, Nombre, Descripcion, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy, TipoParametro) VALUES ('c6bdec60-e351-85e8-dac1-3a13d38641d1', 6, 'Desempeño', 'Valor desempeño por intervalo', '32dc2bf1-e4cc-1b43-47db-3a13d3864165', CAST('2024-07-17T10:39:40.9258581' AS DateTime2), CAST('2024-07-17T10:39:40.9258581' AS DateTime2), 'SISTEMA', 'SISTEMA', 3)
                INSERT EP_ParametroDetalle (Id, NumCampo, Nombre, Descripcion, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy, TipoParametro) VALUES ('7829f6cc-18ed-7ffd-df23-3a13d38641d1', 4, 'Dias Fin', 'Fin del intervalo', '32dc2bf1-e4cc-1b43-47db-3a13d3864165', CAST('2024-07-17T10:39:40.9258581' AS DateTime2), CAST('2024-07-17T10:39:40.9258581' AS DateTime2), 'SISTEMA', 'SISTEMA', 2)
                INSERT EP_ParametroDetalle (Id, NumCampo, Nombre, Descripcion, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy, TipoParametro) VALUES ('d9739545-cb94-28fb-0952-3a13d3883059', 4, 'Dias Fin', 'Final del intervalo', '2ecba4d6-dc49-499b-7c74-3a13d3883059', CAST('2024-07-17T10:41:47.4827274' AS DateTime2), CAST('2024-07-17T10:41:47.4827274' AS DateTime2), 'SISTEMA', 'SISTEMA', 2)
                INSERT EP_ParametroDetalle (Id, NumCampo, Nombre, Descripcion, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy, TipoParametro) VALUES ('3de9249c-e4a3-0216-1415-3a13d3883059', 2, 'Concepto', 'Concepto de entrega', '2ecba4d6-dc49-499b-7c74-3a13d3883059', CAST('2024-07-17T10:41:47.4827274' AS DateTime2), CAST('2024-07-17T10:41:47.4827274' AS DateTime2), 'SISTEMA', 'SISTEMA', 5)
                INSERT EP_ParametroDetalle (Id, NumCampo, Nombre, Descripcion, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy, TipoParametro) VALUES ('73a8d9b3-3dac-28b1-3560-3a13d3883059', 3, 'Dias Inicio', 'Inicio del intervalo', '2ecba4d6-dc49-499b-7c74-3a13d3883059', CAST('2024-07-17T10:41:47.4827274' AS DateTime2), CAST('2024-07-17T10:41:47.4827274' AS DateTime2), 'SISTEMA', 'SISTEMA', 1)
                INSERT EP_ParametroDetalle (Id, NumCampo, Nombre, Descripcion, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy, TipoParametro) VALUES ('97257062-7ea8-60c4-38db-3a13d3883059', 6, 'Desempeño', 'Desempeño por intervalo', '2ecba4d6-dc49-499b-7c74-3a13d3883059', CAST('2024-07-17T10:41:47.4827274' AS DateTime2), CAST('2024-07-17T10:41:47.4827274' AS DateTime2), 'SISTEMA', 'SISTEMA', 3)
                INSERT EP_ParametroDetalle (Id, NumCampo, Nombre, Descripcion, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy, TipoParametro) VALUES ('34dace51-a117-aedc-562d-3a13d3883059', 1, 'Tipo OC', 'Tipo de la órden de compra', '2ecba4d6-dc49-499b-7c74-3a13d3883059', CAST('2024-07-17T10:41:47.4827274' AS DateTime2), CAST('2024-07-17T10:41:47.4827274' AS DateTime2), 'SISTEMA', 'SISTEMA', 5)
                INSERT EP_ParametroDetalle (Id, NumCampo, Nombre, Descripcion, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy, TipoParametro) VALUES ('2ad50949-895f-da79-7054-3a13d3883059', 5, '% Cumplimiento', 'Porcentaje de cumplimiento por intervalo', '2ecba4d6-dc49-499b-7c74-3a13d3883059', CAST('2024-07-17T10:41:47.4827274' AS DateTime2), CAST('2024-07-17T10:41:47.4827274' AS DateTime2), 'SISTEMA', 'SISTEMA', 3)
                INSERT EP_ParametroDetalle (Id, NumCampo, Nombre, Descripcion, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy, TipoParametro) VALUES ('bd430718-d807-3b50-05ed-3a13d38c4845', 2, '% Inicio', 'Inicio de intervalo', 'a34ba33e-f24f-2a2c-977a-3a13d38c4845', CAST('2024-07-17T10:46:15.7504135' AS DateTime2), CAST('2024-07-17T10:46:15.7504135' AS DateTime2), 'SISTEMA', 'SISTEMA', 3)
                INSERT EP_ParametroDetalle (Id, NumCampo, Nombre, Descripcion, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy, TipoParametro) VALUES ('739ad26a-47da-bb6e-4c50-3a13d38c4845', 1, 'Diagnostico', 'Calificación cualitativa de evaluación', 'a34ba33e-f24f-2a2c-977a-3a13d38c4845', CAST('2024-07-17T10:46:15.7504135' AS DateTime2), CAST('2024-07-17T10:46:15.7504135' AS DateTime2), 'SISTEMA', 'SISTEMA', 5)
                INSERT EP_ParametroDetalle (Id, NumCampo, Nombre, Descripcion, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy, TipoParametro) VALUES ('c38d0850-d808-58d3-bdce-3a13d38c4845', 3, '% Fin', 'Fin de intervalo', 'a34ba33e-f24f-2a2c-977a-3a13d38c4845', CAST('2024-07-17T10:46:15.7504135' AS DateTime2), CAST('2024-07-17T10:46:15.7504135' AS DateTime2), 'SISTEMA', 'SISTEMA', 3)
                INSERT EP_ParametroDetalle (Id, NumCampo, Nombre, Descripcion, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy, TipoParametro) VALUES ('fb5eaa64-ad62-4d48-94a3-6a0ebd263edb', 2, 'Calificacion', 'Valor numerico', 'f88e4340-e642-4dbc-9501-ca5b725d77d7', CAST('2024-07-15T16:02:31.5233333' AS DateTime2), CAST('2024-07-15T16:02:31.5233333' AS DateTime2), 'SISTEMA', 'SISTEMA', 3)
                INSERT EP_ParametroDetalle (Id, NumCampo, Nombre, Descripcion, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy, TipoParametro) VALUES ('694db317-7db0-4eda-ae01-7c73999139bc', 1, 'Meses', 'Frecuencia en meses', 'd99e711f-0baa-4690-ac55-5fde17ae169e', CAST('2024-07-15T16:02:31.5333333' AS DateTime2), CAST('2024-07-16T11:57:33.2391736' AS DateTime2), 'SISTEMA', 'SISTEMA', 4)
                INSERT EP_ParametroDetalle (Id, NumCampo, Nombre, Descripcion, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy, TipoParametro) VALUES ('A4D7B35E-C660-86D3-F0BB-3A149346DB96', 1, '% Objetivo','','136C9EE9-25BA-246F-E2D4-3A149346DB78',CAST('2024-07-15T16:02:31.5333333' AS DateTime2),CAST('2024-07-15T16:02:31.5333333' AS DateTime2),'SISTEMA','SISTEMA',4)
                INSERT EP_ParametroValor (Id, Campo1, Campo2, Campo3, Campo4, Campo5, Campo6, Campo7, Campo8, Campo9, Campo10, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES ('e9f5fafb-3114-47a0-9326-2aa838f909cf', 'IMP', '7.7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'f88e4340-e642-4dbc-9501-ca5b725d77d7', CAST('2024-07-15T16:02:31.5533333' AS DateTime2), CAST('2024-07-15T16:02:31.5533333' AS DateTime2), 'SISTEMA', 'SISTEMA')
                INSERT EP_ParametroValor (Id, Campo1, Campo2, Campo3, Campo4, Campo5, Campo6, Campo7, Campo8, Campo9, Campo10, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES ('3cbfd060-77ff-458f-a101-32cef6c2ba51', 'Cod', 'IGUAL', '10013529', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cb48f3d6-8052-4e4d-b0dd-d38d4255ff0e', CAST('2024-07-15T16:02:31.5800000' AS DateTime2), CAST('2024-07-15T16:02:31.5800000' AS DateTime2), 'SISTEMA', 'SISTEMA')
                INSERT EP_ParametroValor (Id, Campo1, Campo2, Campo3, Campo4, Campo5, Campo6, Campo7, Campo8, Campo9, Campo10, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES ('0e856626-bf13-49b6-9173-36ea8011059c', 'NAL', '8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'f88e4340-e642-4dbc-9501-ca5b725d77d7', CAST('2024-07-15T16:02:31.5500000' AS DateTime2), CAST('2024-07-15T16:02:31.5500000' AS DateTime2), 'SISTEMA', 'SISTEMA')
                INSERT EP_ParametroValor (Id, Campo1, Campo2, Campo3, Campo4, Campo5, Campo6, Campo7, Campo8, Campo9, Campo10, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES ('4128e10a-b166-ee58-227b-3a13ce927ca5', 'Óptimo', '95', '105', '100', '3', NULL, NULL, NULL, NULL, NULL, '7745113e-625b-7d7f-d712-3a13ce82f092', CAST('2024-07-16T11:34:56.3357535' AS DateTime2), CAST('2024-07-16T14:37:51.0469421' AS DateTime2), 'SISTEMA', 'SISTEMA')
                INSERT EP_ParametroValor (Id, Campo1, Campo2, Campo3, Campo4, Campo5, Campo6, Campo7, Campo8, Campo9, Campo10, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES ('d3fd3d57-1d6e-bd5f-0c36-3a13ce9872cb', 'Aceptable', '105', '110', '80', '2.4', NULL, NULL, NULL, NULL, NULL, '7745113e-625b-7d7f-d712-3a13ce82f092', CAST('2024-07-16T11:41:27.0215759' AS DateTime2), CAST('2024-07-16T15:30:20.1917505' AS DateTime2), 'SISTEMA', 'SISTEMA')
                INSERT EP_ParametroValor (Id, Campo1, Campo2, Campo3, Campo4, Campo5, Campo6, Campo7, Campo8, Campo9, Campo10, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES ('077c7769-15c5-0b28-ee66-3a13ce9872cb', 'Aceptable', '90', '95', '80', '2.4', NULL, NULL, NULL, NULL, NULL, '7745113e-625b-7d7f-d712-3a13ce82f092', CAST('2024-07-16T11:41:27.0215759' AS DateTime2), CAST('2024-07-16T11:41:27.0215759' AS DateTime2), 'SISTEMA', 'SISTEMA')
                INSERT EP_ParametroValor (Id, Campo1, Campo2, Campo3, Campo4, Campo5, Campo6, Campo7, Campo8, Campo9, Campo10, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES ('f3cb856e-cdc5-4bb1-ae45-3a13cfb7ff9d', 'APROBADO', '100', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '42b5a024-e432-c738-e9ea-3a13cfb7f102', CAST('2024-07-16T16:55:31.8707718' AS DateTime2), CAST('2024-07-16T16:56:03.6355207' AS DateTime2), 'SISTEMA', 'SISTEMA')
                INSERT EP_ParametroValor (Id, Campo1, Campo2, Campo3, Campo4, Campo5, Campo6, Campo7, Campo8, Campo9, Campo10, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES ('f89c16c3-bb43-6cf1-0468-3a13cfb87b90', 'APROBADO_COND', '20', '0.8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '42b5a024-e432-c738-e9ea-3a13cfb7f102', CAST('2024-07-16T16:56:03.6355207' AS DateTime2), CAST('2024-07-16T16:56:03.6355207' AS DateTime2), 'SISTEMA', 'SISTEMA')
                INSERT EP_ParametroValor (Id, Campo1, Campo2, Campo3, Campo4, Campo5, Campo6, Campo7, Campo8, Campo9, Campo10, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES ('5a0d325e-bb37-3b49-0863-3a13cfb87b90', 'RECHAZADO', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '42b5a024-e432-c738-e9ea-3a13cfb7f102', CAST('2024-07-16T16:56:03.6355207' AS DateTime2), CAST('2024-07-16T16:56:03.6355207' AS DateTime2), 'SISTEMA', 'SISTEMA')
                INSERT EP_ParametroValor (Id, Campo1, Campo2, Campo3, Campo4, Campo5, Campo6, Campo7, Campo8, Campo9, Campo10, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES ('f3cf08bd-39eb-97a8-17be-3a13d38641d2', 'NAL', 'Perfecto', '-5', '1', '100', '3', NULL, NULL, NULL, NULL, '32dc2bf1-e4cc-1b43-47db-3a13d3864165', CAST('2024-07-17T10:39:40.9258581' AS DateTime2), CAST('2024-07-17T10:43:06.4077267' AS DateTime2), 'SISTEMA', 'SISTEMA')
                INSERT EP_ParametroValor (Id, Campo1, Campo2, Campo3, Campo4, Campo5, Campo6, Campo7, Campo8, Campo9, Campo10, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES ('56fac305-2f25-5180-3701-3a13d3883059', 'IMP', 'Perfecto', '-10', '10', '100', '3', NULL, NULL, NULL, NULL, '2ecba4d6-dc49-499b-7c74-3a13d3883059', CAST('2024-07-17T10:41:47.4827274' AS DateTime2), CAST('2024-07-17T10:44:01.6642179' AS DateTime2), 'SISTEMA', 'SISTEMA')
                INSERT EP_ParametroValor (Id, Campo1, Campo2, Campo3, Campo4, Campo5, Campo6, Campo7, Campo8, Campo9, Campo10, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES ('1a0a7d2a-2179-4673-20bc-3a13d389647d', 'NAL', 'Deficiente', '3', '5', '30', '0.9', NULL, NULL, NULL, NULL, '32dc2bf1-e4cc-1b43-47db-3a13d3864165', CAST('2024-07-17T10:43:06.4077267' AS DateTime2), CAST('2024-07-17T10:43:06.4077267' AS DateTime2), 'SISTEMA', 'SISTEMA')
                INSERT EP_ParametroValor (Id, Campo1, Campo2, Campo3, Campo4, Campo5, Campo6, Campo7, Campo8, Campo9, Campo10, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES ('6a0e4841-9caa-ae27-f6a0-3a13d389647d', 'NAL', 'Oportuna', '1', '3', '60', '1.8', NULL, NULL, NULL, NULL, '32dc2bf1-e4cc-1b43-47db-3a13d3864165', CAST('2024-07-17T10:43:06.4077267' AS DateTime2), CAST('2024-07-17T10:43:06.4077267' AS DateTime2), 'SISTEMA', 'SISTEMA')
                INSERT EP_ParametroValor (Id, Campo1, Campo2, Campo3, Campo4, Campo5, Campo6, Campo7, Campo8, Campo9, Campo10, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES ('162c5fa1-7852-83c7-be67-3a13d38a3c5a', 'IMP', 'Oportuna', '-15', '-10', '50', '1.5', NULL, NULL, NULL, NULL, '2ecba4d6-dc49-499b-7c74-3a13d3883059', CAST('2024-07-17T10:44:01.6642179' AS DateTime2), CAST('2024-07-17T10:44:01.6642179' AS DateTime2), 'SISTEMA', 'SISTEMA')
                INSERT EP_ParametroValor (Id, Campo1, Campo2, Campo3, Campo4, Campo5, Campo6, Campo7, Campo8, Campo9, Campo10, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES ('f2581dab-53c4-84ef-e5ac-3a13d38a3c5a', 'IMP', 'Oportuna', '10', '15', '50', '1.5', NULL, NULL, NULL, NULL, '2ecba4d6-dc49-499b-7c74-3a13d3883059', CAST('2024-07-17T10:44:01.6642179' AS DateTime2), CAST('2024-07-17T10:44:01.6642179' AS DateTime2), 'SISTEMA', 'SISTEMA')
                INSERT EP_ParametroValor (Id, Campo1, Campo2, Campo3, Campo4, Campo5, Campo6, Campo7, Campo8, Campo9, Campo10, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES ('d61ce4b1-a289-4daa-435e-3a13d38c4845', 'Excelente', '90', '100', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a34ba33e-f24f-2a2c-977a-3a13d38c4845', CAST('2024-07-17T10:46:15.7504135' AS DateTime2), CAST('2024-07-17T10:47:06.3974365' AS DateTime2), 'SISTEMA', 'SISTEMA')
                INSERT EP_ParametroValor (Id, Campo1, Campo2, Campo3, Campo4, Campo5, Campo6, Campo7, Campo8, Campo9, Campo10, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES ('41602e83-77a9-75c6-3973-3a13d38d0df9', 'A Mejorar', '60', '80', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a34ba33e-f24f-2a2c-977a-3a13d38c4845', CAST('2024-07-17T10:47:06.3974365' AS DateTime2), CAST('2024-07-17T10:47:06.3974365' AS DateTime2), 'SISTEMA', 'SISTEMA')
                INSERT EP_ParametroValor (Id, Campo1, Campo2, Campo3, Campo4, Campo5, Campo6, Campo7, Campo8, Campo9, Campo10, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES ('7781b00c-98cd-75b7-7615-3a13d38d0df9', 'Con Restricción', '0', '60', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a34ba33e-f24f-2a2c-977a-3a13d38c4845', CAST('2024-07-17T10:47:06.3974365' AS DateTime2), CAST('2024-07-17T10:47:06.3974365' AS DateTime2), 'SISTEMA', 'SISTEMA')
                INSERT EP_ParametroValor (Id, Campo1, Campo2, Campo3, Campo4, Campo5, Campo6, Campo7, Campo8, Campo9, Campo10, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES ('5c2c14bb-b95a-0f55-7a6f-3a13d38d0df9', 'Bueno', '80', '90', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'a34ba33e-f24f-2a2c-977a-3a13d38c4845', CAST('2024-07-17T10:47:06.3974365' AS DateTime2), CAST('2024-07-17T10:47:06.3974365' AS DateTime2), 'SISTEMA', 'SISTEMA')
                INSERT EP_ParametroValor (Id, Campo1, Campo2, Campo3, Campo4, Campo5, Campo6, Campo7, Campo8, Campo9, Campo10, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES ('73c81e84-b8b6-e5cf-6bec-3a13d45e9f3c', 'Deficiente', '0', '90', '0', '0', NULL, NULL, NULL, NULL, NULL, '7745113e-625b-7d7f-d712-3a13ce82f092', CAST('2024-07-17T14:36:00.6083300' AS DateTime2), CAST('2024-07-17T14:36:00.6083300' AS DateTime2), 'SISTEMA', 'SISTEMA')
                INSERT EP_ParametroValor (Id, Campo1, Campo2, Campo3, Campo4, Campo5, Campo6, Campo7, Campo8, Campo9, Campo10, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES ('be612593-5a5a-ebd7-e5d6-3a13d45e9f3c', 'Deficiente', '110', '200', '0', '0', NULL, NULL, NULL, NULL, NULL, '7745113e-625b-7d7f-d712-3a13ce82f092', CAST('2024-07-17T14:36:00.6083300' AS DateTime2), CAST('2024-07-17T14:36:00.6083300' AS DateTime2), 'SISTEMA', 'SISTEMA')
                INSERT EP_ParametroValor (Id, Campo1, Campo2, Campo3, Campo4, Campo5, Campo6, Campo7, Campo8, Campo9, Campo10, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES ('bf9039d2-a0cb-4ab4-acab-4e5dedb7682a', 'NombreUsuario', 'IGUAL', 'SOBANDO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cb48f3d6-8052-4e4d-b0dd-d38d4255ff0e', CAST('2024-07-15T16:02:31.5766667' AS DateTime2), CAST('2024-07-15T16:02:31.5766667' AS DateTime2), 'SISTEMA', 'SISTEMA')
                INSERT EP_ParametroValor (Id, Campo1, Campo2, Campo3, Campo4, Campo5, Campo6, Campo7, Campo8, Campo9, Campo10, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES ('6aa953c8-2ba6-4605-ae50-7ab6d451c1ea', '80', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'c905a3fc-4fcc-4bf9-a3d3-f0b4be17faad', CAST('2024-07-15T16:02:31.5566667' AS DateTime2), CAST('2024-07-15T16:02:31.5566667' AS DateTime2), 'SISTEMA', 'SISTEMA')
                INSERT EP_ParametroValor (Id, Campo1, Campo2, Campo3, Campo4, Campo5, Campo6, Campo7, Campo8, Campo9, Campo10, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES ('954805f6-a15d-4f89-bd45-891e2749594c', '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '841d69ee-33bd-4005-a052-13a8112544e6', CAST('2024-07-15T16:02:31.5633333' AS DateTime2), CAST('2024-07-15T16:02:31.5633333' AS DateTime2), 'SISTEMA', 'SISTEMA')
                INSERT EP_ParametroValor (Id, Campo1, Campo2, Campo3, Campo4, Campo5, Campo6, Campo7, Campo8, Campo9, Campo10, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES ('f3a539ab-b4c8-4565-b78d-cd49b7824caf', 'Nit', 'IGUAL', '760535618', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cb48f3d6-8052-4e4d-b0dd-d38d4255ff0e', CAST('2024-07-15T16:02:31.5733333' AS DateTime2), CAST('2024-07-15T16:02:31.5733333' AS DateTime2), 'SISTEMA', 'SISTEMA')
                INSERT EP_ParametroValor (Id, Campo1, Campo2, Campo3, Campo4, Campo5, Campo6, Campo7, Campo8, Campo9, Campo10, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES ('d42bfa02-8501-4c30-9c13-cd5e07f414dd', '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'd99e711f-0baa-4690-ac55-5fde17ae169e', CAST('2024-07-15T16:02:31.5666667' AS DateTime2), CAST('2024-07-15T16:02:31.5666667' AS DateTime2), 'SISTEMA', 'SISTEMA')
                INSERT EP_ParametroValor (Id, Campo1, Campo2, Campo3, Campo4, Campo5, Campo6, Campo7, Campo8, Campo9, Campo10, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES ('a74f6956-1e77-412c-8944-f63431ed1b1f', '7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'c7114724-35ca-4563-bf8b-13b3e7893108', CAST('2024-07-15T16:02:31.5600000' AS DateTime2), CAST('2024-07-15T16:02:31.5600000' AS DateTime2), 'SISTEMA', 'SISTEMA')
                INSERT EP_ParametroValor (Id, Campo1, Campo2, Campo3, Campo4, Campo5, Campo6, Campo7, Campo8, Campo9, Campo10, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES ('8a034968-9be5-4184-b654-f805b3f5e202', 'Cod', 'EMPIECE', '25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cb48f3d6-8052-4e4d-b0dd-d38d4255ff0e', CAST('2024-07-15T16:02:31.5700000' AS DateTime2), CAST('2024-07-15T16:02:31.5700000' AS DateTime2), 'SISTEMA', 'SISTEMA')
                INSERT EP_ParametroValor (Id, Campo1, Campo2, Campo3, Campo4, Campo5, Campo6, Campo7, Campo8, Campo9, Campo10, ParametroId, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES ('C0007D28-EF1B-BE88-E0F7-3A149346DBBD','80',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'136C9EE9-25BA-246F-E2D4-3A149346DB78',CAST('2024-07-15T16:02:31.5700000' AS DateTime2),CAST('2024-07-15T16:02:31.5700000' AS DateTime2),'SISTEMA','SISTEMA')
            END;
    END;

--- USUARIOS
IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'EP_Usuario'))
    BEGIN
        IF ((SELECT COUNT(*) FROM EP_Usuario) = 0)
            BEGIN                 
                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LMLONDONO',
                 'LINA MARCELA'
                 , 'LONDOÑO ARCE'
                 , 'lmlondono@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Administrador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'YCVILLANUEVA',
                 'YENNY CAROLINA'
                 , 'VILLANUEVA RAMIREZ'
                 , 'ycvillanueva@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JOSPINA',
                 'JACKELINE'
                 , 'OSPINA LOAIZA'
                 , 'jospina@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DJMERA',
                 'DAVID JOSE'
                 , 'MERA RODRIGUEZ'
                 , 'djmera@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'FPEREZ',
                 'FABIANA'
                 , 'PEREZ PARRA'
                 , 'fperez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MPCARRILLO',
                 'MARENA PATRICIA'
                 , 'CARRILLO RIVERA'
                 , 'mpcarrillo@indugraficas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'NGARCIA',
                 'SOFIA'
                 , 'GARCIA CORONEL'
                 , 'sgarciac@indugraficas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'OERAZO',
                 'OMAR'
                 , 'ERAZO BONILLA'
                 , 'oerazob@indugraficas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LAVELASQUEZ',
                 'LUZ ANDREA'
                 , 'VELASQUEZ QUINTERO'
                 , 'lavelasquez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'FALOPEZ',
                 'FERNANDO ALBERTO'
                 , 'LOPEZ VELASQUEZ'
                 , 'falopez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'NAPAREDES',
                 'NATHALIA ANDREA'
                 , 'PAREDES ECHEVERRI'
                 , 'naparedes@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DSTEJADA',
                 'DIANA SARAI'
                 , 'TEJADA CAMPOS'
                 , 'dstejada@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JACERO',
                 'JACOBO'
                 , 'ACERO SANCHEZ'
                 , 'jacero@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'IDBUENO',
                 'INGRID DAYANA'
                 , 'BUENO MAMIAN'
                 , 'idbueno@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'GAHERNANDEZ',
                 'GIOVANNI ALEXANDER'
                 , 'HERNANDEZ FUNES'
                 , 'gahernandez@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'EEGORDILLO',
                 'ERIKA ELIZABETH'
                 , 'GORDILLO MOCHA'
                 , 'eegordillo@tqgrupo.com.ec'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )


                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JFVALENCIA',
                 'JOSE FERNANDO'
                 , 'VALENCIA GARCIA'
                 , 'jfvalencia@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MAMUNOZ',
                 'MIGUEL ANGEL'
                 , 'MUÑOZ AGUILAR'
                 , 'mamunoz@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AMTORRES',
                 'ANA MILENA'
                 , 'TORRES MARTINEZ'
                 , 'amtorres@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'OAMUNOZ',
                 'OSCAR ANDRES'
                 , 'MUÑOZ HERRERA'
                 , 'oamunoz@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'GVGARCIA',
                 'GLORIA VIANY'
                 , 'GARCIA CASTAÑEDA'
                 , 'amcamilo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'INLONDONO',
                 'ISABEL NATALIA'
                 , 'LONDOÑO MONCADA'
                 , 'inlondono@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JAPEREZ',
                 'JHONATAN ANDRES'
                 , 'PEREZ FALLA'
                 , 'japerez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'VREINA',
                 'VANESSA'
                 , 'REINA ALCALA'
                 , 'vreina@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JEOTERO',
                 'JORGE EDUARDO'
                 , 'OTERO PEREZ'
                 , 'jeotero@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DMERCADO',
                 'DANIELA'
                 , 'MERCADO ROJAS'
                 , 'dmercado@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'RAGARCIA',
                 'ROGER ALEXANDER'
                 , 'GARCIA LOPEZ'
                 , 'ragarcia@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'SGOMEZG',
                 'STEFHANIA'
                 , 'GOMEZ GUERRERO'
                 , 'sgomezg@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MIAYALA',
                 'MARIA ISABEL'
                 , 'AYALA DUQUE'
                 , 'miayala@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LVSANCHEZ',
                 'LEYDI VIVIANA'
                 , 'SANCHEZ SEPULVEDA'
                 , 'lvsanchez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'NLVARGAS',
                 'NELSY LORENA'
                 , 'VARGAS ARDILA'
                 , 'nlvargas@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MXZAPATA',
                 'MARIA XIMENA'
                 , 'ZAPATA BOLTON'
                 , 'mxzapata@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JCTRULLAS',
                 'JUAN CARLOS'
                 , 'TRULLAS GALLEGO'
                 , 'jctrullas@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CAPENA',
                 'CARLOS ARTURO'
                 , 'PEÑA NIETO'
                 , 'cpena@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'EPINILLA',
                 'FRANCISCO JOSE'
                 , 'LUGO CHAVES'
                 , 'fjlugo@indugraficas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DFCEBALLOS',
                 'DIEGO FERNANDO'
                 , 'CEBALLOS LOPEZ'
                 , 'dfceballos@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'VMFOLLECO',
                 'VICTOR MARIO'
                 , 'FOLLECO PAZMIÑO'
                 , 'jvillaa@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LCORREA',
                 'LAURA'
                 , 'CORREA YEPES'
                 , 'lcorrea@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ARPADILLAC',
                 'APRIL ROSSE'
                 , 'PADILLA CASTAÑO'
                 , 'arpadillac@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'IYMANCIA',
                 'IRENE YACIRA'
                 , 'MANCIA RIVAS'
                 , 'iymancia@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'BAMARTINEZ',
                 'BORIS ANGEL'
                 , 'MARTINEZ VALENCIA'
                 , 'bamartinez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MAJARAMILLO',
                 'MONICA ALEXANDRA'
                 , 'JARAMILLO'
                 , 'majaramillo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'RAECHEVERRY',
                 'RAUL ALBERTO'
                 , 'ECHEVERRY SANCHEZ'
                 , 'raecheverry@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JPCANDELO',
                 'JUAN PABLO'
                 , 'CANDELO ARIAS'
                 , 'jpcandelo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Jefe de Abastecimiento')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'OMMELO',
                 'OLGA MARINA'
                 , 'MELO TORO'
                 , 'ommelo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AFDIAZ',
                 'ANDRES FELIPE'
                 , 'DIAZ SALGADO'
                 , 'afdiaz@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AGOROZCO',
                 'ANGELA GIOVANA'
                 , 'OROZCO CIFUENTES'
                 , 'agorozco@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AJCASTANEDA',
                 'ANNGY JULIET'
                 , 'CASTAÑEDA ROJAS'
                 , 'ajcastaneda@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AMROLONG',
                 'ANGGIE MARY'
                 , 'ROLONG DE LA HOZ'
                 , 'amrolong@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ASANCHEZ',
                 'ALEXANDER'
                 , 'SANCHEZ QUINTERO'
                 , 'asanchez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'BHERRERA',
                 'BLANCA ESTHER'
                 , 'HERRERA NAVARRO'
                 , 'bherreran@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DAROSERO',
                 'DAVID ALEJANDRO'
                 , 'ROSERO TORRES'
                 , 'darosero@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AMUSECHE',
                 'ANA MARIA'
                 , 'USECHE'
                 , 'amuseche@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AFGIRALDO',
                 'ANGELLY FERNANDA'
                 , 'GIRALDO RANGEL'
                 , 'afgiraldo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JSFOLLECO',
                 'JUAN SEBASTIAN'
                 , 'FOLLECO GIRALDO'
                 , 'jsfolleco@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CAOCAMPOC',
                 'CRISTIAN ANTONIO'
                 , 'OCAMPO CARDONA'
                 , 'caocampoc@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AMORAN',
                 'ALVARO'
                 , 'MORAN GALINDO'
                 , 'amoran@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'PAPINEDA',
                 'PAOLA ANDREA'
                 , 'PINEDA ARZUAGA'
                 , 'papineda@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JEALOMIA',
                 'JAIME EDUARDO'
                 , 'ALOMIA SANTAMARIA'
                 , 'jealomia@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'WBEDOYA',
                 'WILSON'
                 , 'BEDOYA VILLA'
                 , 'wbedoya@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LJMIRANDA',
                 'LEIDY JOHANNA'
                 , 'MIRANDA ORTIZ'
                 , 'ljmiranda@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'KJBENITEZ',
                 'KELY JOHANA'
                 , 'BENITEZ FRANCO'
                 , 'kjbenitez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JJARIAS',
                 'JHON JAIRO'
                 , 'ARIAS ALZATE'
                 , 'jjarias@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CHOSPINA',
                 'CARLOS HUMBERTO'
                 , 'OSPINA BONILLA'
                 , 'chospina@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'UTORRES',
                 'UBERNEY'
                 , 'TORRES CANENCIO'
                 , 'utorres@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CAGUDELO',
                 'CLAUDIA PATRICIA'
                 , 'AGUDELO CARMONA'
                 , 'cpagudelo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )


                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JCGARCIAM',
                 'JUAN CAMILO'
                 , 'GARCIA MELO'
                 , 'jcgarciam@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DVCARDONA',
                 'DERLIN VANESSA'
                 , 'CARDONA GOMEZ'
                 , 'dvcardona@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AYMADERA',
                 'ALEX YAMIL'
                 , 'MADERA VILLADA'
                 , 'aymadera@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MPOTES',
                 'RODOLFO AUGUSTO'
                 , 'VARGAS SAAVEDRA'
                 , 'ravargas@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JEAVILA',
                 'JOHN EDWIN'
                 , 'AVILA MINO'
                 , 'jeavila@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ECRIOLLO',
                 'ELIZABETH'
                 , 'CRIOLLO SANCHEZ'
                 , 'ecriollo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'EFLOREZ',
                 'ELIZABETH'
                 , 'FLOREZ ESTRADA'
                 , 'eflorez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'WRODAS',
                 'WILMER'
                 , 'RODAS BEJARANO'
                 , 'wrodas@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'EZAMORA',
                 'EDWIN'
                 , 'ZAMORA JUANILLO'
                 , 'ezamora@indugraficas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'FCARTAGENA',
                 'FANNY'
                 , 'CARTAGENA CABALLERO'
                 , 'fcartagena@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'INTERFAZ',
                 'COMPRADOR'
                 , 'INTERFAZ2'
                 , 'spbaez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'OPERACIONES',
                 'DANIEL HUMBERTO'
                 , 'BARONA CAJIAO'
                 , 'dhbarona@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'FMACEVEDO',
                 'FLOR MARIA'
                 , 'ACEVEDO ARROYAVE'
                 , 'fmacevedo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JDIAZ',
                 'JENNIFER'
                 , 'DIAZ DONNEYS'
                 , 'jdiaz@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MEESPINOZA',
                 'MICHELL ELENA'
                 , 'ESPINOZA CHICAIZA'
                 , 'amcamilo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ALVEGA',
                 'ANA LIGIA'
                 , 'VEGA'
                 , 'alvega@indugraficas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JVALDES',
                 'JEFFERSON'
                 , 'VALDES BASTO'
                 , 'jvaldes@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MCPENA',
                 'MARIA CAMILA'
                 , 'PEÑA MESA'
                 , 'mcpena@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ICTRUJILLO',
                 'ISABEL CRISTINA'
                 , 'TRUJILLO AMAYA'
                 , 'ictrujillo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'VMARIN',
                 'VALERIA'
                 , 'MARIN LARRAHONDO'
                 , 'vmarin@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )


                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JAGOMEZV',
                 'JOHN ANIBAL'
                 , 'GOMEZ VARON'
                 , 'jagomezv@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )


                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DHURTDOMA',
                 'DHANIELA'
                 , 'HURTADO MARTINEZ'
                 , 'dhurtadoma@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JVILLA',
                 'JENNIFER'
                 , 'VILLA GUZMAN'
                 , 'jvilla@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AMARTINEZ',
                 'ARTURO'
                 , 'MARTINEZ RUIZ'
                 , 'amartinez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'YPEREZ',
                 'YESENIA'
                 , 'PEREZ PARRA'
                 , 'yperez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'FFARANGO',
                 'FABIO FERNANDO'
                 , 'ARANGO GOMEZ'
                 , 'ffarango@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ALOAIZAO',
                 'ALEXANDER'
                 , 'LOAIZA ORDOÑEZ'
                 , 'aloaizao@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JECASTRO',
                 'JENNY ELIZSANDRA'
                 , 'CASTRO DONOSO'
                 , 'jecastro@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JIOSORIO',
                 'JORGE IVAN'
                 , 'OSORIO NOREÑA'
                 , 'jiosorio@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JERESTREPO',
                 'JUAN ESTEBAN'
                 , 'RESTREPO OBREGON'
                 , 'jerestrepo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JJMEJIAM',
                 'JHON JAIRO'
                 , 'MEJIA MOSQUERA'
                 , 'jjmejiam@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JORDONEZ',
                 'JESSICA ANDREA'
                 , 'ORDONEZ VILLEGAS'
                 , 'jordonez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'KEDELGADO',
                 'KATHERINE ESPERANZA'
                 , 'DELGADO ADRADA'
                 , 'kedelgado@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MBETANCOURT',
                 'MYRIAM'
                 , 'BETANCOURT DIAZ'
                 , 'mbetancourt@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'SMJOYA',
                 'SANTOS MOISES'
                 , 'JOYA VASQUEZ'
                 , 'smjoya@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'SSDORADO',
                 'SERGIO STIVEN'
                 , 'DORADO GONZALEZ'
                 , 'ssdorado@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DKBORRERO',
                 'DIANA KATHERINE'
                 , 'BORRERO PEREZ'
                 , 'dkborrero@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DFBEDOYA',
                 'DANIELA FERNANDA'
                 , 'BEDOYA GUETIO'
                 , 'dfbedoya@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LMPALACIOM',
                 'LINA MARCELA'
                 , 'PALACIO MORALES'
                 , 'lmpalaciom@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AFSANCHEZ',
                 'ANDRES FERNANDO'
                 , 'SANCHEZ MUÑOZ'
                 , 'afsanchez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JCARCE',
                 'JUAN CAMILO'
                 , 'ARCE LEITON'
                 , 'jcarce@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LMMADRONERO',
                 'LEYDI MARICELA'
                 , 'MADROÑERO ERAZO'
                 , 'lmmadronero@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'RAVARGAS',
                 'RODOLFO AUGUSTO'
                 , 'VARGAS SAAVEDRA'
                 , 'ravargas@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'KJBENAVIDES',
                 'KAREN JULIETH'
                 , 'BENAVIDES PARRA'
                 , 'kjbenavides@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'KLMACHADO',
                 'KAREN LORENA'
                 , 'MACHADO MERA'
                 , 'klmachado@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LABARONA',
                 'LADY ALEJANDRA'
                 , 'BARONA AVILES'
                 , 'labarona@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LAZULETA',
                 'LUZ ADRIANA'
                 , 'ZULETA OROZCO'
                 , 'lazuleta@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LDHERRERAA',
                 'LEYDI DAYANA'
                 , 'HERRERA ARISTIZABAL'
                 , 'ldherreraa@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LGCARDONA',
                 'LAURA GISSELL'
                 , 'CARDONA ARANGO'
                 , 'lgcardona@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LMPAVA',
                 'LINA MARIA'
                 , 'DE LA PAVA OCHOA'
                 , 'lmpava@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LMVILLAQUIRAN',
                 'LINA MARCELA'
                 , 'VILLAQUIRAN PEREZ'
                 , 'lmvillaquiran@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LVASQUEZ',
                 'LORENA'
                 , 'VASQUEZ RAMOS'
                 , 'lvasquez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MCCARDOZO',
                 'MARIA CONSTANZA'
                 , 'CARDOZO GARAVITO'
                 , 'mcardozo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MCOLAYA',
                 'MARIA CRISTINA'
                 , 'OLAYA SHEIK'
                 , 'mcolaya@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MECALVO',
                 'MARIA EUGENIA'
                 , 'CALVO PAVA'
                 , 'mecalvo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JLGRIJALBA',
                 'JHON LUCIO'
                 , 'GRIJALBA GARCIA'
                 , 'jlgrijalba@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ACARVAJAL',
                 'ALEXANDRA'
                 , 'CARVAJAL SERRATO'
                 , 'acarvajal@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'HSGARZON',
                 'HAROLD STEVEN'
                 , 'GARZON GOMEZ'
                 , 'hsgarzon@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MCSERNAV',
                 'MARIA CAMILA'
                 , 'SERNA VALENCIA'
                 , 'mcsernav@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AMHERNANDEZC',
                 'ANGIE MARCELA'
                 , 'HERNANDEZ CAMPO'
                 , 'amhernandezc@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'SIRECALDE',
                 'SORAYA ISABEL'
                 , 'RECALDE VERA'
                 , 'sirecalde@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LJBRINEZ',
                 'LAURA JINNETH'
                 , 'BRIÑEZ LOPEZ'
                 , 'ljbrinez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'FAFORERO',
                 'FRANK ALDAIR'
                 , 'FORERO SUNS'
                 , 'faforero@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )


                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CXCRUZ',
                 'CLAUDIA XIMENA'
                 , 'CRUZ GONZALEZ'
                 , 'cxcruz@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AMGONZALEZM',
                 'ANGELICA MARIA'
                 , 'GONZALEZ MEJIA'
                 , 'amgonzalez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LCPOLO',
                 'LUIS CARLOS'
                 , 'POLO ARANGO'
                 , 'lcpolo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'BEPATINO',
                 'BEATRIZ ELENA'
                 , 'PATIÑO VARGAS'
                 , 'bepatino@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'RACORDOBA',
                 'RICARDO ANDRES'
                 , 'CORDOBA HOYOS'
                 , 'racordoba@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LATORO',
                 'LUZ ADIELA'
                 , 'TORO GONZALEZ'
                 , 'latoro@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DBARRERA',
                 'DIANA'
                 , 'BARRERA SIERRA'
                 , 'dbarrera@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JLLANOS',
                 'JORGE'
                 , 'LLANOS RESTREPO'
                 , 'jllanos@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JKCALDERON',
                 'JEAN KEVIN'
                 , 'CALDERON PEREZ'
                 , 'SUMINISTROS@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MNAZARIT',
                 'MICHELL'
                 , 'NAZARIT PIÑEROS'
                 , 'mnazarit@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'GASILVA',
                 'GLORIA AMPARO'
                 , 'SILVA JAIMES'
                 , 'gasilva@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'NVEGAH',
                 'NATALY'
                 , 'VEGA HERNANDEZ'
                 , 'nvegah@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AMSANCHEZ',
                 'ANA MARCELA'
                 , 'SANCHEZ VALENCIA'
                 , 'amsanchez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AFLOPEZ',
                 'ANDRES FELIPE'
                 , 'LOPEZ MERA'
                 , 'aflopez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AORDONEZZ',
                 'ALEJANDRO'
                 , 'ORDOÑEZ ZAMARRIEGO'
                 , 'aordonezz@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CEPOLOR',
                 'CARLOS EDUARDO'
                 , 'POLO RODRIGUEZ'
                 , 'cepolor@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DAARROYO',
                 'DAMARIS ANGELICA'
                 , 'ARROYO POLINDARA'
                 , 'daarroyo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LMMURILLO',
                 'LUZ MAGNOLIA'
                 , 'MURILLO JARAMILLO'
                 , 'lmmurillo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JFITZGERALD',
                 'JOHANNA'
                 , 'FITZGERALD FERNANDEZ'
                 , 'jfitzgeraldf@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'FJRAMOS',
                 'FRANCISCO JOSE'
                 , 'RAMOS MONTOYA'
                 , 'fjramos@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'VBTINTINAGO',
                 'VIVIANA BEATRIZ'
                 , 'TINTINAGO CADENAS'
                 , 'vbtintinago@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CPCORONELL',
                 'CLAUDIA PATRICIA'
                 , 'CORONELL PEREZ'
                 , 'ccoronell@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Jefe de Abastecimiento')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AFQUINTERO',
                 'ANDRES FELIPE'
                 , 'QUINTERO RICO'
                 , 'afquintero@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LFARCILA',
                 'LUIS FERNANDO'
                 , 'ARCILA RAMIREZ'
                 , 'lfarcila@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'RATREJO',
                 'RICARDO ANDRES'
                 , 'TREJO BARBETTY'
                 , 'ratrejo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JAGIRALDO',
                 'JEFFREY ANDRES'
                 , 'GIRALDO ARISTIZABAL'
                 , 'jagiraldo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JJMEJIA',
                 'JOHN JAIDER'
                 , 'MEJIA MEJIA'
                 , 'jjmejia@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AMSOLARTE',
                 'ANA MARIA'
                 , 'SOLARTE QUEVEDO'
                 , 'amsolarte@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LDHURTADO',
                 'LAURA DOLLY'
                 , 'HURTADO GIRALDO'
                 , 'ldhurtado@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'RVASQUEZ',
                 'RODRIGO'
                 , 'VASQUEZ VICTORIA'
                 , 'rvasquez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )


                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'HFQUINTERO',
                 'HEYDER FABIAN'
                 , 'QUINTERO CHILITO'
                 , 'hfquintero@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LFMONTEROC',
                 'LUIS FELIPE'
                 , 'MONTERO CAÑAS'
                 , 'lfmonteroc@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JCMONROY',
                 'JUAN CAMILO'
                 , 'MONROY DE LOS RIOS'
                 , 'jcmonroy@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JIAGOMEZ',
                 'JIMMY ALBERTO'
                 , 'GOMEZ'
                 , 'jiagomez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AMTORRESD',
                 'ANA MILENA'
                 , 'TORRES DIAZ'
                 , 'amtorresd@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'SDAYALA',
                 'SARAY DAYHANA'
                 , 'AYALA RODRIGUEZ'
                 , 'sdayala@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'IHHOLGUIN',
                 'IVAN HERNANDO'
                 , 'HOLGUIN QUINTERO'
                 , 'ihholguin@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JCBARBERI',
                 'JUAN CAMILO'
                 , 'BARBERI NAAR'
                 , 'jcbarberi@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ARODRIGUEZ',
                 'ALDEMAR'
                 , 'RODRIGUEZ TRIANA'
                 , 'arodriguezt@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AJIMENEZ',
                 'ADRIANA'
                 , 'JIMENEZ MERA'
                 , 'ajimenez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'SMAMAYA',
                 'SANDRA MILENA'
                 , 'AMAYA TUTA'
                 , 'smamaya@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DMOROZCO',
                 'DAVID MAURICIO'
                 , 'OROZCO CANO'
                 , 'dmorozco@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DFMUNOZ',
                 'DIEGO FERNANDO'
                 , 'MUÑOZ QUINTERO'
                 , 'dfmunoz@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CMIGLESIAS',
                 'CAROLINA MARIA'
                 , 'IGLESIAS'
                 , 'cmiglesiasa@indugraficas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LFGUTIERREZ',
                 'LUISA FERNANDA'
                 , 'GUTIERREZ ECHEVERRI'
                 , 'lfgutierrez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Jefe de Abastecimiento')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ALHENAO',
                 'ANA LUCIA'
                 , 'HENAO TORO'
                 , 'alhenao@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LVMORALES',
                 'ELIZABETH'
                 , 'VALCKE MUÑOZ'
                 , 'evalcke@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'EJSOSSA',
                 'EDGAR DE JESUS'
                 , 'SOSA AMAYA'
                 , 'ejsossa@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'FLUGO',
                 'FRANCISCO JOSE'
                 , 'LUGO CHAVES'
                 , 'fjlugo@indugraficas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JCRIVERAC',
                 'JUAN CAMILO'
                 , 'RIVERA CALDERON'
                 , 'jcriverac@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'RAGONZALEZ',
                 'ROMEL ALEXIS'
                 , 'GONZALEZ MUÑOZ'
                 , 'ragonzalez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JCBRICENO',
                 'JUAN CAMILO'
                 , 'BRICEÑO RODRIGUEZ'
                 , 'jcbriceno@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'EZUNIGA',
                 'ESTEBAN'
                 , 'ZUÑIGA TORRES'
                 , 'ezuniga@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LFSALAZAR',
                 'LUISA FERNANDA'
                 , 'SALAZAR POLANCO'
                 , 'lfsalazar@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ERFLOREZ',
                 'EDWIN RAFAEL'
                 , 'FLOREZ PALENCIA'
                 , 'erflorez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LMRODRIGUEZ',
                 'LINA MARCELA'
                 , 'RODRIGUEZ CAMPO'
                 , 'lmrodriguez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LFJALIL',
                 'LUIS FELIPE'
                 , 'JALIL MONTOYA'
                 , 'lfjalil@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MFSANCHEZ',
                 'MATILDE FABIOLA'
                 , 'SANCHEZ VELEZ'
                 , 'mfsanchez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MFZULUAGA',
                 'MARIA FERNANDA'
                 , 'ZULUAGA ROBLEDO'
                 , 'mfzuluaga@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MQUINONEZ',
                 'MARILIZA'
                 , 'QUIÑONEZ CASTRO'
                 , 'mquinonez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'NEMARIN',
                 'NANCY ELENA DEL SOCORRO'
                 , 'MARIN BEDOYA'
                 , 'nmarin@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ADORTIZ',
                 'AMYELL DALILA'
                 , 'ORTIZ VALENCIA'
                 , 'adortiz@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CAQUINTERO',
                 'CARLOS ALBERTO'
                 , 'QUINTERO ROA'
                 , 'caquintero@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )



                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LDIAZB',
                 'LIBONIEL'
                 , 'DIAZ BETANCOURT'
                 , 'ldiazb@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LNINO',
                 'LEONOR'
                 , 'NIÑO RIVERA'
                 , 'lnino@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MMUNOZ',
                 'MAURICIO'
                 , 'MUÑOZ MENDOZA'
                 , 'mmunoz@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'PMUELAS',
                 'PATRICIA'
                 , 'MUELAS GONZALEZ'
                 , 'pmuelas@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'VEGONZALEZ',
                 'VICTORIA EUGENIA'
                 , 'GONZALEZ MARTINEZ'
                 , 'vegonzalez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'OAGOMEZ',
                 'OSCAR ANDRES'
                 , 'GOMEZ CALDERON'
                 , 'oagomez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AMARROQUIN',
                 'ANDERSON'
                 , 'MARROQUIN'
                 , 'amarroquin@indugraficas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DLRODRIGUEZ',
                 'DIANA LORENA'
                 , 'RODRIGUEZ BOLAÑOS'
                 , 'dlrodriguez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AMGONZALEZ',
                 'ANDRES MAURICIO'
                 , 'GONZALEZ LASSO'
                 , 'agonzalez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'BJMORENO',
                 'BASNY JOEL'
                 , 'MORENO POSADA'
                 , 'bjmoreno@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'BLOSORIO',
                 'BEATRIZ LUCILA'
                 , 'OSORIO DORADO'
                 , 'blosorio@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CFFERNANDEZ',
                 'CARLOS FERNANDO'
                 , 'FERNANDEZ NAVIA'
                 , 'cffernandez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CFLARA',
                 'CESAR FREDDY'
                 , 'LARA DE LA CRUZ'
                 , 'cflara@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MCLLANOS',
                 'MARIA CAMILA'
                 , 'LLANOS JARAMILLO'
                 , 'mcllanos@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LMMORENOH',
                 'LAURA MARIA'
                 , 'MORENO HERNANDEZ'
                 , 'lmmorenoh@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'TVMORENO',
                 'TANIA VANESSA'
                 , 'MORENO PINEDA'
                 , 'tvmoreno@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LLAGUILAR',
                 'LETICIA LISSETTE'
                 , 'AGUILAR TZOC'
                 , 'llaguilar@tqgrupo.com.gt'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DAPONTE',
                 'DUVAL'
                 , 'APONTE MONSALVE'
                 , 'daponte@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DFSERNA',
                 'DAVID FERNANDO'
                 , 'SERNA SERNA'
                 , 'dfserna@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ECSERNA',
                 'ELIZABETH CRISTINA'
                 , 'SERNA NOVOA'
                 , 'ecserna@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'FEPIEDRAHITA',
                 'FLOR EDEN'
                 , 'PIEDRAHITA GARCIA'
                 , 'fepiedrahita@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'HAMOSQUERA',
                 'HEIBER AILES'
                 , 'MOSQUERA MOSQUERA'
                 , 'hamosquera@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'HFASTUDILLO',
                 'HECTOR FABIO'
                 , 'ASTUDILLO CAMPO'
                 , 'hfastudillo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JAJAMAUCA',
                 'JAVIER ALFONSO'
                 , 'JAMAUCA MORA'
                 , 'jajamauca@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JCOLMOS',
                 'JUAN CARLOS'
                 , 'OLMOS'
                 , 'jcolmos@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JEARIZA',
                 'JORGE ENRIQUE'
                 , 'ARIZA BERNAL'
                 , 'jariza@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JHGARCIA',
                 'JORGE HUMBERTO'
                 , 'GARCIA BENAVIDES'
                 , 'jhgarcia@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JLOPEZ',
                 'JENNIFER'
                 , 'LOPEZ CORRALES'
                 , 'jlopez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JLSANDOVAL',
                 'JOSE LIBARDO'
                 , 'SANDOVAL SANCHEZ'
                 , 'jlsandoval@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JMCORREA',
                 'JUAN MANUEL'
                 , 'CORREA LENIS'
                 , 'jmcorrea@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JMMOSQUERA',
                 'JUAN MANUEL'
                 , 'MOSQUERA HOYOS'
                 , 'jmmosquera@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MLFERRO',
                 'MARTHA LIGIA'
                 , 'FERRO TENORIO'
                 , 'mlferro@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MLOPEZ',
                 'MARISOL'
                 , 'LOPEZ MONTENEGRO'
                 , 'mlopez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MPMENDEZ',
                 'MARIA DEL PILAR'
                 , 'MENDEZ HERNANDEZ'
                 , 'amcamilo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'GATELLEZ',
                 'GERMAN ALEXANDER'
                 , 'TELLEZ SILVA'
                 , 'gatellez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JVELASQUEZ',
                 'JOHNATAN'
                 , 'VELASQUEZ VASQUEZ'
                 , 'jvelasquez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )


                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MYUNDA',
                 'COMPRADOR'
                 , 'INTERFAZ'
                 , 'spbaez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MZVILLA',
                 'MARIA ZENEIDA'
                 , 'VILLA TANGARIFE'
                 , 'zvilla@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'PADELGADO',
                 'PAOLA ADRIANA'
                 , 'DELGADO AHUMADA'
                 , 'padelgado@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'PLONDONO',
                 'PIEDAD'
                 , 'LONDOÑO VIVAS'
                 , 'plondono@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'PROREJUELA',
                 'PABLO RUBEN'
                 , 'OREJUELA CHAVEZ'
                 , 'prorejuela@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'RNESTACIO',
                 'ROSA NURY'
                 , 'ESTACIO ANGULO'
                 , 'restacio@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'SPROBALLO',
                 'SANDRA PAOLA'
                 , 'ROBALLO CARRILLO'
                 , 'sproballo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'TPENA',
                 'THISBETH'
                 , 'PEÑA JIMENEZ'
                 , 'tpena@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'YAMANTILLA',
                 'YURI ANDREA'
                 , 'MANTILLA ROMAN'
                 , 'yamantilla@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'YGIRALDO',
                 'YANETH'
                 , 'GIRALDO NOGUERA'
                 , 'ygiraldo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MAGONZALEZR',
                 'MARIA ALEJANDRA'
                 , 'GONZALEZ RODRIGUEZ'
                 , 'magonzalezr@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JSRODRIGUEZ',
                 'JHOAN SEBASTIAN'
                 , 'RODRIGUEZ OSPINA'
                 , 'jsrodriguez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'TCARDENAS',
                 'TATIANA'
                 , 'CARDENAS CLEVES'
                 , 'tcardenas@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LLDUQUE',
                 'LEIDY LORENA'
                 , 'DUQUE PARRA'
                 , 'llduque@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'PDFUENTES',
                 'PATRICK DANIELS'
                 , 'FUENTES CASTILLO'
                 , 'pdfuentes@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JFCASTRILLON',
                 'JUAN FERNANDO'
                 , 'CASTRILLON MARQUEZ'
                 , 'jfcastrillon@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'GARESTREPO',
                 'GUSTAVO ADOLFO'
                 , 'RESTREPO FIGUEROA'
                 , 'garestrepo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ACABALLERO',
                 'ALEXANDER'
                 , 'CABALLERO CONTRERAS'
                 , 'acaballero@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'WEESCOBEDO',
                 'WILSON ENRIQUE'
                 , 'ESCOBEDO ALFONSO'
                 , 'weescobedo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JASANCHEZ',
                 'JORGE ANDRES'
                 , 'SANCHEZ COLORADO'
                 , 'jasanchez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MBROBLEDO',
                 'MARTHA BEATRIZ'
                 , 'ROBLEDO RESTREPO'
                 , 'mbrobledo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JSANCHEZT',
                 'JAMES'
                 , 'SANCHEZ TORRES'
                 , 'jsanchezt@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JBENACHI',
                 'JHON JEHIDER'
                 , 'BENACHI MORENO'
                 , 'BJHONJEHIDER@HOTMAIL.COM'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'FCUERO',
                 'FELIPE'
                 , 'CUERO'
                 , 'SOFIAPIPE27@HOTMAIL.COM'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CBENAVIDES',
                 'CAROLINA'
                 , 'BENAVIDES GAVIRIA'
                 , 'cbenavides@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JARINCON',
                 'JOSE DE LOS ANGELES'
                 , 'RINCON CHITO'
                 , 'jarincon@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JJVIATELA',
                 'JOSE JULIAN'
                 , 'VIATELA MORA'
                 , 'jviatela@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LAAGREDO',
                 'LUZ ADRIANA'
                 , 'AGREDO PATIÑO'
                 , 'laagredo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'NDNARANJO',
                 'NELSON DAVID'
                 , 'NARANJO ALVAREZ'
                 , 'ndnaranjo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'VRODRIGUEZ',
                 'VIVIANA'
                 , 'RODRIGUEZ AGUIRRE'
                 , 'vrodriguez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MDKUJUNDZIC',
                 'MARA DASHIELY'
                 , 'KUJUNDZIC RIVEROS'
                 , 'mdkujundzic@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CAMONSALVE',
                 'CARLOS ADOLFO'
                 , 'MONSALVE FONTALVO'
                 , 'camonsalve@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AMLOPEZ',
                 'ANGELA MARIA'
                 , 'LOPEZ BUENO'
                 , 'amlopez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CCCASTRILLON',
                 'CHRISTIAN CAMILO'
                 , 'CASTRILLON RENDON'
                 , 'cccastrillon@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CMGIRALDO',
                 'CLAUDIA MARCELA'
                 , 'GIRALDO GONZALEZ'
                 , 'cmgiraldo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'BIMONTOYA',
                 'BLANCA INES'
                 , 'MONTOYA FRANCO'
                 , 'bimontoya@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'EVALCKE',
                 'ELIZABETH'
                 , 'VALCKE MUÑOZ'
                 , 'evalcke@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DGALLEGO',
                 'DIEGO ALBERTO'
                 , 'GALLEGO QUICENO'
                 , 'dgallego@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ETRUJILLO',
                 'ERNESTO'
                 , 'TRUJILLO PEREZ'
                 , 'etrujillo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'HBOHORQUEZ',
                 'HUGO'
                 , 'BOHORQUEZ SILVA'
                 , 'hbohorquez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LFBEJARANO',
                 'LUIS FERNANDO'
                 , 'BEJARANO GARCIA'
                 , 'lfbejarano@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JALASSO',
                 'JESUS ALBERTO'
                 , 'LASSO CLAVIJO'
                 , 'jalasso@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MGOMEZ',
                 'MAURICIO'
                 , 'GOMEZ NAVARRETE'
                 , 'mgomez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JJTROCHEZ',
                 'JOHN JAIRO'
                 , 'TROCHEZ AMPUDIA'
                 , 'jjtrochez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JJARAMILLO',
                 'JULIANA'
                 , 'JARAMILLO SUAREZ'
                 , 'jjaramillo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ACAICEDOM',
                 'ALVARO'
                 , 'CAICEDO MARIN'
                 , 'acaicedo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MCBECERRA',
                 'MARIA CONSTANZA'
                 , 'BECERRA HORTUA'
                 , 'mcbecerra@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ABLUM',
                 'ALAN'
                 , 'BLUM VASQUEZ'
                 , 'ablum@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'NESPINOZA',
                 'NICOLL'
                 , 'ESPINOZA CHICAIZA'
                 , 'nespinoza@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AANZOLA',
                 'ADRIANA'
                 , 'ANZOLA GONZALEZ'
                 , 'aanzola@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JJBENACHI',
                 'JHON JEHIDER'
                 , 'BENACHI MORENO'
                 , 'jjbenachi@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'VARROYAVE',
                 'VALENTINA'
                 , 'ARROYAVE LOPEZ'
                 , 'varroyave@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MAMURIEL',
                 'MAYRA ALEJANDRA'
                 , 'MURIEL MUÑOZ'
                 , 'mamuriel@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LTACEVEDO',
                 'LEIDY TATIANA'
                 , 'ACEVEDO BERMUDEZ'
                 , 'ltacevedo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JDGOMEZQ',
                 'JUAN DAVID'
                 , 'GOMEZ QUINTERO'
                 , 'jdgomezq@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'APESCAR',
                 'ALEJANDRO'
                 , 'AGUDELO CASTAÑO'
                 , 'aagudeloc@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MABETANCUR',
                 'MAYRA ALEJANDRA'
                 , 'BETANCUR SANCHEZ'
                 , 'mabetancur@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MLOCAMPO',
                 'MYRIAM LORENA'
                 , 'OCAMPO OCAMPO'
                 , 'mlocampo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MMANYOMA',
                 'MARIBEL'
                 , 'MANYOMA MOSQUERA'
                 , 'mmanyoma@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'PPEREZ',
                 'PASTORA'
                 , 'PEREZ GARCIA'
                 , 'pperez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'RCARMONA',
                 'RAFAEL'
                 , 'CARMONA ACEVEDO'
                 , 'rcarmona@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JEGIRALDO',
                 'JORGE ENRIQUE'
                 , 'GIRALDO MONSALVE'
                 , 'jegiraldo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'SPERDOMO',
                 'SANDRA'
                 , 'PERDOMO FIGUEROA'
                 , 'sperdomo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'HANGULO',
                 'HERNANDO'
                 , 'ANGULO MOYANO'
                 , 'hangulo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'FJBARBERI',
                 'FRANCISCO JOSE'
                 , 'BARBERI OSPINA'
                 , 'PRESIDENCIA@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MMRESTREPO',
                 'MARGARITA MARIA'
                 , 'RESTREPO MOLINA'
                 , 'mrestrepo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'VAMUNOZ',
                 'VICTOR AUGUSTO'
                 , 'MUÑOZ RODRIGUEZ'
                 , 'vmunoz@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'VEGOMEZ',
                 'VILMA EUGENIA'
                 , 'GOMEZ BUILES'
                 , 'vegomez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MLRESTREPO',
                 'MARTHA LIDA'
                 , 'RESTREPO MONTOYA'
                 , 'mlrestrepo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JOBORJA',
                 'JOHN OSWALD GEOVANNY'
                 , 'BORJA HURTADO'
                 , 'joborja@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'NVPENA',
                 'NELSON VLADIMIR'
                 , 'PEÑA LOPEZ'
                 , 'nvpena@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MACARCAMO',
                 'MIGUEL ALEXANDER'
                 , 'CARCAMO RIVERA'
                 , 'macarcamo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'KLARCILA',
                 'KAREN LISETH'
                 , 'ARCILA CANO'
                 , 'klarcila@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DACORTES',
                 'DANIELA ALEXANDRA'
                 , 'CORTES RIOS'
                 , 'dacortes@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JSANTACRUZ',
                 'JULIANA'
                 , 'SANTACRUZ MEJIA'
                 , 'jsantacruz@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )


                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'KDAVILA',
                 'KAROL DAYANA'
                 , 'DE AVILA OROZCO'
                 , 'kdavila@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'BXTREJOS',
                 'BERTHA XIMENA'
                 , 'TREJOS'
                 , 'bxtrejos@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DOLAYA',
                 'DORIS'
                 , 'OLAYA MONTEALEGRE'
                 , 'dolaya@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'GAASTUDILLO',
                 'GERARDO ALFONSO'
                 , 'ASTUDILLO BUSTOS'
                 , 'gaastudillo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MARZUZA',
                 'MERCEDES CECILIA'
                 , 'ARZUZA VALENCIA'
                 , 'marzuza@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'HGOMEZ',
                 'HUMBERTO DE JESUS'
                 , 'GOMEZ RAMIREZ'
                 , 'hgomez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MIDUQUE',
                 'MARIA ISABEL'
                 , 'DUQUE GOMEZ'
                 , 'miduque@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AVARELA',
                 'ADRIANA'
                 , 'VARELA BORRERO'
                 , 'avarela@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ERODRIGUEZ',
                 'ELIZABETH'
                 , 'RODRIGUEZ MONERY'
                 , 'erodriguez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MGARCIAB',
                 'MAURICIO'
                 , 'GARCIA BENAVIDES'
                 , 'mgarciab@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ACAICEDO',
                 'ANIBAL'
                 , 'CAICEDO MARIN'
                 , 'acaicedom@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CLOPEZP',
                 'CAROLINA'
                 , 'LOPEZ PIEDRAHITA'
                 , 'clopez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LAFONSECA',
                 'LUIS ALBERTO'
                 , 'FONSECA RICO'
                 , 'LAFONSECA@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'YSAAVEDRA',
                 'YOHANNA'
                 , 'SAAVEDRA VANEGAS'
                 , 'ysaavedra@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )


                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DHURTADO',
                 'DANIELA'
                 , 'HURTADO QUINTERO'
                 , 'dhurtado@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'NGIL',
                 'NARALY'
                 , 'GIL ECHEVERRY'
                 , 'ngil@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LFROJAS',
                 'LUISA FERNANDA'
                 , 'ROJAS OCAMPO'
                 , 'lfrojas@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'TMOSQUERA',
                 'TOMAS'
                 , 'MOSQUERA JARAMILLO'
                 , 'tmosquera@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JSARANGOZ',
                 'JUAN SEBASTIAN'
                 , 'ARANGO ZAPATA'
                 , 'jsarangoz@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MVMEJIA',
                 'MARIA VICTORIA'
                 , 'MEJIA BRAVO'
                 , 'mvmejia@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JFFINO',
                 'JOHN FREDY'
                 , 'FINO NARANJO'
                 , 'jffino@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JGOCAMPO',
                 'JUAN GIOVANNI'
                 , 'OCAMPO RODAS'
                 , 'jgocampo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JNDIAZ',
                 'JOSE NIXON'
                 , 'DIAZ PIMIENTO'
                 , 'jndiaz@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JJGUALDRON',
                 'JULIE JASNEYD'
                 , 'GUALDRON JAIMES'
                 , 'jjgualdron@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LFNEIRA',
                 'LUIS FRANCISCO'
                 , 'NEIRA CARRILLO'
                 , 'lfneira@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MORTEGA',
                 'MARILUZ'
                 , 'ORTEGA OSPINA'
                 , 'mortega@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'PJCASALLAS',
                 'PEDRO JOSE'
                 , 'CASALLAS SANCHEZ'
                 , 'pcasallas@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'RAGALEANO',
                 'REINEL ARGEMIRO'
                 , 'GALEANO SAENZ'
                 , 'ragaleano@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'SPLOPEZ',
                 'SANDRA PATRICIA'
                 , 'LOPEZ GOMEZ'
                 , 'splopez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'WJRODRIGUEZ',
                 'WILLIAM DE JESUS'
                 , 'RODRIGUEZ MACIAS'
                 , 'wrodriguez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'KQUINTERO',
                 'KATHERINE'
                 , 'QUINTERO CHACON'
                 , 'kquintero@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'EANARVAEZ',
                 'ERIKA ANDREA'
                 , 'NARVAEZ GUTIERREZ'
                 , 'eanarvaez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JCLOPEZC',
                 'JUAN CAMILO'
                 , 'LOPEZ CASTAÑO'
                 , 'jclopez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )


                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'NSEMANATE',
                 'NATALIA'
                 , 'SEMANATE MARIN'
                 , 'nsemanate@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ATALARCON',
                 'ANGIE TATIANA'
                 , 'ALARCON MORENO'
                 , 'atalarcon@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LVASQUEZM',
                 'LILIANA'
                 , 'VASQUEZ MAYOR'
                 , 'lvasquezm@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JCLOPEZ',
                 'JENNY CAROLINA'
                 , 'LOPEZ ESPITIA'
                 , 'jclopeze@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ICRUIZ',
                 'IVONE CATALINA'
                 , 'RUIZ JIMENEZ'
                 , 'icruiz@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'NGUZMAN',
                 'NELLY'
                 , 'GUZMAN TRUJILLO'
                 , 'nguzman@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ARECALDE',
                 'ALESSANDRO'
                 , 'RECALDE RANDAZZO'
                 , 'arecalde@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DHERRERA',
                 'DAVID'
                 , 'HERRERA JARAMILLO'
                 , 'dherrera@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JDLONDONO',
                 'JORGE DEYVER'
                 , 'LONDOÑO BALCAZAR'
                 , 'jdlondono@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )


                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'EABACA',
                 'EDWAR ABERCIO'
                 , 'BACA PAZ'
                 , 'eabaca@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MGONZALEZ',
                 'MARIA ALEJANDRA'
                 , 'GONZALEZ RODRIGUEZ'
                 , 'magonzalezr@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'OJJIMENEZ',
                 'ONAN JEHU'
                 , 'JIMENEZ VALENCIA'
                 , 'ojjimenez@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LMPALACIOS',
                 'LUZ MARINA'
                 , 'PALACIOS QUENAN'
                 , 'lmpalacios@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LAVANDERHUCK',
                 'LAURA ALEJANDRA'
                 , 'VAN DER HUCK PEÑA'
                 , 'lavanderhuck@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AJROJAS',
                 'ALVARO JOSE'
                 , 'ROJAS MORENO'
                 , 'ajrojas@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )


                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'YBOCANEGRA',
                 'YOLANDA'
                 , 'BOCANEGRA PALACIOS'
                 , 'ybocanegra@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CFDUQUE',
                 'CRISTIAN FERNANDO'
                 , 'DUQUE ARENAS'
                 , 'cfduque@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ASAAVEDRA',
                 'ALEJANDRA'
                 , 'SAAVEDRA VANEGAS'
                 , 'asaavedra@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JJREYES',
                 'JOHN JAIRO'
                 , 'REYES GONZALEZ'
                 , 'jjreyes@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'RGUERRERO',
                 'ROCIO'
                 , 'GUERRERO TOQUICA'
                 , 'rguerrero@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DJARAMILLO',
                 'DANIELA'
                 , 'JARAMILLO TOBON'
                 , 'djaramillot@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JHARISMENDI',
                 'JAIME HUMBERTO'
                 , 'ARISMENDI MUÑOZ'
                 , 'jharismendi@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JPGRECH',
                 'JUAN PABLO'
                 , 'GRECH VIVAS'
                 , 'jpgrech@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'OLARIAS',
                 'OLGA LUCIA'
                 , 'ARIAS JORDAN'
                 , 'olarias@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'YVILLEGAS',
                 'YAMILETH'
                 , 'VILLEGAS VELEZ'
                 , 'yvillegas@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'GASUAREZ',
                 'GERMAN ALBERTO'
                 , 'SUAREZ HINCAPIE'
                 , 'gasuarez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JCCARDONA',
                 'JUAN CAMILO'
                 , 'CARDONA MELO'
                 , 'jccardona@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JPLAVERDE',
                 'JUAN PABLO'
                 , 'LAVERDE MARTINEZ'
                 , 'jplaverde@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )


                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CFCASTILLO',
                 'CARLOS FABIAN'
                 , 'CASTILLO BALANTA'
                 , 'cfcastillo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MTZAMORA',
                 'MAGGI TATIANA'
                 , 'ZAMORA RAMIREZ'
                 , 'mtzamora@tqgrupo.com.ec'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )


                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DAOSORIO',
                 'DIEGO ALEXANDER'
                 , 'OSORIO ZULUAGA'
                 , 'daosorio@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JCCUETO',
                 'JULIO CESAR'
                 , 'CUETO SARMIENTO'
                 , 'jccueto@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MLEAL',
                 'MONICA'
                 , 'LEAL SANTOFIMIO'
                 , 'mleal@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'SALZATE',
                 'SAININA'
                 , 'ALZATE RODRIGUEZ'
                 , 'salzate@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'SHERNANDEZ',
                 'SANDRA KATHERYNE'
                 , 'HERNANDEZ PEREZ'
                 , 'skhernandez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'GHERRERA',
                 'GIANCARLO'
                 , 'HERRERA MAPALLO'
                 , 'gherrera@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JADINAS',
                 'JOHAN ARMANDO'
                 , 'DINAS GARAY'
                 , 'jadinas@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JCLOPEZE',
                 'JENNY CAROLINA'
                 , 'LOPEZ ESPITIA'
                 , 'jclopeze@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CASALAZAR',
                 'CARLOS ANDRES'
                 , 'SALAZAR ANACONA'
                 , 'casalazar@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'NEFAJARDO',
                 'NUBIA ESPERANZA'
                 , 'FAJARDO COGUA'
                 , 'nefajardo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ACABRERA',
                 'ALEJANDRO'
                 , 'CABRERA ZAMORANO'
                 , 'acabrera@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AMADRINAN',
                 'ANDREA'
                 , 'MADRIÑAN OLANO'
                 , 'amadrinan@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AMMARIN',
                 'ANDRES MAURICIO'
                 , 'MARIN ELVIRA'
                 , 'ammarin@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CAMUNOZF',
                 'CARLOS ANDRES'
                 , 'MUÑOZ FERNANDEZ'
                 , 'camunozf@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'XPEREA',
                 'XIMENA'
                 , 'PEREA TORRES'
                 , 'xperea@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'FARESTREPO',
                 'FABIAN ANDRES'
                 , 'RESTREPO FIGUEROA'
                 , 'farestrepo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DEMONDRAGON',
                 'DANIEL ENRIQUE'
                 , 'MONDRAGON VALENCIA'
                 , 'demondragon@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'HHTELLEZ',
                 'HECTOR HUGO'
                 , 'TELLEZ PEDROSA'
                 , 'hhtellez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MEGOMEZ',
                 'MANUEL ESTEBAN'
                 , 'GOMEZ RAMIREZ'
                 , 'megomez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MLHERNANDEZ',
                 'MARTHA LUCIA'
                 , 'HERNANDEZ CAMPO'
                 , 'mlhernandez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LCRIVERA',
                 'LUIS CARLOS'
                 , 'RIVERA ZARATE'
                 , 'lcrivera@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'PACORREA',
                 'PAOLA ANDREA'
                 , 'CORREA GOMEZ'
                 , 'pacorrea@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MPEREZG',
                 'MAURICIO'
                 , 'PEREZ GIL'
                 , 'mperez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MFESCOBAR',
                 'MARIA FERNANDA'
                 , 'ESCOBAR DUQUE'
                 , 'mescobar@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CPCAMPO',
                 'CLAUDIA PATRICIA'
                 , 'CAMPO CRUZ'
                 , 'cpcampo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'OGOMEZP',
                 'OSCAR'
                 , 'GOMEZ PIEDRAHITA'
                 , 'ogomezp@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MTRUJILLO',
                 'MARICEL'
                 , 'TRUJILLO HOLGUIN'
                 , 'mtrujillo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ENAAR',
                 'ELIZABETH'
                 , 'NAAR ESCAMILLA'
                 , 'enaar@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LEGUZMAN',
                 'LUZ ELENA'
                 , 'GUZMAN CASTILLO'
                 , 'leguzman@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MCZAPATA',
                 'MARIA CLAUDIA'
                 , 'ZAPATA MELO'
                 , 'mczapata@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'NDONADO',
                 'NATALIA'
                 , 'DONADO MEDINA'
                 , 'ndonado@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )


                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MAVALENZUELA',
                 'MICHELLE ANDREA'
                 , 'VALENZUELA CIFUENTES'
                 , 'mavalenzuela@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LAOSPINA',
                 'LUZ ANDREA'
                 , 'OSPINA VASQUEZ'
                 , 'laospina@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JATARAZONA',
                 'JULIAN RICARDO'
                 , 'TARAZONA ARCHILA'
                 , 'jtarazona@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'RRENGIFO',
                 'RAMIRO'
                 , 'RENGIFO REINA'
                 , 'rrengifo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DMARIAS',
                 'DIANA MARIA'
                 , 'ARIAS TAMAYO'
                 , 'dmarias@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JPERALTA',
                 'JOHANNA'
                 , 'PERALTA MONTOYA'
                 , 'jperalta@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'KDCABRERA',
                 'KAREN DANIELA'
                 , 'CABRERA TOVAR'
                 , 'kdcabrera@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'YPPINILLA',
                 'YENNY PAOLA'
                 , 'PINILLA NARANJO'
                 , 'yppinilla@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JERESTREPOM',
                 'JOHN ESTEBAN'
                 , 'RESTREPO MARIN'
                 , 'jerestrepom@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CAGONZALEZA',
                 'CARLOS ANDRES'
                 , 'GONZALEZ AGUDELO'
                 , 'cagonzaleza@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'GAMAZUERA',
                 'GERMAN ALONSO'
                 , 'MAZUERA PATIÑO'
                 , 'gamazuera@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AYGOMEZ',
                 'ALBA YULIETH'
                 , 'GOMEZ RAMIREZ'
                 , 'aygomez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MBUITRON',
                 'MARLA'
                 , 'BUITRON LOPEZ'
                 , 'mbuitron@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ITSOLARTE',
                 'INGRID TATIANA'
                 , 'SOLARTE ORTIZ'
                 , 'itsolarte@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CFARBOLEDA',
                 'CRISTIAN FERNANDO'
                 , 'ARBOLEDA CUELLAR'
                 , 'cfarboleda@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'PNERIO',
                 'PATRICIA DEL CARMEN'
                 , 'NERIO DE ARANA'
                 , 'pnerio@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'EGONZALEZ',
                 'EFREN'
                 , 'GONZALEZ GUERRERO'
                 , 'egonzalez@indugraficas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'EGALLO',
                 'EDWIN'
                 , 'GALLO FRANCO'
                 , 'egallo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DEMARTINEZ',
                 'DANIEL EDUARDO'
                 , 'MARTINEZ ANGEL'
                 , 'demartinez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'VVALENCIA',
                 'VIVIANA'
                 , 'VALENCIA GORDILLO'
                 , 'vvalencia@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MOBONAGA',
                 'MAURICIO'
                 , 'OBONAGA GIL'
                 , 'mobonaga@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AMURREGO',
                 'ANA MILENA'
                 , 'URREGO TORO'
                 , 'amurrego@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AEBARRERA',
                 'ANDERSON ESTIVE'
                 , 'BARRERA PEREZ'
                 , 'aebarrera@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'EJROMERO',
                 'ERIKA JANETH'
                 , 'ROMERO TORRES'
                 , 'ejromero@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LORDONEZ',
                 'LAURA'
                 , 'ORDOÑEZ CAMELO'
                 , 'lordonez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MFCASTANEDA',
                 'MARIA FERNANDA'
                 , 'CASTAÑEDA BOHORQUEZ'
                 , 'mfcastaneda@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MSTERLING',
                 'MARLON ANTONIO'
                 , 'STERLING AMEZQUITA'
                 , 'msterling@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'NHERNANDEZ',
                 'NASLY'
                 , 'HERNANDEZ LADINO'
                 , 'nhernandez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JRLENIS',
                 'JAIME RICARDO'
                 , 'LENIS BRAVO'
                 , 'jrlenis@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )




                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JLROMERO',
                 'JOSE LUIS'
                 , 'ROMERO PERLAZA'
                 , 'jlromero@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )







                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AWESTRADA',
                 'ANTONY WILLIAM'
                 , 'ESTRADA GARCIA'
                 , 'awestrada@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CADELACRUZ',
                 'CESAR AUGUSTO'
                 , 'DE LA CRUZ MENDEZ'
                 , 'cadelacruz@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DDIAZ',
                 'DIOVAN'
                 , 'DIAZ NAVARRO'
                 , 'ddiaz@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DDURANGO',
                 'DERLY'
                 , 'DURANGO LOPEZ'
                 , 'ddurango@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DFMONTOYA',
                 'DIEGO FERNANDO'
                 , 'MONTOYA SALAZAR'
                 , 'dfmontoya@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DMTIBADUIZA',
                 'DIANA MARIA'
                 , 'TIBADUIZA MONTENEGRO'
                 , 'dmtibaduiza@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'FECARDONA',
                 'FABIO EDUARDO'
                 , 'CARDONA CHACON'
                 , 'fecardona@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'FRAMIREZP',
                 'FERNANDO'
                 , 'RAMIREZ PEÑA'
                 , 'framirezp@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'GAMONTOYA',
                 'GUSTAVO ADOLFO'
                 , 'MONTOYA SANCHEZ'
                 , 'gamontoya@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'HCARDENAS',
                 'HEBER EVELIO'
                 , 'CARDENAS TRIANA'
                 , 'hcardenas@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'HDMIRANDA',
                 'HERNAN DARIO'
                 , 'MIRANDA PEDRAZA'
                 , 'hdmiranda@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JACANON',
                 'JAIME ALONSO'
                 , 'CANON QUESADA'
                 , 'jacanon@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JAGALLO',
                 'JORGE ALBERTO'
                 , 'GALLO GOMEZ'
                 , 'jagallo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JAMORENO',
                 'JUAN ANDRES'
                 , 'MORENO MORENO'
                 , 'jamoreno@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )


                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CHURREGO',
                 'CARLOS HERNAN'
                 , 'URREGO PEÑALOZA'
                 , 'churrego@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AMVALENCIA',
                 'ANGELA MARIA'
                 , 'VALENCIA IZQUIERDO'
                 , 'amvalencia@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CJLLANOS',
                 'CLAUDIA JIMENA'
                 , 'LLANOS MORENO'
                 , 'cjllanos@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'EVALENCIAV',
                 'ELIZABETH'
                 , 'VALENCIA VALENCIA'
                 , 'evalenciav@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )


                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MFPARDO',
                 'MARIA FERNANDA'
                 , 'PARDO BARRERA'
                 , 'mfpardo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'EPASCUASA',
                 'ESTEFANIA'
                 , 'PASCUASA RAMIREZ'
                 , 'epascuasa@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )


                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'KMHERNANDEZ',
                 'KARLA MARIA'
                 , 'HERNANDEZ GARCIA'
                 , 'kmhernandez@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ACAMILO',
                 'ANA MILENA'
                 , 'CAMILO MOSQUERA'
                 , 'amcamilo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LCVELASQUEZ',
                 'LUZ CARIME'
                 , 'VELASQUEZ BORRERO'
                 , 'lcvelasquez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MPCORREA',
                 'MARIA DEL PILAR'
                 , 'CORREA LENIS'
                 , 'mpcorrea@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MPRIZO',
                 'MARIA DEL PILAR'
                 , 'RIZO ARANGO'
                 , 'mprizo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'OPARRA',
                 'OSCAR ADOLFO'
                 , 'PARRA ECHEVERRI'
                 , 'oparra@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AGOMEZ',
                 'ALEJANDRO'
                 , 'GOMEZ SAAVEDRA'
                 , 'agomez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'GSANCHEZ',
                 'GUSTAVO ADOLFO'
                 , 'SANCHEZ LESMES'
                 , 'gsanchez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'OESCOBAR',
                 'OMAR ALEXANDER'
                 , 'ESCOBAR ANDRADE'
                 , 'oescobar@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'RGUALDRON',
                 'ROBERTO'
                 , 'GUALDRON VARGAS'
                 , 'rgualdron@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LMOSORIOF',
                 'LAURA MARCELA'
                 , 'OSORIO FRANCO'
                 , 'LMOSORIOF@GMAIL.COM'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'GMEDINAE',
                 'GERARDO'
                 , 'MEDINA ESCOBAR'
                 , 'gmedinae@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CHRODRIGUEZ',
                 'CARLOS HERNAN'
                 , 'RODRIGUEZ RODRIGUEZ'
                 , 'chrodriguez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AMHINESTROSAC',
                 'ADRIANA MARIA'
                 , 'HINESTROSA CAICEDO'
                 , 'amhinestrosac@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DADUQUE',
                 'DUBIAN ALBERTO'
                 , 'DUQUE ALZATE'
                 , 'daduque@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DGALLEGOA',
                 'DANIELA'
                 , 'GALLEGO ALVAREZ'
                 , 'dgallegoa@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'PSANTA',
                 'PATRICIA'
                 , 'SANTA DUQUE'
                 , 'psanta@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'XNIETO',
                 'XIOMARA'
                 , 'NIETO FRANCO'
                 , 'amcamilo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LASARRIA',
                 'LUIGI ALEJANDRO'
                 , 'SARRIA AGUIRRE'
                 , 'calopez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JDRIOS',
                 'JOSE DANIEL'
                 , 'RIOS MORALES'
                 , 'calopez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )



                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JGESCOBAR',
                 'JULIAN GILDARDO'
                 , 'ESCOBAR LOPEZ'
                 , 'jgescobar@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'KMUNOZ',
                 'KEVIN'
                 , 'MUÑOZ PEREA'
                 , 'kmunoz@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'GYFERNANDEZ',
                 'GILMA YESENIA'
                 , 'FERNANDEZ MEDINA'
                 , 'gyfernandez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LMATEHORTUA',
                 'LUISA MARIA'
                 , 'ATEHORTUA TAQUEZ'
                 , 'lmatehortua@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )




                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JHINCAPIE',
                 'JENNIFER'
                 , 'HINCAPIE CIFUENTES'
                 , 'jhincapie@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JMRAMOS',
                 'JOSE MIGDONIO'
                 , 'RAMOS DIAZ'
                 , 'jmramos@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AMCORREA',
                 'ANGELA MARIA'
                 , 'CORREA CARDONA'
                 , 'amcorrea@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'NERAZO',
                 'NICOL YULIANA'
                 , 'ERAZO VALENCIA'
                 , 'nerazo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CMARBOLEDA',
                 'CLAUDIA MILENA'
                 , 'ARBOLEDA RAMIREZ'
                 , 'cmarboleda@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LANARANJO',
                 'LUZ ANGELA'
                 , 'NARANJO DAZA'
                 , 'lanaranjo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CAMALLAMA',
                 'CESAR AUGUSTO'
                 , 'MALLAMA QUIMBAYA'
                 , 'camallama@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'YVAGUDELO',
                 'YURY VIVIANA'
                 , 'AGUDELO JARAMILLO'
                 , 'yvagudelo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'YHERNANDEZ',
                 'YERALDINE'
                 , 'HERNANDEZ MUÑOZ'
                 , 'yhernandez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LFGIRALDO',
                 'LUISA FERNANDA'
                 , 'GIRALDO CORREA'
                 , 'lfgiraldo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'KAOSPINA',
                 'KATHERYNE ANDREA'
                 , 'OSPINA CIFUENTES'
                 , 'kaospina@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MELEDESMA',
                 'MARY ESBEY'
                 , 'LEDESMA BETANCOURT'
                 , 'meledesma@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LAPARDO',
                 'LUIS ALFONSO'
                 , 'PARDO'
                 , 'lapardo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'SLPLATA',
                 'SINDY LORENA'
                 , 'PLATA GIL'
                 , 'slplata@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'EATOBAR',
                 'ERASMO ANTONIO'
                 , 'TOBAR MENENDEZ'
                 , 'eatobar@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DMONTOYA',
                 'DANIELA'
                 , 'MONTOYA YEPES'
                 , 'dmontoya@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'EEALAS',
                 'EDGAR ERNESTO'
                 , 'ALAS MENJIVAR'
                 , 'eealas@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JCGOMEZM',
                 'JEAN CARLO'
                 , 'GOMEZ MOSQUERA'
                 , 'jcgomezm@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LPLOZANO',
                 'LINA PAOLA'
                 , 'LOZANO MONTERROZA'
                 , 'lplozano@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LMTIRADO',
                 'LINA MARIA'
                 , 'TIRADO GALLEGO'
                 , 'lmtirado@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'EJGUZMAN',
                 'ELIANA JANETH'
                 , 'GUZMAN GIRALDO'
                 , 'ejguzman@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MIMARTINEZ',
                 'MARIA ISABEL'
                 , 'MARTINEZ AGUIRRE'
                 , 'mimartinez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MAMONTOYA',
                 'MARIA ALEJANDRA'
                 , 'MONTOYA YEPES'
                 , 'mamontoya@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ECAMPOC',
                 'EVELYN'
                 , 'CAMPO CARMONA'
                 , 'ecampoc@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LFDURANGO',
                 'LUIS FELIPE'
                 , 'DURANGO CRUZ'
                 , 'lfdurango@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DMMURIEL',
                 'DIANA MARCELA'
                 , 'MURIEL PARRA'
                 , 'dmmuriel@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AMRIOS',
                 'ANA MARIA'
                 , 'RIOS MILLAN'
                 , 'amrios@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'HDGONZALEZ',
                 'HOOVER DAVID'
                 , 'GONZALEZ ESPINOSA'
                 , 'hdgonzalez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DCMESSU',
                 'DIANA CAROLINA'
                 , 'MESSU LLANO'
                 , 'dcmessu@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MIHERNANDEZ',
                 'MARIA ISABEL'
                 , 'HERNANDEZ SANTIBAÑEZ'
                 , 'mihernandez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MLMUNOZ',
                 'MARTHA LUCIA'
                 , 'MUÑOZ OTERO'
                 , 'mlmunoz@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JCORTEGA',
                 'JUAN CAMILO'
                 , 'ORTEGA JARAMILLO'
                 , 'jcortega@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ORAMIREZG',
                 'OBIRNE'
                 , 'RAMIREZ GOMEZ'
                 , 'oramirezg@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MYGALINDO',
                 'MAYRA YISELLA'
                 , 'GALINDO SANCHEZ'
                 , 'mygalindo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'YCRUZ',
                 'YOHANA'
                 , 'CRUZ MORENO'
                 , 'ycruz@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AMORENO',
                 'ALEJANDRO'
                 , 'MORENO HURTADO'
                 , 'amoreno@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AJRAMIREZ',
                 'ANTONIO'
                 , 'RAMIREZ ECHAVE'
                 , 'ajramirez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'BEALVAREZ',
                 'BEATRIZ EUGENIA'
                 , 'ALVAREZ OSSA'
                 , 'bealvarez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DQUIJANO',
                 'DIEGO HUMBERTO'
                 , 'QUIJANO REISNER'
                 , 'dquijano@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ESARDI',
                 'EMILIO'
                 , 'SARDI APARICIO'
                 , 'esardi@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'KABRAVO',
                 'KEREN ALEJANDRA'
                 , 'BRAVO CANDELO'
                 , 'kabravo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MAPASCUAS',
                 'MANUEL ALEJANDRO'
                 , 'PASCUAS ECHEVERRY'
                 , 'mapascuas@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ASNARVAEZ',
                 'ANGIE STEFANNY'
                 , 'NARVAEZ OSORIO'
                 , 'asnarvaez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'NZCONTRERAS',
                 'NISSI ZUSELY'
                 , 'CONTRERAS HERNANDEZ'
                 , 'nzcontreras@tqgrupo.com.gt'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )


                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JANORIEGA',
                 'JARLY ANDRES'
                 , 'NORIEGA CARBONELL'
                 , 'janoriega@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JAPARDO',
                 'JHONY ALEXANDER'
                 , 'PARDO URBANO'
                 , 'japardo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JCARDILA',
                 'JUAN CAMILO'
                 , 'ARDILA CHAPARRO'
                 , 'jcardila@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JMESA',
                 'JAMILETH'
                 , 'MESA ARIAS'
                 , 'jmesa@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ELEON',
                 'EDWIN'
                 , 'LEON'
                 , 'eleon@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'RARBELAEZ',
                 'RODOLFO'
                 , 'ARBELAEZ ALZATE'
                 , 'rarbelaez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MALEDESMA',
                 'MAYRA ALEJANDRA'
                 , 'LEDESMA CONSTAIN'
                 , 'maledesma@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'EPINILLAG',
                 'ESTEBAN'
                 , 'PINILLA GUTIERREZ'
                 , 'epinillag@indugraficas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AFORTIZ',
                 'ANDRES FELIPE'
                 , 'ORTIZ RENGIFO'
                 , 'afortiz@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'APESCARRAGA',
                 'ADRIANA PATRICIA'
                 , 'ESCARRAGA MERA'
                 , 'apescarraga@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'HECARTAGENA',
                 'HAROLD EMILIO'
                 , 'CARTAGENA MONTEALEGRE'
                 , 'hecartagena@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AXOCAMPO',
                 'ANGIE XIMENA'
                 , 'OCAMPO HERNANDEZ'
                 , 'axocampo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LGONZALEZ',
                 'LEONARDO'
                 , 'GONZALEZ RINCON'
                 , 'lgonzalezr@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'TMMARTINEZ',
                 'TANIA MARCELA'
                 , 'MARTINEZ GOMEZ'
                 , 'tmmartinez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'SLCARTAGENA',
                 'STEFANY LIZETH'
                 , 'CARTAGENA ALCANTAR'
                 , 'slcartagena@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JSMONTOYA',
                 'JUAN SEBASTIAN'
                 , 'MONTOYA RENGIFO'
                 , 'jsmontoya@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CDESPINOSA',
                 'CRISTHIAN DAVID'
                 , 'ESPINOSA TORRES'
                 , 'cdespinosa@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LDDIAZ',
                 'LUIS DANIEL'
                 , 'DIAZ TAPIA'
                 , 'lddiaz@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'KLTRUJILLO',
                 'KAROL LIZETH'
                 , 'TRUJILLO RAMIREZ'
                 , 'kltrujillo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'SAJIMENEZ',
                 'SALVADOR ALEXANDER'
                 , 'JIMENEZ VENTURA'
                 , 'sajimenez@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CASUAREZ',
                 'CARLOS ALBERTO'
                 , 'SUAREZ GARZON'
                 , 'casuarez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JLCAMACHO',
                 'JOSE LUIS'
                 , 'CAMACHO CEBALLOS'
                 , 'jlcamacho@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AAVEGA',
                 'ARIEL AUGUSTO'
                 , 'VEGA NAÑEZ'
                 , 'aavega@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MSMONTERROSA',
                 'MICHELLE STEPHANIE'
                 , 'MONTERROSA GUZMAN'
                 , 'msmonterrosa@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'VMARINL',
                 'VALENTINA'
                 , 'MARIN LARRAHONDO'
                 , 'vmarinl@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )


                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JTGIL',
                 'JULIETH TATIANA'
                 , 'GIL ECHEVERRY'
                 , 'jtgil@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'NUSUGA',
                 'NATALIA'
                 , 'USUGA PEREZ'
                 , 'nusuga@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JCAMADOR',
                 'JUAN CARLOS'
                 , 'AMADOR MESTRA'
                 , 'jcamador@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'YLASSO',
                 'YARLEDI'
                 , 'LASSO GAVIRIA'
                 , 'ylasso@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JBARBOSA',
                 'JENNIFER'
                 , 'BARBOSA CARDONA'
                 , 'amcamilo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'KVBOCANEGRA',
                 'KAROL VIVIANA'
                 , 'BOCANEGRA PORTELA'
                 , 'kvbocanegra@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JGRISALES',
                 'JESSICA'
                 , 'GRISALES MATALLANA'
                 , 'jgrisales@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ARICO',
                 'ANGIE'
                 , 'RICO MOLINA'
                 , 'arico@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LMGUERRA',
                 'LINA MARIA'
                 , 'GUERRA FLOREZ'
                 , 'lmguerra@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AMALVAREZ',
                 'ANA MARIA'
                 , 'ALVAREZ ROBLEDO'
                 , 'amalvarez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MAROJANO',
                 'MARIA ANGELICA'
                 , 'ROJANO DE ORO'
                 , 'marojano@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CIDARRAGA',
                 'CAROLINA'
                 , 'IDARRAGA RAMIREZ'
                 , 'cidarraga@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MMAMADO',
                 'MARIA MARTHA'
                 , 'AMADO TEJADA'
                 , 'mmamado@tqgrupo.com.ec'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'YLMORALES',
                 'YULI LICETH'
                 , 'MORALES DIAZ'
                 , 'ylmorales@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'INPLAZAS',
                 'INGRID NAYIVE'
                 , 'PLAZAS LEIVA'
                 , 'inplazas@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JASANCHEZD',
                 'JULIAN ANDRES'
                 , 'SANCHEZ DAZA'
                 , 'jasanchezd@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DOSPINA',
                 'DIANA'
                 , 'OSPINA HOYOS'
                 , 'dospina@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ASVALLEJO',
                 'ANDRES SEBASTIAN'
                 , 'VALLEJO ORDOÑEZ'
                 , 'asvallejo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'REOROZCO',
                 'ROSA ELENA'
                 , 'OROZCO ALVAREZ'
                 , 'reorozco@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JFVANEGAS',
                 'JUAN FELIPE'
                 , 'VANEGAS OBANDO'
                 , 'jfvanegas@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'HRESTREPO',
                 'HAIANNY'
                 , 'RESTREPO MONTES'
                 , 'hrestrepo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LJBENAVIDES',
                 'LEIDY JOHANNA'
                 , 'BENAVIDES IMBACHI'
                 , 'ljbenavides@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'IBUSTAMANTE',
                 'ISABELLA'
                 , 'BUSTAMANTE RINCON'
                 , 'ibustamante@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'YVELASCO',
                 'YOLIMA'
                 , 'VELASCO LATORRE'
                 , 'yvelasco@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'EDMUNOZ',
                 'ESTEBAN DARIO'
                 , 'MUÑOZ LASSO'
                 , 'edmunoz@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'SMMORALES',
                 'SANDRA MILENA'
                 , 'MORALES ROMERO'
                 , 'smmorales@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JFZAMORA',
                 'JHON FERNANDO'
                 , 'ZAMORA GONZALEZ'
                 , 'jfzamora@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ABARBERI',
                 'ARMANDO'
                 , 'BARBERI ABADIA'
                 , 'abarberi@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'KESQUIVEL',
                 'KEVIN'
                 , 'ESQUIVEL LOZANO'
                 , 'kesquivel@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'PMQUINONES',
                 'PAULA MARCELA'
                 , 'QUIÑONES IRIARTE'
                 , 'pmquinones@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LFDUARTE',
                 'LUIS FERNANDO'
                 , 'DUARTE BUITRAGO'
                 , 'lfduarte@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ECSILVA',
                 'EVA CRISTINA'
                 , 'SILVA LEON'
                 , 'amcamilo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'HJROMERO',
                 'HAROLD JIMMY'
                 , 'ROMERO VASQUEZ'
                 , 'hjromero@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'SHERRERA',
                 'SANDRA PATRICIA'
                 , 'HERRERA RAMOS'
                 , 'sherrera@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MMASMILA',
                 'MAURICIO'
                 , 'MASMILA MURILLO'
                 , 'mmasmila@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ENESTRELLA',
                 'ESNEIDY NATALY'
                 , 'ESTRELLA ALVEAR'
                 , 'enestrella@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'KCIFUENTES',
                 'KAREM'
                 , 'CIFUENTES AGUDELO'
                 , 'kcifuentes@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CJDELGADO',
                 'CARLOS JULIO'
                 , 'DELGADO ALTAMIRANO'
                 , 'cjdelgado@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'RSCARPIO',
                 'ROLANDO SALOMON AMERICO'
                 , 'CARPIO MEJIA'
                 , 'rscarpio@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )



                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AMCAMILOM',
                 'ANA MILENA'
                 , 'CAMILO MOSQUERA'
                 , 'amcamilo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JCAGUIRRE',
                 'JUAN CAMILO'
                 , 'AGUIRRE MEJIA'
                 , 'jcaguirre@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JPOSSA',
                 'JUAN PABLO'
                 , 'OSSA GONZALEZ'
                 , 'jpossa@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MIRENGEL',
                 'MARTHA ISABEL'
                 , 'RENGEL MEJIA'
                 , 'mirengel@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JJRAMIREZ',
                 'JHON JAIRO'
                 , 'RAMIREZ OSORIO'
                 , 'jjramirez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CXDELGADO',
                 'CLAUDIA XIMENA'
                 , 'DELGADO HERNANDEZ'
                 , 'cxdelgado@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ELBEDOYA',
                 'EDGAR LEANDRO'
                 , 'BEDOYA HOYOS'
                 , 'elbedoya@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ECOLAVIZZAF',
                 'ENRIQUE'
                 , 'COLAVIZZA FLOYD'
                 , 'ecolavizzaf@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MLCASTILLO',
                 'MARTA LUCIA'
                 , 'CASTILLO LARA'
                 , 'mlcastillo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MCHEJNE',
                 'MARUEM'
                 , 'CHEJNE GOMEZ'
                 , 'mchejne@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MPSOTO',
                 'MARIA DEL PILAR'
                 , 'SOTO ROMERO'
                 , 'mpsoto@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CMILLAN',
                 'CESAR ANDRES'
                 , 'MILLAN VALDES'
                 , 'cmillan@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JARANGO',
                 'JAVIER'
                 , 'ARANGO MURGUEITIO'
                 , 'jarango@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'NRAMIREZ',
                 'NATALIA'
                 , 'RAMIREZ SILVA'
                 , 'nramirez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'PGESCOBAR',
                 'PAOLA GABRIELA'
                 , 'ESCOBAR ORTIZ'
                 , 'pgescobar@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LHSIGUENZA',
                 'LUIS HERNAN'
                 , 'SIGUENZA QUEZADA'
                 , 'lhsiguenza@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MNIRAHETA',
                 'MARLIN NEFTALY'
                 , 'IRAHETA VALENCIA'
                 , 'mniraheta@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CLJURADO',
                 'CARMEN LORENA'
                 , 'JURADO JIMENEZ'
                 , 'cljurado@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'BAGUDELO',
                 'BLADIMIR'
                 , 'AGUDELO SALAZAR'
                 , 'bagudelo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'SMPINEDA',
                 'SAHARA MARIA'
                 , 'PINEDA SANTANDER'
                 , 'smpineda@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ASALAZAR',
                 'ANDREA'
                 , 'SALAZAR CONDE'
                 , 'asalazar@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'BATERREROS',
                 'BYRON ALBERTO'
                 , 'TERREROS SANTOS'
                 , 'baterreros@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'APGIRALDO',
                 'ANDREA DEL PILAR'
                 , 'GIRALDO URREA'
                 , 'apgiraldo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LLPEREZ',
                 'LEYDIS LAURA'
                 , 'PEREZ PAREJO'
                 , 'llperez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CCLOAIZA',
                 'CILIA CAROLINA'
                 , 'LOAIZA ACOSTA'
                 , 'ccloaiza@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )


                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'RETRIANA',
                 'ROXANA ELIZABETH'
                 , 'TRIANA VACA'
                 , 'retriana@tqgrupo.com.ec'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'WINSUASTI',
                 'WENDY PATRICIA'
                 , 'INSUASTI CORONEL'
                 , 'winsuasti@tqgrupo.com.ec'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'SJAGUIRRE',
                 'SANTIAGO JOSE'
                 , 'AGUIRRE ARAQUE'
                 , 'sjaguirre@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ALMONTOYA',
                 'ALBA LILIANA'
                 , 'MONTOYA REYES'
                 , 'departamentodeseguridad@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DALEON',
                 'DANIEL ANDRES'
                 , 'LEON CRUZ'
                 , 'daleon@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ELOURIDO',
                 'EVELIN JOHANA'
                 , 'LOURIDO VIAFARA'
                 , 'elourido@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CORTIZ',
                 'CAROLINA'
                 , 'ORTIZ LOPEZ'
                 , 'cortiz@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'OJNIEBLES',
                 'ORLANDO JOSE'
                 , 'NIEBLES EVILLA'
                 , 'ojniebles@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MGQUINTANILLA',
                 'MARIA GUADALUPE'
                 , 'QUINTANILLA ESCAMILLA'
                 , 'mgquintanilla@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'PJOLANO',
                 'PEDRO JOSE'
                 , 'OLANO GOMEZ'
                 , 'pjolano@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )


                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JMMORA',
                 'JHON MAICOL'
                 , 'MORA ALVAREZ'
                 , 'jmmora@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'YOBANDO',
                 'YEISON'
                 , 'OBANDO HENAO'
                 , 'yobando@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'BABENAVIDES',
                 'BRANDON ALEXIS'
                 , 'BENAVIDES FRANCO'
                 , 'babenavides@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DAOCAMPO',
                 'DAVID ALEJANDRO'
                 , 'OCAMPO RODRIGUEZ'
                 , 'daocampo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JVILLALOBOS',
                 'JIRET'
                 , 'VILLALOBOS HERNANDEZ'
                 , 'jvillalobos@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JSCARDONA',
                 'JUAN SEBASTIAN'
                 , 'CARDONA CASTILLO'
                 , 'jscardona@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CRAMIREZ',
                 'CHRISTIAN JOSE'
                 , 'RAMIREZ ECHAVE'
                 , 'cramirez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'YROMEROS',
                 'YANETH'
                 , 'ROMERO SOLANO'
                 , 'yromeros@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'NARDILA',
                 'NORBERTO'
                 , 'ARDILA DURAN'
                 , 'nardila@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MAGARZON',
                 'MIGUEL ANGEL'
                 , 'GARZON GARZON'
                 , 'magarzon@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DFORREGO',
                 'DIEGO FERNANDO'
                 , 'ORREGO VALENCIA'
                 , 'dforrego@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MCGRAJALES',
                 'MILTON CESAR'
                 , 'GRAJALES GARCIA'
                 , 'mcgrajales@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MEBECOCHE',
                 'MARIA EUGENIA'
                 , 'BECOCHE VALENCIA'
                 , 'mebecoche@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JLLASO',
                 'JOSE LUIS'
                 , 'LASSO FORERO'
                 , 'jllasso@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'NACALDERON',
                 'NOE AMILCAR'
                 , 'CALDERON PINEDA'
                 , 'nacalderon@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'IMORELLANA',
                 'IDALIA MARIA'
                 , 'ORELLANA QUIÑONEZ'
                 , 'imorellana@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'BJBELTRAN',
                 'BERTILA JEANNETTE'
                 , 'BELTRAN MAZARIEGO'
                 , 'bjbeltran@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MEGALDAMEZ',
                 'MARINA ESTELA'
                 , 'GALDAMEZ DE MARAVILLA'
                 , 'megaldamez@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'HIGALVEZ',
                 'HERBERT IVAN'
                 , 'GALVEZ RIVAS'
                 , 'higalvez@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'OMMENDOZA',
                 'OSCAR MAURICIO'
                 , 'MENDOZA MORALES'
                 , 'ommendoza@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LDBEDOYA',
                 'LIZETH DAHIAN'
                 , 'BEDOYA LONDOÑO'
                 , 'ldbedoya@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'HFMURCIA',
                 'HECTOR FABIO'
                 , 'MURCIA CASTRO'
                 , 'hfmurcia@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )



                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MAMURILLO',
                 'MAYRA ALEJANDRA'
                 , 'MURILLO VARON'
                 , 'mamurillo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ACBEDOYA',
                 'ANGIE CATHERINE'
                 , 'BEDOYA ZULUAGA'
                 , 'acbedoya@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'RRRODRIGUEZ',
                 'RAUL RONNIE'
                 , 'RODRIGUEZ MEJIA'
                 , 'rrrodriguez@tqgrupo.com.ec'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'BLBODERO',
                 'BRENDA LISSETE'
                 , 'BODERO RAMOS'
                 , 'blbodero@tqgrupo.com.ec'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JCGONZALEZG',
                 'JULIO CESAR'
                 , 'GONZALEZ GAVIRIA'
                 , 'jcgonzalezg@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'WAQUINTERO',
                 'WILSON ANDRES'
                 , 'QUINTERO CARDONA'
                 , 'waquintero@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LGUEVARA',
                 'LUCY'
                 , 'GUEVARA TORO'
                 , 'lguevara@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CAGONZALEZ',
                 'CESAR AUGUSTO'
                 , 'GONZALEZ GRAJALES'
                 , 'amcamilo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AVRIVAS',
                 'ADILIA VIOLETA'
                 , 'RIVAS CASTRO'
                 , 'avrivas@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'BALOPEZ',
                 'BLANCA ALEJANDRA'
                 , 'LOPEZ GALVEZ'
                 , 'balopez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CLSUAREZ',
                 'CLAUDIA LORENA'
                 , 'SUAREZ RAMIREZ'
                 , 'amcamilo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JIZQUIERDOT',
                 'JULIETH'
                 , 'IZQUIERDO TRIVIÑO'
                 , 'jizquierdot@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'NNTOLEDO',
                 'NATASHA NICOLE'
                 , 'TOLEDO RUGEL'
                 , 'nntoledo@tqgrupo.com.ec'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'IBARONA',
                 'ISABELLA'
                 , 'BARONA FERNANDEZ'
                 , 'ibarona@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LFVILLEGAS',
                 'LIXA FERNANDA'
                 , 'VILLEGAS CARABALI'
                 , 'lfvillegas@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DJAMPUDIA',
                 'DIEGO JOSE'
                 , 'AMPUDIA DOMINGUEZ'
                 , 'djampudia@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AGALVAREZ',
                 'ANA GEORGINA'
                 , 'ALVAREZ ALVARADO'
                 , 'agalvarez@tqgrupo.com.ec'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JMFIGUEROA',
                 'JOHAN MAURICIO'
                 , 'FIGUEROA PIEDRAHITA'
                 , 'jmfigueroa@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'YPGARCIA',
                 'YESSICA PAOLA'
                 , 'GARCIA GARCIA'
                 , 'ypgarcia@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'EEPANIAGUA',
                 'EDGARDO ENRIQUE'
                 , 'PANIAGUA HERNANDEZ'
                 , 'eepaniagua@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MCAYALA',
                 'MARIA CATALINA'
                 , 'AYALA DE RIVERA'
                 , 'mcayala@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'VACRUZ',
                 'VICTOR ALEXANDER'
                 , 'DE LA CRUZ HERNANDEZ'
                 , 'vacruz@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MDLLERENA',
                 'MARTHA DANIELA'
                 , 'LLERENA AGUILERA'
                 , 'mdllerena@tqgrupo.com.ec'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ELSERRANO',
                 'ERIKA LISET'
                 , 'SERRANO DE VARELA'
                 , 'elserrano@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CRALAS',
                 'CARLOS ROBERTO'
                 , 'ALAS'
                 , 'cralas@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'FRSEGOVIA',
                 'FRANCIA ROCIO DE LOS ANGELES'
                 , 'SEGOVIA DE VAQUERO'
                 , 'frsegovia@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'REMARTINEZ',
                 'ROMILIA ESPERANZA'
                 , 'MARTINEZ DE VENTURA'
                 , 'remartinez@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AVEGAL',
                 'ADRIANA'
                 , 'VEGA LOZANO'
                 , 'avegal@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MMENDEZ',
                 'MELISSA'
                 , 'MENDEZ VERGARA'
                 , 'mmendez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JAVELANDIA',
                 'JOSE ALEJANDRO'
                 , 'VELANDIA SOLARTE'
                 , 'javelandia@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'NEARIAS',
                 'NOEMY ELIZABETH'
                 , 'ARIAS NERIO'
                 , 'nearias@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'PAGOMEZ',
                 'PABLO ANDRES'
                 , 'GOMEZ CASTRO'
                 , 'pagomez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JAGARCIAL',
                 'JOSE ALFREDO'
                 , 'GARCIA LOPEZ'
                 , 'jagarcial@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CAMARQUEZ',
                 'CARLOS ANDRES'
                 , 'MARQUEZ BARRIOS'
                 , 'camarquez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DEGARCIA',
                 'DANIEL EDUARDO'
                 , 'GARCIA BACCA'
                 , 'dgarcia@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JMORTIZ',
                 'JAVIER'
                 , 'MEJIA ORTIZ'
                 , 'jmejia@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JDALDANA',
                 'JUAN DAVID'
                 , 'ALDANA BENITEZ'
                 , 'jdaldana@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JDGOMEZ',
                 'JUAN DAVID'
                 , 'GOMEZ GRUESO'
                 , 'jdgomez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JFESTRADA',
                 'JUAN FELIPE'
                 , 'ESTRADA ARANA'
                 , 'jfestrada@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LEJARAMILLO',
                 'LUCAS'
                 , 'ESCOBAR JARAMILLO'
                 , 'lescobarj@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LMMARQUEZ',
                 'LIGIA MARCELA'
                 , 'MARQUEZ QUINTERO'
                 , 'lmmarquez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MCJIMENEZ',
                 'MARIA CLARA'
                 , 'JIMENEZ CARDOZO'
                 , 'mcjimenez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MZCARDONA',
                 'MELISSA'
                 , 'ZAMBRANO CARDONA'
                 , 'mzambrano@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DCSORNOZA',
                 'DIANA CAROLINA'
                 , 'SORNOZA MENDOZA'
                 , 'dcsornoza@tqgrupo.com.ec'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'SOBANDO',
                 'SERGIO'
                 , 'OBANDO'
                 , 'sobando@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'KDDIAZ',
                 'KELLY DAYANNA'
                 , 'DIAZ ARAGON'
                 , 'kddiaz@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JISAENZ',
                 'JAIME IGNACIO'
                 , 'SAENZ OSPINA'
                 , 'jisaenz@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AMBRIZUELA',
                 'ANGEL MANUEL'
                 , 'BRIZUELA SOMOZA'
                 , 'ambrizuela@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )












                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'HLTORRES',
                 'HELLEN LIZETH'
                 , 'TORRES DIAZ'
                 , 'hltorres@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'SDIAZS',
                 'SEBASTIAN'
                 , 'DIAZ SERRANO'
                 , 'sdiazs@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JEPAEZ',
                 'JORGE ENRIQUE'
                 , 'PAEZ ALBARRACIN'
                 , 'jepaez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ASGARCIA',
                 'ARTURO SEGUNDO'
                 , 'GARCIA POGO'
                 , 'asgarcia@tqgrupo.com.ec'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'HCALAD',
                 'HENDERSON'
                 , 'CALAD BLANCO'
                 , 'hcalad@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )


                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'APBENAVIDES',
                 'ADRIANA PATRICIA'
                 , 'BENAVIDES IMBACHI'
                 , 'apbenavides@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'KJRIVERA',
                 'KELY JHOVANNA'
                 , 'RIVERA MACIAS'
                 , 'kjrivera@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AOROZCO',
                 'ANDRES'
                 , 'OROZCO LOPEZ'
                 , 'aorozco@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'TYHERNANDEZ',
                 'TIRZA YAMILETH'
                 , 'HERNANDEZ ESTRADA'
                 , 'tyhernandez@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LSAPARICIO',
                 'LUIS SANDERS'
                 , 'APARICIO AGUILAR'
                 , 'lsaparicio@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DMRODRIGUEZ',
                 'DIANA MARIA'
                 , 'RODRIGUEZ GARZON'
                 , 'dmrodriguez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'WARIAS',
                 'WALTER'
                 , 'ARIAS MARTINEZ'
                 , 'warias@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'NMMORENO',
                 'NORMA MARLENE DEL PILAR'
                 , 'MORENO DE SALAS'
                 , 'nmmoreno@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MDMUNOZ',
                 'MARCOS DAVID'
                 , 'MUÑOZ SOTO'
                 , 'mdmunoz@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LAROJAS',
                 'LUIS ALBERTO'
                 , 'ROJAS OROZCO'
                 , 'larojas@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MFJURADO',
                 'MARIA FERNANDA'
                 , 'JURADO ROSAS'
                 , 'mfjurado@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'GARODRIGUEZB',
                 'GUSTAVO ADOLFO'
                 , 'RODRIGUEZ BALLESTEROS'
                 , 'garodriguezb@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Jefe de Abastecimiento')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LNLAMUS',
                 'LISETH NATHALIA'
                 , 'LAMOS VELASCO'
                 , 'lnlamus@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JAGOMEZ',
                 'JORGE ANDRES'
                 , 'GOMEZ CASTRO'
                 , 'weescobedo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )


                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'GROSERO',
                 'GERMAN'
                 , 'ROSERO DIAZ'
                 , 'grosero@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MVILLANUEVA',
                 'MAURICIO'
                 , 'VILLANUEVA ARIAS'
                 , 'mvillanueva@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'BAVALENCIA',
                 'BRANDON ALEXANDER'
                 , 'VALENCIA CUERO'
                 , 'pruebas@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )




                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JAVELASQUEZ',
                 'JENNY ALEXANDRA'
                 , 'VELASQUEZ GARCES'
                 , 'javelasquez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JAURREA',
                 'JORGE ARMANDO'
                 , 'URREA HIDALGO'
                 , 'jaurrea@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'RCORREA',
                 'RICARDO'
                 , 'CORREA VELASQUEZ'
                 , 'rcorrea@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DDURANH',
                 'DANIELA'
                 , 'DURAN HOYOS'
                 , 'dduranh@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'SVELASCO',
                 'SEBASTIAN'
                 , 'VELASCO GUALDRON'
                 , 'svelasco@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JSANCHEZ',
                 'JAIR'
                 , 'SANCHEZ GARCIA'
                 , 'jsanchez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ABAGUILERA',
                 'ANDREA BELEN'
                 , 'AGUILERA CHUCHUCA'
                 , 'abaguilera@tqgrupo.com.ec'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MBVALDIVIEZO',
                 'MICHAEL BORIS'
                 , 'VALDIVIEZO GARZON'
                 , 'mbvaldiviezo@tqgrupo.com.ec'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'KMRODRIGUEZ',
                 'KAREN MARIEL'
                 , 'RODRIGUEZ CHAVEZ'
                 , 'kmrodriguez@tqgrupo.com.ec'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MJGONZALEZ',
                 'MARIA JULIANA'
                 , 'GONZALEZ LOPEZ'
                 , 'mjgonzalezl@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ABARRAGAN',
                 'ANDREA'
                 , 'BARRAGAN NIÑO'
                 , 'abarragan@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'KLMONSALVE',
                 'KENNY LORENA'
                 , 'MORALES MONSALVE'
                 , 'klmorales@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ZNORTEGA',
                 'ZOILA NURIA'
                 , 'ORTEGA ORELLANA'
                 , 'znortega@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JDROMEROR',
                 'JOSE DANIEL'
                 , 'ROMERO RIVERA'
                 , 'jdromeror@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CJGRAJALES',
                 'CAMILO JOSE'
                 , 'GRAJALES ORTIZ'
                 , 'cjgrajales@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JKENNEDY',
                 'JHON KENNEDY'
                 , 'CAPOTE URBANO'
                 , 'weescobedo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )


                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JOROZCO',
                 'JONATHAN'
                 , 'OROZCO PEÑA'
                 , 'jorozcop@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )




                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LPANTOJA',
                 'LEDER DUVIAN'
                 , 'PANTOJA OJEDA'
                 , 'raleman@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JCBRICEÑO',
                 'JUAN CAMILO'
                 , 'BRICEÑO RODRIGUEZ'
                 , 'jcbriceno@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JGLERMA',
                 'JOSE GABRIEL'
                 , 'LERMA RIVAS'
                 , 'raleman@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DFSANTAMARIA',
                 'DAVID FELIPE'
                 , 'SANTAMARIA VILLALOBOS'
                 , 'raleman@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'EZUÑIGA',
                 'ESTEBAN'
                 , 'ZUÑIGA TORRES'
                 , 'ezuniga@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )


                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JTARAZONA',
                 'JULIAN RICARDO'
                 , 'TARAZONA ARCHILA'
                 , 'jtarazona@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JAMONTOYA',
                 'JOSE ANDRES'
                 , 'MONTOYA VALENCIA'
                 , 'jamontoya@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AARISTIZABAL',
                 'ADOLFO'
                 , 'ARISTIZABAL PICO'
                 , 'aaristizabal@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'NCRIVERA',
                 'NORA CECILIA'
                 , 'RIVERA GARCIA'
                 , 'ncrivera@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AEGUTIERREZ',
                 'ANDRES EDUARDO'
                 , 'GUTIERREZ GIRALDO'
                 , 'aegutierrez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'SDUQUE',
                 'SANTIAGO'
                 , 'DUQUE FRANCO'
                 , 'sduque@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'HJQUINTERO',
                 'HERNANDO JOSE'
                 , 'QUINTERO ROMERO'
                 , 'hjquintero@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'GAJARAMILLO',
                 'GERMAN ANDRES'
                 , 'JARAMILLO NAVIA'
                 , 'gajaramillo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MFAGURTO',
                 'MARIA FERNANDA'
                 , 'AGURTO MONTES'
                 , 'mfagurto@tqgrupo.com.ec'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'KYUPEGUI',
                 'KELLY YOHANA'
                 , 'UPEGUI TORO'
                 , 'kyupegui@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'RIORTEGA',
                 'ROGER IVENTHS'
                 , 'ORTEGA TREJOS'
                 , 'riortega@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AMCANAS',
                 'ALEJANDRA MARIA'
                 , 'CAÑAS MONTES'
                 , 'amcanas@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JAMAHECHA',
                 'JULIO ANDRES'
                 , 'MAHECHA LOZANO'
                 , 'jamahecha@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'SOSORIO',
                 'SARAY'
                 , 'OSORIO ZAPATA'
                 , 'sosorio@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LATASCON',
                 'LIDA AMPARO'
                 , 'TASCON VICTORIA'
                 , 'latascon@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AVQUIROGA',
                 'ANLY VIVIAN'
                 , 'QUIROGA REY'
                 , 'avquiroga@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DFAGUDELO',
                 'DARWIN FABIAN'
                 , 'AGUDELO MEDINA'
                 , 'dfagudelo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )




                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'PCSTERLING',
                 'PABLO CESAR'
                 , 'STERLING CIFUENTES'
                 , 'gatellez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'EGONZALIAS',
                 'EULISES'
                 , 'GONZALIAS BANGUERO'
                 , 'egonzalias@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'HGVARGAS',
                 'HAROL GIOVANNI'
                 , 'VARGAS LASSO'
                 , 'hgvargas@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DASALAZAR',
                 'DIEGO ANDRES'
                 , 'SALAZAR OREJUELA'
                 , 'dasalazar@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'KYMELO',
                 'KAREN JULIETH'
                 , 'MELO SAAVEDRA'
                 , 'kjmelo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JJGONZALEZ',
                 'JAIME JAVIER'
                 , 'GONZALEZ CARDOZO'
                 , 'jjgonzalez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'BBOTINA',
                 'BYRON GERMAN'
                 , 'BOTINA SILVA'
                 , 'bbotina@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CSEMAAN',
                 'CAROLINA'
                 , 'SEMAAN LINCE'
                 , 'csemaan@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'YACEVEDO',
                 'YHUSSEF'
                 , 'ACEVEDO ABDELGANY'
                 , 'yacevedo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CARAMIREZ',
                 'CESAR AUGUSTO'
                 , 'LOPEZ RAMIREZ'
                 , 'calopez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'KDHERNANDEZ',
                 'KAREN DANIELA'
                 , 'HERNANDEZ JIMENEZ'
                 , 'kdhernandez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'EPGUIJARRO',
                 'ERIKA PAOLA'
                 , 'GUIJARRO NORIEGA'
                 , 'epguijarro@tqgrupo.com.ec'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'YAVELASCO',
                 'YEINMI ANDREA'
                 , 'VELASCO PECHENE'
                 , 'yavelasco@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CACAMACHO',
                 'CARLOS ALBERTO'
                 , 'CAMACHO MUÑOZ'
                 , 'cacamacho@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DFRODRIGUEZ',
                 'DIANA FERNANDA'
                 , 'RODRIGUEZ VERA'
                 , 'dfrodriguez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LTORO',
                 'LAURA PATRICIA'
                 , 'TORO CIFUENTES'
                 , 'ltoro@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AMSILVESTRE',
                 'SILVESTRE ALIRIO'
                 , 'GARCIA MELENDEZ'
                 , 'amsilvestre@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AMCAMILO',
                 'ANA MILENA'
                 , 'CAMILO MOSQUERA'
                 , 'amcamilo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JEMOLINA',
                 'JENNIFER ESMERALDA'
                 , 'MOLINA GARCIA'
                 , 'jemolina@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LMBAJANA',
                 'LUISA MARIA'
                 , 'BAJAÑA VERA'
                 , 'lmbajana@tqgrupo.com.ec'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'IETOBAR',
                 'IRMA ELIZABETH'
                 , 'TOBAR REYES'
                 , 'ietobar@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AQUINTEROU',
                 'ALEJANDRO'
                 , 'QUINTERO USMA'
                 , 'aquinterou@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'KLRODALLEGA',
                 'KAREN LIZETH'
                 , 'RODALLEGA CHANDILLO'
                 , 'klrodallega@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JFCARDONA',
                 'JUAN FELIPE'
                 , 'CARDONA RENGIFO'
                 , 'jfcardona@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LROMERO',
                 'LAURA'
                 , 'ROMERO ACOSTA'
                 , 'lromero@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'FAOSORIO',
                 'FABIAN ANDRES'
                 , 'OSORIO FRANCO'
                 , 'faosorio@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CIMEZA',
                 'CHRISTEL ISABEL'
                 , 'MEZA CERCADO'
                 , 'cimeza@tqgrupo.com.ec'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JMOLINA',
                 'JAIME'
                 , 'MOLINA GARZON'
                 , 'jmolina@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CMSERRANO',
                 'CELMA MILDRED'
                 , 'SERRANO MOTTA'
                 , 'cmserrano@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CEALVAREZ',
                 'CAMILO ERNESTO'
                 , 'ALVAREZ OCHOA'
                 , 'cealvarez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CECUELLAR',
                 'CAROLINA ELIZABETH'
                 , 'CUELLAR DE MELGAR'
                 , 'cecuellar@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JRESTREPOO',
                 'JULIANA'
                 , 'RESTREPO OROZCO'
                 , 'jrestrepoo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'EVROSERO',
                 'ESTEFANY VANESSA'
                 , 'ROSERO BARCO'
                 , 'evrosero@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'FRALAGUNA',
                 'FRANCISCO RODOLFO'
                 , 'ALAGUNA MONTEJO'
                 , 'fralaguna@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LEMILLAN',
                 'LUIS EDUARDO'
                 , 'MILLAN MANZANO'
                 , 'lemillan@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'XAMORENO',
                 'XIMENA ALEJANDRA'
                 , 'MORENO PEREZ'
                 , 'xamoreno@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'VMARULANDA',
                 'VALENTINA'
                 , 'MARULANDA'
                 , 'vmarulanda@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AGUEVARA',
                 'ALEXIS'
                 , 'GUEVARA MOLANO'
                 , 'aguevara@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'KPAREDES',
                 'KIMBERLY'
                 , 'PAREDES KLINGER'
                 , 'kparedes@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ACGOMEZ',
                 'ANDREA CAROLINA'
                 , 'GOMEZ GARCIA'
                 , 'acgomez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AFANGULO',
                 'ANDRES FELIPE'
                 , 'ANGULO RIASCOS'
                 , 'afangulo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'PESALGUERO',
                 'PATRICIA ELIZABETH'
                 , 'SALGUERO DE CASTELLANOS'
                 , 'pesalguero@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CAVALLECILLA',
                 'CAMILO ANDRES'
                 , 'VALLECILLA COLONIA'
                 , 'cavallecilla@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DMMARTINEZ',
                 'DIANA MARCELA'
                 , 'MARTINEZ ROCHA'
                 , 'dmmartinez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'GVDIAZ',
                 'GLENDY VERONICA'
                 , 'DIAZ PEREZ'
                 , 'gvdiaz@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'FLHERNANDEZ',
                 'FATIMA LEONILA'
                 , 'HERNANDEZ DE ESCOBAR'
                 , 'flhernandez@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'GFPOLANCO',
                 'GUILLERMO FRANCISCO'
                 , 'POLANCO MAGAÑA'
                 , 'gfpolanco@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'NHPINEDA',
                 'NORMA HERENIA'
                 , 'PINEDA MAJANO'
                 , 'nhpineda@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JFMARTINEZ',
                 'JOSE FELIPE'
                 , 'MARTINEZ LOZANO'
                 , 'jfmartinez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JHERRERA',
                 'JULIANA'
                 , 'HERRERA DELGADO'
                 , 'jherrera@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MPARRA',
                 'MONICA MARIA'
                 , 'PARRA ECHEVERRI'
                 , 'mparra@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'EVILLEGAS',
                 'EDINSON'
                 , 'VILLEGAS VELEZ'
                 , 'evillegas@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JJSANCHEZ',
                 'JOSEPH JULIAN'
                 , 'SANCHEZ ALBARRACIN'
                 , 'jjsanchez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'SOJEDA',
                 'SEBASTIAN'
                 , 'OJEDA SANTAMARIA'
                 , 'sojeda@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AMGUTIERREZ',
                 'ANDRES MAURICIO'
                 , 'GUTIERREZ BETANCOURT'
                 , 'amgutierrez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CRIVAS',
                 'CAMILO'
                 , 'RIVAS PARRA'
                 , 'crivas@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'OFCRISTANCHO',
                 'OMAR FABIAN'
                 , 'CRISTANCHO DURAN'
                 , 'ofcristancho@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MILENIS',
                 'MARIA ISABEL'
                 , 'LENIS SALDAÑA'
                 , 'milenis@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JSVARGAS',
                 'JUAN SEBASTIAN'
                 , 'VARGAS SOTO'
                 , 'jsvargas@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MLMANCIPE',
                 'MARIA LISSET'
                 , 'MANCIPE GRASS'
                 , 'mlmancipe@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LMABRIL',
                 'LINA MARIA'
                 , 'ABRIL OLAYA'
                 , 'lmabril@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MCRIVERA',
                 'MARIELA CECILIA'
                 , 'RIVERA RESTREPO'
                 , 'mcrivera@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MVCANAS',
                 'MARCOS VINICIO'
                 , 'CAÑAS MINERO'
                 , 'mvcanas@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'SAREVALO',
                 'SALVADOR ALFREDO'
                 , 'AREVALO HASBUN'
                 , 'saarevalo@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )


                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'EVSUDARIO',
                 'ELIZA VIVIANA'
                 , 'SUDARIO MARTINEZ'
                 , 'evsudario@tqgrupo.com.ec'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AQUINTEROV',
                 'ALEJANDRA'
                 , 'QUINTERO VALENCIA'
                 , 'aquinterov@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MIMOSQUERA',
                 'MELISSA INES'
                 , 'MOSQUERA SOTO'
                 , 'mimosquera@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AFGARCES',
                 'ANDRES FELIPE'
                 , 'GARCES TABARES'
                 , 'afgarces@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DEANGEL',
                 'DELMY ELIZABETH'
                 , 'ANGEL ALVARADO'
                 , 'deangel@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AFABRIL',
                 'ANDRES FELIPE'
                 , 'ABRIL OLAYA'
                 , 'afabril@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AFABRIL2',
                 'ANDRES FELIPE'
                 , 'ABRIL OLAYA'
                 , 'afabril@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AFLARGO',
                 'ANDRES FELIPE'
                 , 'LARGO TABORDA'
                 , 'aflargo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ADARIAS',
                 'ABDUL DAYANNA'
                 , 'ARIAS URREGO'
                 , 'adarias@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'VHERNANDEZ',
                 'VALENTINA'
                 , 'HERNANDEZ GARCIA'
                 , 'vhernandez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )


                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'VCASTELLANOS',
                 'VANESSA'
                 , 'CASTELLANOS AGUADO'
                 , 'vcastellanos@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'OMENESES',
                 'OSWALDO'
                 , 'MENESES MUÑOZ'
                 , 'omeneses@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JCCORREAG',
                 'JUAN CAMILO'
                 , 'CORREA GUISAO'
                 , 'jccorreag@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JAECHEVERRY',
                 'JULIANA ANDREA'
                 , 'ECHEVERRI PIEDRAHITA'
                 , 'jaecheverri@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JSOTOA',
                 'JAMES'
                 , 'SOTO AGUILAR'
                 , 'jsotoa@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DMPAZOS',
                 'DANIEL MAURICIO'
                 , 'PAZOS RODRIGUEZ'
                 , 'dmpazos@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'NIZURIETA',
                 'NATALIA'
                 , 'IZURIETA ZORRILLA'
                 , 'nizurieta@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CARUIZ',
                 'CARLOS ANDRES'
                 , 'RUIZ BOTERO'
                 , 'caruiz@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CSANTA',
                 'CAMILO'
                 , 'SANTA RODRIGUEZ'
                 , 'csanta@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JTRUJILLOP',
                 'JAQUELINE'
                 , 'TRUJILLO PEREZ'
                 , 'jtrujillop@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LVLUNA',
                 'LEIDY VIVIANA'
                 , 'LUNA GARCIA'
                 , 'lvluna@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JFTARAPUES',
                 'JENNY FERNANDA'
                 , 'TARAPUES NOGUERA'
                 , 'jftarapues@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'BBELTRAN',
                 'BRAYAN STEVEN'
                 , 'BELTRAN IBARRA'
                 , 'bbeltran@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ESOTOMAYOR',
                 'EVELYN TERESA'
                 , 'SOTOMAYOR DE VALLES'
                 , 'esotomayor@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'SMMUNOZA',
                 'SILVIA MELISSA'
                 , 'MUÑOZ ARCE'
                 , 'smmunoza@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DCPUENTES',
                 'DIANA CAROLINA'
                 , 'PUENTES ORTIZ'
                 , 'dcpuentes@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'KDCAMARGO',
                 'KAREN DAYANA'
                 , 'CAMARGO ESPARZA'
                 , 'kdcamargo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'SILOPEZ',
                 'SANDRA ISABEL'
                 , 'LOPEZ PRIETO'
                 , 'silopez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AMSAAVEDRA',
                 'ANA MILENA'
                 , 'SAAVEDRA GIRALDO'
                 , 'amsaavedra@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DPMENA',
                 'DIANA PATRICIA'
                 , 'MENA ESPINOSA'
                 , 'dpmena@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JLUCIO',
                 'JAIME ALBERTO'
                 , 'LUCIO VILLAQUIRAN'
                 , 'jalucio@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MISANCHEZ',
                 'MARIA ISABEL'
                 , 'SANCHEZ RAMIREZ'
                 , 'misanchez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'SRAMIREZ',
                 'SHIRLEY'
                 , 'RAMIREZ BARONA'
                 , 'sramirez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LTEJADA',
                 'LEINE'
                 , 'TEJADA PESCADOR'
                 , 'ltejada@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JPRAMIREZ',
                 'JUAN PABLO'
                 , 'RAMIREZ HELAGO'
                 , 'jpramirez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'FBAEZA',
                 'FARLEY'
                 , 'BAEZA RAMOS'
                 , 'fbaeza@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ATALVAREZ',
                 'ALEXA TATIANA'
                 , 'ALVAREZ QUINTERO'
                 , 'atalvarez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CDJSANCHEZ',
                 'CLAUDIA DE JESUS'
                 , 'SANCHEZ DE MARROQUIN'
                 , 'cdjsanchez@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'IPDIAZ',
                 'IRIANA PAOLA'
                 , 'DIAZ CONTRERAS'
                 , 'ipdiaz@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JTMENDOZA',
                 'JOSSELYN THALIA'
                 , 'MENDOZA PONCE'
                 , 'jtmendoza@tqgrupo.com.ec'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MECHEVERRY',
                 'MONYCA'
                 , 'ECHEVERRY ARANGO'
                 , 'mecheverry@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'NIRAMIREZ',
                 'NELSON IVAN'
                 , 'RAMIREZ CONTRERAS'
                 , 'niramirez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AMABADIA',
                 'AURA MARIA'
                 , 'ABADIA JIMENEZ'
                 , 'amabadia@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'GPLOPEZ',
                 'GINA PAOLA'
                 , 'LOPEZ VARELA'
                 , 'gplopez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'FESCOBAR',
                 'FAINORY'
                 , 'ESCOBAR ARIAS'
                 , 'fescobar@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MKMARTINEZ',
                 'MIKE KEVIN'
                 , 'MARTINEZ PAREDES'
                 , 'mkmartinez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JFGARCIA',
                 'JUAN FELIPE'
                 , 'GARCIA RAMIREZ'
                 , 'jfgarcia@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CMBENAVIDES',
                 'CINDY MILLELY'
                 , 'BENAVIDES VARGAS'
                 , 'cmbenavides@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JMGONZALEZC',
                 'JOSE MANUEL'
                 , 'GONZALEZ CASTAÑO'
                 , 'jmgonzalezc@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CPSANCHEZ',
                 'CLAUDIA PATRICIA'
                 , 'SANCHEZ DE DIAZ'
                 , 'cpsanchez@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JMPALOMINO',
                 'JUAN MANUEL'
                 , 'PALOMINO MORENO'
                 , 'jmpalomino@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AFMUNOZ',
                 'ANDRES FELIPE'
                 , 'MUÑOZ CORTES'
                 , 'afmunoz@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'YMASMELA',
                 'YESIKA'
                 , 'MASMELA OROZCO'
                 , 'ymasmela@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JFCHAGUENDO',
                 'JOHNNY FERNANDO'
                 , 'CHAGUENDO MINA'
                 , 'jfchaguendo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JMPANIAGUA',
                 'JOSE MIGUEL'
                 , 'PANIAGUA AYALA'
                 , 'jmpaniagua@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CTORRES',
                 'CATALINA'
                 , 'TORRES GONZALEZ'
                 , 'ctorres@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CMHERNANDEZ',
                 'CLAUDIA MARIA'
                 , 'HERNANDEZ ALVARENGA'
                 , 'cmhernandez@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AVEGA',
                 'ARMANDO'
                 , 'VEGA REY'
                 , 'avega@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LGESCOBAR',
                 'LUIS GABRIEL'
                 , 'ESCOBAR TORRES'
                 , 'lgescobar@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'HJMILLAN',
                 'HAROLD JIMY'
                 , 'MILLAN MOLANO'
                 , 'hmillan@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )


                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LAQUINONES',
                 'LUIS ALEJANDRO'
                 , 'QUIÑONES CASTAÑO'
                 , 'laquinonesc@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'NREYESM',
                 'NICOLAS'
                 , 'REYES MAYOR'
                 , 'nreyesm@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AMZORRILLA',
                 'ANGELA MARIA'
                 , 'ZORRILLA GUTIERREZ'
                 , 'amzorrilla@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CAMELENDEZ',
                 'CRISTHIAN ALBERTO'
                 , 'MELENDEZ CAMACHO'
                 , 'camelendez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MAGALVEZ',
                 'MARVIN ALEXANDER'
                 , 'GALVEZ MARROQUIN'
                 , 'magalvez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AMBARONA',
                 'ANGELA MARIA'
                 , 'BARONA FERNANDEZ'
                 , 'ambarona@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DADORADO',
                 'DIOMAR AURORA'
                 , 'DORADO GOMEZ'
                 , 'dadorado@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'FNHERNANDEZ',
                 'FERNANDO NEFTALI'
                 , 'HERNANDEZ RODRIGUEZ'
                 , 'fnhernandez@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )


                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JCZUNIGA',
                 'JUAN CAMILO'
                 , 'ZUÑIGA AMAYA'
                 , 'jczuniga@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'HOSANTOS',
                 'HECTOR OMAR'
                 , 'SANTOS ZEPEDA'
                 , 'hosantos@tqgrupo.com.gt'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'GRVIVAS',
                 'GILBERT RAFAEL'
                 , 'VIVAS MORENO'
                 , 'grvivas@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )




                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JAVALENCIA',
                 'JOSE ALEXANDER'
                 , 'VALENCIA RAMIREZ'
                 , 'javalencia@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AMAGUDELO',
                 'ANGELICA MARIA'
                 , 'AGUDELO NEBRIJO'
                 , 'amagudelo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JFROBLEDO',
                 'JUAN FRANCISCO'
                 , 'ROBLEDO ARBOLEDA'
                 , 'jfrobledo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )






                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'EGIL',
                 'ERSENEY'
                 , 'GIL RODRIGUEZ'
                 , 'egil@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JDIZU',
                 'JESUS ANDRES'
                 , 'DIZU QUITUMBO'
                 , 'jadizu@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LMERA',
                 'LUIS FERNANDO'
                 , 'MERA ORDOÑEZ'
                 , 'lfmera@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )





                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'GJMORALES',
                 'GERALDINE JUDITH'
                 , 'MORALES DE ALVAREZ'
                 , 'gjmorales@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AQUICENO',
                 'ALEXANDRA'
                 , 'QUICENO OSPINA'
                 , 'aquicenoo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'TQTI.DEMANDA',
                 'TQTI.DEMANDA'
                 , 'TQTI.DEMANDA'
                 , 'jfvalencia@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CYPAREDES',
                 'CAROL YULIANA'
                 , 'PAREDES SERRANO'
                 , 'cyparedes@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )


                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'EVYOUNG',
                 'ERIKA VANESSA'
                 , 'YOUNG VELASCO'
                 , 'evyoung@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'KUCLIMACO',
                 'KEVIN ULISES'
                 , 'CLIMACO MEDRANO'
                 , 'kuclimaco@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'YSARANGO',
                 'YOKI SEBASTIAN'
                 , 'ARANGO SAKAMOTO'
                 , 'ysarango@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )


                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AHCAICEDOG',
                 'ANDRES HERNAN'
                 , 'CAICEDO GONZALEZ'
                 , 'ahcaicedog@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JCZAMBRANO',
                 'JENNY CAROLINA'
                 , 'ZAMBRANO MALAGON'
                 , 'jczambrano@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MDOSTOS',
                 'MARIA DANIELA'
                 , 'OSTOS ARBOLEDA'
                 , 'mdostos@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AAGUDELOV',
                 'ALEJANDRO'
                 , 'AGUDELO VILLOTA'
                 , 'aagudelov@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'VCASTRO',
                 'VALERIA'
                 , 'CASTRO TRUJILLO'
                 , 'vcastro@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CALASSO',
                 'CARLOS ALFONSO'
                 , 'LASSO VILLACI'
                 , 'calasso@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'SGOMEZ',
                 'SEBASTIAN'
                 , 'GOMEZ GRUESO'
                 , 'sgomez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MPHERNANDEZ',
                 'MARIA DEL PILAR'
                 , 'HERNANDEZ MOSQUERA'
                 , 'mphernandez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'HABRAVO',
                 'HEYDER ANDRES'
                 , 'BRAVO'
                 , 'habravo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LCBERMUDEZ',
                 'LAURA CAMILA'
                 , 'BERMUDEZ BARCENAS'
                 , 'lcbermudez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DCHAVARRO',
                 'DIEGO'
                 , 'CHAVARRO SUAZA'
                 , 'dchavarro@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )


                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CARAMIREZG',
                 'CARLOS ALBERTO'
                 , 'RAMIREZ GIRALDO'
                 , 'caramirez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MAARODRIGUEZ',
                 'MARIA ALEJANDRA'
                 , 'RODRIGUEZ'
                 , 'maarodriguez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )


                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JAGURION',
                 'JOSE ABEL'
                 , 'GURION LLANES'
                 , 'jagurion@tqgrupo.com.gt'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'ZAGODINEZ',
                 'ZULMA ALEJANDRA'
                 , 'GODINEZ VILLEDA'
                 , 'zagodinez@tqgrupo.com.gt'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'SVCADENAG',
                 'SANDRA VIOLETA'
                 , 'CADENAS GOMEZ DE MORENO'
                 , 'svcadenas@tqgrupo.com.gt'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'VCAGUINADA',
                 'VANESSA CAROLINA'
                 , 'AGUIÑADA GUZMAN'
                 , 'vcaguinada@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'DMZAMORA',
                 'DIANA MARIA'
                 , 'ZAMORA MONTERO'
                 , 'dmzamora@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )



                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'CAPEREZ',
                 'CARMEN AIDA'
                 , 'PEREZ DE CAÑAS'
                 , 'caperez@grupotecnoquimicas.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'YPENA',
                 'YENIFFER'
                 , 'PEÑA LUCUMI'
                 , 'ypena@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'RAESCOBAR',
                 'RICARDO ALFONSO'
                 , 'ESCOBAR ANDRADE'
                 , 'raescobar@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'RAVARGASG',
                 'RONALD ANDRES'
                 , 'VARGAS GUTIERREZ'
                 , 'ravargasg@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )


                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'YZVALENCIA',
                 'YIRETH ZULEIDY'
                 , 'VALENCIA GALVIS'
                 , 'yzvalencia@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JDROSERO',
                 'JEFFERSON DARIO'
                 , 'ROSERO PAZOS'
                 , 'jdrosero@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JAFERNANDEZS',
                 'JOHANA ANDREA'
                 , 'FERNANDEZ SANCHEZ'
                 , 'jafernandezs@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'MAMANZANO',
                 'MARYA ANDREA'
                 , 'MANZANO VELASQUEZ'
                 , 'mamanzano@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'AVPUERTA',
                 'ANGIE VANESSA'
                 , 'PUERTA PEÑA'
                 , 'avpuerta@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LMCASTILLO',
                 'LUZ MARISOL'
                 , 'CASTILLO HERNANDEZ'
                 , 'lmcastillo@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'JEOROZCO',
                 'JAIME ENRIQUE'
                 , 'OROZCO COLLAZOS'
                 , 'jeorozco@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                INSERT INTO EP_Usuario
                (
                 Id, NombreUsuario, Nombre, Apellido, CorreoElectronico, RolId, JefeDirectoId, CreateTime, UpdateTime, UpdatedBy, CreatedBy
                )
                VALUES
                (
                 NEWID(), 
                 'LPNARVAEZ',
                 'LORENA PATRICIA'
                 , 'NARVAEZ'
                 , 'lpnarvaez@tqgrupo.com'
                 , (SELECT ID FROM EP_Rol WHERE nombre = 'Comprador')
                 , NULL
                 , GETDATE()
                 , GETDATE()
                 , 'SISTEMA'
                 , 'SISTEMA'
                )

                UPDATE EP_Usuario
                SET JefeDirectoId = (SELECT Id FROM EP_USUARIO WHERE NombreUsuario = 'JPCANDELO')
                WHERE NombreUsuario IN ('JSFOLLECO', 'AFLOPEZ', 'JCBARBERI', 'JSRODRIGUEZ', 'SMPINEDA','NCRIVERA', 'AVQUIROGA')

                UPDATE EP_Usuario
                SET JefeDirectoId = (SELECT Id FROM EP_USUARIO WHERE NombreUsuario = 'CPCORONELL')
                WHERE NombreUsuario IN ('JCGARCIAM', 'SSDORADO', 'AMSOLARTE', 'LFMONTEROC', 'IHHOLGUIN',
                            'ALHENAO', 'RAGONZALEZ', 'MVMEJIA', 'JPLAVERDE', 'KLTRUJILLO',
                            'IBUSTAMANTE', 'JAVELANDIA', 'JRESTREPOO', 'SOJEDA', 'CTORRES',
                            'NREYESM', 'DMZAMORA')

                UPDATE EP_Usuario
                SET JefeDirectoId = (SELECT Id FROM EP_USUARIO WHERE NombreUsuario = 'LFGUTIERREZ')
                WHERE NombreUsuario IN ('JACERO', 'VMARINL', 'HJROMERO')
                
                UPDATE EP_Usuario
                SET JefeDirectoId = (SELECT Id FROM EP_USUARIO WHERE NombreUsuario = 'GARODRIGUEZB')
                WHERE NombreUsuario IN ('AMSAAVEDRA', 'AJROJAS', 'VMARIN', 'JFVANEGAS')

                UPDATE EP_Usuario
                SET JefeDirectoId = (SELECT Id FROM EP_USUARIO WHERE NombreUsuario = 'AMSAAVEDRA')
                WHERE NombreUsuario IN ('LPNARVAEZ')
            END;
    END;

--- CAUSALES
IF (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'EP_Causal'))
    BEGIN
        IF ((SELECT COUNT(*) FROM EP_Causal) = 0)
            BEGIN
                INSERT INTO EP_Causal (Id, CodigoCausal, Nombre, Descripcion, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES (NEWID(), 1,'Atraso insumo para fabricacion del Proveedor/Fabricante', 'Cuando hace falta un material/insumo necesario para su produccion', GETDATE(), GETDATE(), 'SISTEMA', 'SISTEMA');
                INSERT INTO EP_Causal (Id, CodigoCausal, Nombre, Descripcion, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES (NEWID(), 2,'Incremento en la demanda (Global)', 'Aplica cuando hay escasez del insumo por alta demanda en el mercado global ', GETDATE(), GETDATE(), 'SISTEMA', 'SISTEMA');
                INSERT INTO EP_Causal (Id, CodigoCausal, Nombre, Descripcion, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES (NEWID(), 3,'Cambios en la organizacion (Proveedor)', 'Cuando el contacto de la organizacion cambia.  Durante la implementacion de nuevos sistemas de operacion en el Proveedor (SAP-ORACLE), ', GETDATE(), GETDATE(), 'SISTEMA', 'SISTEMA');
                INSERT INTO EP_Causal (Id, CodigoCausal, Nombre, Descripcion, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES (NEWID(), 4,'Capacidad de Planta', 'El numero de pedidos colocados al proveedor supera su capacidad de produccion.', GETDATE(), GETDATE(), 'SISTEMA', 'SISTEMA');
                INSERT INTO EP_Causal (Id, CodigoCausal, Nombre, Descripcion, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES (NEWID(), 5,'Produccion por campañas', 'Cuando el sistema de programacion de la produccion del insumo depende de campañas como Peldar, Empaques Flexa. Proplas, Tubopack. Dr Reddys', GETDATE(), GETDATE(), 'SISTEMA', 'SISTEMA');
                INSERT INTO EP_Causal (Id, CodigoCausal, Nombre, Descripcion, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES (NEWID(), 6,'Priorizacion por urgencias', 'Cuando la orden de compra cumple el LT pero se corre en la programacion por priorizar alguna urgencia (Indugraficas)', GETDATE(), GETDATE(), 'SISTEMA', 'SISTEMA');
                INSERT INTO EP_Causal (Id, CodigoCausal, Nombre, Descripcion, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES (NEWID(), 7,'Administracion de la OC (Proveedor)', 'No contesta o no ha sido programada para produccion o para despacho. Cuando no esta pendiente de los despachos solicitados.', GETDATE(), GETDATE(), 'SISTEMA', 'SISTEMA');
                INSERT INTO EP_Causal (Id, CodigoCausal, Nombre, Descripcion, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES (NEWID(), 8,'Factores Climaticos', 'Monzones, Nevadas, Erupciones Volcanicas, Sunamis, huracanes.', GETDATE(), GETDATE(), 'SISTEMA', 'SISTEMA');
                INSERT INTO EP_Causal (Id, CodigoCausal, Nombre, Descripcion, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES (NEWID(), 9,'Factores Socio-politicos', 'Paros, huelgas, guerras, ', GETDATE(), GETDATE(), 'SISTEMA', 'SISTEMA');
                INSERT INTO EP_Causal (Id, CodigoCausal, Nombre, Descripcion, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES (NEWID(), 10,'MP controlada (cupo, permisos)', 'No se han solicitados los registros o no existen cupos', GETDATE(), GETDATE(), 'SISTEMA', 'SISTEMA');
                INSERT INTO EP_Causal (Id, CodigoCausal, Nombre, Descripcion, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES (NEWID(), 11,'Problemas en la fabricacion (proveedor)', 'Rechazos en los procesos internos de fabricacion, Problemas de calidad, daños de maquina. Paros por mantenimiento no informados, ', GETDATE(), GETDATE(), 'SISTEMA', 'SISTEMA');
                INSERT INTO EP_Causal (Id, CodigoCausal, Nombre, Descripcion, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES (NEWID(), 12,'Retraso en el Transito/ Problemas logisticos con el transporte', 'Se asigna para compras importadas y nacionales  y aplica cuando la responsabilidad de coordinacion de recoger material o transportar es del proveedor (Paqueteo- Consolidaciones) Barcos lecheros, demoras en las des consolidaciones ', GETDATE(), GETDATE(), 'SISTEMA', 'SISTEMA');
                INSERT INTO EP_Causal (Id, CodigoCausal, Nombre, Descripcion, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES (NEWID(), 13,'Reposicion rechazos', 'Cuando se realizan reposiciones de un rechazo y la nueva entrega llega tarde por ese motivoy afecta la misma orden de compra', GETDATE(), GETDATE(), 'SISTEMA', 'SISTEMA');
                INSERT INTO EP_Causal (Id, CodigoCausal, Nombre, Descripcion, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES (NEWID(), 15,'Error envio de la OC por Mail', 'Falla el envio de la orden de compra desde el sistema Oracle.', GETDATE(), GETDATE(), 'SISTEMA', 'SISTEMA');
                INSERT INTO EP_Causal (Id, CodigoCausal, Nombre, Descripcion, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES (NEWID(), 16,'Error parametros del articulo', 'Error en el proveedor asignado, lead times desactualizados', GETDATE(), GETDATE(), 'SISTEMA', 'SISTEMA');
                INSERT INTO EP_Causal (Id, CodigoCausal, Nombre, Descripcion, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES (NEWID(), 17,'Problemas nacionalizacion / documentacion', 'Solo se asigna cuando distribuidores nacionales se retrasan en una entrega por demoras en documentos para nacionalizar o permisos para importar.', GETDATE(), GETDATE(), 'SISTEMA', 'SISTEMA');
                INSERT INTO EP_Causal (Id, CodigoCausal, Nombre, Descripcion, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES (NEWID(), 18,'Cambio Arte / Especificacion', 'Cuando se demora la entrega de un arte, cuando las especificaciones no son claras o se solicitan cambios durante el proceso', GETDATE(), GETDATE(), 'SISTEMA', 'SISTEMA');
                INSERT INTO EP_Causal (Id, CodigoCausal, Nombre, Descripcion, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES (NEWID(), 19,'Otros', 'Otros Incumplimientos por Entregas en Fecha', GETDATE(), GETDATE(), 'SISTEMA', 'SISTEMA');
                INSERT INTO EP_Causal (Id, CodigoCausal, Nombre, Descripcion, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES (NEWID(), 20,'Demora Recogida/Coordinacion Despacho', 'Se asigna para compras importadas y nacionales  y aplica cuando la responsabilidad de coordinacion de recoger material o transportar es de Tecnoquimicas (EXW- FOB- FCA)', GETDATE(), GETDATE(), 'SISTEMA', 'SISTEMA');
                INSERT INTO EP_Causal (Id, CodigoCausal, Nombre, Descripcion, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES (NEWID(), 21,'Desarrollo de Material/Insumo nuevo o con cambio', 'Aplica para materiales que se retrasan por problemas que se presentan en la produccion debido a dificultades de artes, preprensas o escalamientos.', GETDATE(), GETDATE(), 'SISTEMA', 'SISTEMA');
                INSERT INTO EP_Causal (Id, CodigoCausal, Nombre, Descripcion, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES (NEWID(), 22,'Proveedor en Desarrollo', 'Aplica para nuevos proveedores donde se estan recibiendo hasta la segunda entrega.', GETDATE(), GETDATE(), 'SISTEMA', 'SISTEMA');
                INSERT INTO EP_Causal (Id, CodigoCausal, Nombre, Descripcion, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES (NEWID(), 23,'Demora de Ingreso al Sistema', 'Cuando el proveedor entrega en la fecha pactada pero el ingreso al sistema Oracle no se realiza en la misma fecha', GETDATE(), GETDATE(), 'SISTEMA', 'SISTEMA');
                INSERT INTO EP_Causal (Id, CodigoCausal, Nombre, Descripcion, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES (NEWID(), 24,'No se modifico fecha', 'Cuando no se modifica la fecha en el sistema oracle', GETDATE(), GETDATE(), 'SISTEMA', 'SISTEMA');
                INSERT INTO EP_Causal (Id, CodigoCausal, Nombre, Descripcion, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES (NEWID(), 25,'Entrega parcial pactada', 'cuando de pacta con el proveedor hacer entregas parciales', GETDATE(), GETDATE(), 'SISTEMA', 'SISTEMA');
                INSERT INTO EP_Causal (Id, CodigoCausal, Nombre, Descripcion, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES (NEWID(), 30,'Problemas en la fabricacion (proveedor)', 'Rechazos en los procesos internos de fabricacion, Problemas de calidad, daños de maquina. Paros por mantenimiento no informados, ', GETDATE(), GETDATE(), 'SISTEMA', 'SISTEMA');
                INSERT INTO EP_Causal (Id, CodigoCausal, Nombre, Descripcion, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES (NEWID(), 31,'Cantidad de pedido errado por el proveedor', 'El proveedor ingresa la cantidad a fabricar por debajo de lo solicitado en la OC.', GETDATE(), GETDATE(), 'SISTEMA', 'SISTEMA');
                INSERT INTO EP_Causal (Id, CodigoCausal, Nombre, Descripcion, CreateTime, UpdateTime, UpdatedBy, CreatedBy) VALUES (NEWID(), 32,'Otros', 'Otros Incumplimientos por Entregas en Cantidad', GETDATE(), GETDATE(), 'SISTEMA', 'SISTEMA');
            END;
    END;
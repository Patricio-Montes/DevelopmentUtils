-- Mediante Code First (Archivo Configuration.cs) no se encuentran populadas las tablas abajo indicadas. 

insert into ws_broker_cia_formas_cobro select * from SegurosOpenMarketDB_Data.dbo.ws_broker_cia_formas_cobro
insert into ws_broker_cia_gnc select * from SegurosOpenMarketDB_Data.dbo.ws_broker_cia_gnc
insert into ws_broker_cia_tipos_condicion_impositiva select * from SegurosOpenMarketDB_Data.dbo.ws_broker_cia_tipos_condicion_impositiva
insert into ws_broker_cia_tipos_cuenta select * from SegurosOpenMarketDB_Data.dbo.ws_broker_cia_tipos_cuenta
insert into ws_broker_cia_formas_cobro select * from SegurosOpenMarketDB_Data.dbo.ws_broker_cia_formas_cobro
insert into ws_broker_cia_tipos_documento select * from SegurosOpenMarketDB_Data.dbo.ws_broker_cia_tipos_documento
insert into ws_broker_cia_usos select * from SegurosOpenMarketDB_Data.dbo.ws_broker_cia_usos
insert into ws_broker_cia_estados_civiles select * from SegurosOpenMarketDB_Data.dbo.ws_broker_cia_estados_civiles
insert into ws_broker_cia_banco select * from SegurosOpenMarketDB_Data.dbo.ws_broker_cia_banco
insert into ws_broker_cia_sexo select * from SegurosOpenMarketDB_Data.dbo.ws_broker_cia_sexo
insert into ws_broker_cia_tarjeta select * from SegurosOpenMarketDB_Data.dbo.ws_broker_cia_tarjeta
insert into ws_broker_cia_provincia select * from SegurosOpenMarketDB_Data.dbo.ws_broker_cia_provincia
insert into ws_broker_cia_familia (CompaniaID, FamiliaID, Cobertura, Activo) select CompaniaID, FamiliaID, Cobertura, Activo from ws_broker_cia_familia
insert into ws_broker_cia_productor select * from SegurosOpenMarketDB_Data.dbo.ws_broker_cia_productor
insert into ws_broker_cia_cobertura_detalle select * from SegurosOpenMarketDB_Data.dbo.ws_broker_cia_cobertura_detalle
insert into ws_broker_cia_patente_et select * from SegurosOpenMarketDB_Data.dbo.ws_broker_cia_patente_et
insert into ws_broker_cia_documento select * from SegurosOpenMarketDB_Data.dbo.ws_broker_cia_documento
insert into ws_broker_cia_tipos_sociedad select * from SegurosOpenMarketDB_Data.dbo.ws_broker_cia_tipos_sociedad
insert into ws_broker_cia_productor_facturacion select * from SegurosOpenMarketDB_Data.dbo.ws_broker_cia_productor_facturacion
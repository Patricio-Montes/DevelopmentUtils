-- Partiendo de una base de datos con esquema regenerado. Es decir, carente de contenido
-- Se detalla la información básica para poder encolar un mensaje desde Soap, y luego 
-- ejecutar el Worker

insert into core_channel select name from [icus006.codeicus,7096].comdb.dbo.core_channel

insert into phone_area_code select code, region, area from [icus006.codeicus,7096].comdb.dbo.phone_area_code

insert into core_request_origin select application from [icus006.codeicus,7096].comdb.dbo.core_request_origin

insert into core_request_status select name from [icus006.codeicus,7096].comdb.dbo.core_request_status

insert into core_event select name, id_origin from [icus006.codeicus,7096].comdb.dbo.core_event

insert into job_status select name from [icus006.codeicus,7096].comdb.dbo.job_status

insert into __MigrationHistory select * from [icus006.codeicus,7096].comdb.dbo.__MigrationHistory
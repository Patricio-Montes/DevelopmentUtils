/*
Script generado por Aqua Data Studio 17.0.0 en ene-29-2020 04:44:39 PM
Base de datos: comdb
Esquema: dbo
Objetos: TABLE
*/

-- Requerimientos: Crear ComDB

CREATE TABLE "dbo"."__MigrationHistory"  ( 
	"MigrationId"   	nvarchar(150) NOT NULL,
	"ContextKey"    	nvarchar(300) NOT NULL,
	"Model"         	varbinary(max) NOT NULL,
	"ProductVersion"	nvarchar(32) NOT NULL,
	CONSTRAINT "PK_dbo.__MigrationHistory" PRIMARY KEY CLUSTERED("MigrationId","ContextKey")
)
GO
CREATE TABLE "dbo"."background_job"  ( 
	"id"        	decimal(18,0) IDENTITY(1,1) NOT NULL,
	"status_id" 	int NOT NULL,
	"name"      	nvarchar(100) NOT NULL,
	"start_time"	datetime NOT NULL,
	"end_time"  	datetime NULL,
	"result"    	nvarchar(100) NULL,
	"processed" 	int NULL,
	"time"      	float NULL,
	"pid"       	int NOT NULL,
	CONSTRAINT "PK_background_job" PRIMARY KEY CLUSTERED("id")
)
GO
CREATE TABLE "dbo"."batch_campaign"  ( 
	"id"          	int IDENTITY(1,1) NOT NULL,
	"code"        	nvarchar(100) NOT NULL,
	"periodicity" 	nvarchar(20) NOT NULL,
	"active"      	bit NOT NULL,
	"datasource"  	nvarchar(200) NOT NULL,
	"ds_params"   	nvarchar(200) NOT NULL,
	"message_data"	nvarchar(200) NOT NULL,
	"timestamp"   	datetime NOT NULL,
	CONSTRAINT "PK_batch_campaign" PRIMARY KEY CLUSTERED("id")
)
GO
CREATE TABLE "dbo"."batch_campaign_execution"  ( 
	"id"               	int IDENTITY(1,1) NOT NULL,
	"id_batch_campaign"	int NOT NULL,
	"start_timestamp"  	datetime NOT NULL,
	"end_timestamp"    	datetime NULL,
	"ds_count"         	int NOT NULL,
	"success_count"    	int NOT NULL,
	"errors_count"     	int NOT NULL,
	CONSTRAINT "PK_batch_campaign_execution" PRIMARY KEY CLUSTERED("id")
)
GO
CREATE TABLE "dbo"."batch_campaign_execution_detail"  ( 
	"id"                         	int IDENTITY(1,1) NOT NULL,
	"id_batch_campaign_execution"	int NOT NULL,
	"timestamp"                  	datetime NOT NULL,
	"message_request_id"         	int NULL,
	"errors"                     	nvarchar(200) NULL,
	CONSTRAINT "PK_batch_campaign_execution_detail" PRIMARY KEY CLUSTERED("id")
)
GO
CREATE TABLE "dbo"."core_channel"  ( 
	"id"  	int IDENTITY(1,1) NOT NULL,
	"name"	nvarchar(100) NOT NULL,
	CONSTRAINT "PK_core_channel" PRIMARY KEY CLUSTERED("id")
)
GO
CREATE TABLE "dbo"."core_event"  ( 
	"id"       	int IDENTITY(1,1) NOT NULL,
	"name"     	nvarchar(100) NOT NULL,
	"id_origin"	int NOT NULL,
	CONSTRAINT "PK_core_event" PRIMARY KEY CLUSTERED("id")
)
GO
CREATE TABLE "dbo"."core_message_attachments"  ( 
	"id"        	int IDENTITY(1,1) NOT NULL,
	"id_request"	int NOT NULL,
	"filename"  	nvarchar(500) NOT NULL,
	CONSTRAINT "PK_core_message_attachments" PRIMARY KEY CLUSTERED("id")
)
GO
CREATE TABLE "dbo"."core_message_content"  ( 
	"id"         	int IDENTITY(1,1) NOT NULL,
	"subject"    	nvarchar(150) NOT NULL,
	"from"       	nvarchar(50) NOT NULL,
	"to"         	nvarchar(100) NOT NULL,
	"from_alias" 	nvarchar(200) NULL,
	"to_alias"   	nvarchar(200) NULL,
	"body_params"	nvarchar(max) NULL,
	CONSTRAINT "PK_core_message_content" PRIMARY KEY CLUSTERED("id")
)
GO
CREATE TABLE "dbo"."core_message_content_body"  ( 
	"message_content_id"	int NOT NULL,
	"message_body"      	nvarchar(max) NOT NULL,
	CONSTRAINT "PK_core_message_content_body" PRIMARY KEY CLUSTERED("message_content_id")
)
GO
CREATE TABLE "dbo"."core_message_content_read"  ( 
	"id"                	int IDENTITY(1,1) NOT NULL,
	"message_content_id"	int NOT NULL,
	"timestamp"         	datetime NOT NULL,
	CONSTRAINT "PK_core_message_content_read" PRIMARY KEY CLUSTERED("id")
)
GO
CREATE TABLE "dbo"."core_message_content_view"  ( 
	"id"                	int IDENTITY(1,1) NOT NULL,
	"message_content_id"	int NOT NULL,
	"timestamp"         	datetime NOT NULL,
	CONSTRAINT "PK_core_message_content_view" PRIMARY KEY CLUSTERED("id")
)
GO
CREATE TABLE "dbo"."core_params"  ( 
	"id"         	int IDENTITY(1,1) NOT NULL,
	"param_key"  	varchar(100) NOT NULL,
	"param_value"	varchar(500) NULL,
	CONSTRAINT "PK_core_params" PRIMARY KEY CLUSTERED("id")
)
GO
CREATE TABLE "dbo"."core_recipient_validation"  ( 
	"id"               	int IDENTITY(1,1) NOT NULL,
	"recipient"        	nvarchar(100) NOT NULL,
	"async"            	bit NOT NULL,
	"code"             	nvarchar(10) NOT NULL,
	"attempts"         	int NOT NULL,
	"updated_timestamp"	datetime NOT NULL,
	"status"           	int NOT NULL,
	"user_email"       	nvarchar(100) NULL,
	"user_cuit"        	nvarchar(50) NULL,
	"id_channel"       	int NOT NULL,
	"created_timestamp"	datetime NOT NULL,
	"id_request"       	int NULL,
	CONSTRAINT "PK_core_recipient_validation" PRIMARY KEY CLUSTERED("id")
)
GO
CREATE TABLE "dbo"."core_request"  ( 
	"id"                	int IDENTITY(1,1) NOT NULL,
	"message_id"        	nvarchar(100) NULL,
	"message_content_id"	int NOT NULL,
	"request_status_id" 	int NOT NULL,
	"origin_id"         	int NOT NULL,
	"proxy"             	bit NOT NULL,
	"mode"              	bit NOT NULL,
	"attempt"           	int NOT NULL,
	"redirect"          	bit NOT NULL CONSTRAINT "DF_core_request_redirect"  DEFAULT ((0)),
	"redirect_url"      	nvarchar(500) NULL,
	"event_id"          	int NULL,
	"channel_id"        	int NULL,
	"message_short_id"  	nchar(10) NULL,
	"fecha"             	datetime NOT NULL CONSTRAINT "DF_core_request_fecha"  DEFAULT ('1900-01-01 00:00:00.000'),
	"core_template_id"  	int NULL,
	"template_version"  	int NOT NULL CONSTRAINT "DF__core_requ__templ__1A9EF37A"  DEFAULT ((0)),
	CONSTRAINT "PK_core_request" PRIMARY KEY CLUSTERED("id")
)
GO
CREATE TABLE "dbo"."core_request_external_result"  ( 
	"id"        	int IDENTITY(1,1) NOT NULL,
	"request_id"	int NOT NULL,
	"carrier"   	nvarchar(100) NOT NULL,
	"sender"    	nvarchar(100) NOT NULL,
	"response"  	nvarchar(500) NOT NULL,
	"timestamp" 	datetime NOT NULL,
	CONSTRAINT "PK_core_request_external_result" PRIMARY KEY CLUSTERED("id")
)
GO
CREATE TABLE "dbo"."core_request_origin"  ( 
	"id"         	int IDENTITY(1,1) NOT NULL,
	"application"	nvarchar(150) NOT NULL,
	CONSTRAINT "PK_core_request_origin" PRIMARY KEY CLUSTERED("id")
)
GO
CREATE TABLE "dbo"."core_request_status"  ( 
	"id"  	int IDENTITY(1,1) NOT NULL,
	"name"	nvarchar(50) NOT NULL,
	CONSTRAINT "PK_core_request_status" PRIMARY KEY CLUSTERED("id")
)
GO
CREATE TABLE "dbo"."core_template"  ( 
	"id"             	int IDENTITY(1,1) NOT NULL,
	"name"           	nvarchar(100) NOT NULL,
	"id_event"       	int NOT NULL,
	"id_channel"     	int NOT NULL,
	"required_params"	nvarchar(500) NOT NULL CONSTRAINT "DF_core_template_required_params"  DEFAULT (''),
	"body"           	nvarchar(max) NULL,
	"version"        	int NOT NULL CONSTRAINT "DF__core_temp__versi__18B6AB08"  DEFAULT ((0)),
	"base_template"  	nvarchar(100) NULL,
	"base_version"   	int NOT NULL CONSTRAINT "DF__core_temp__base___1B9317B3"  DEFAULT ((0)),
	CONSTRAINT "PK_core_template" PRIMARY KEY CLUSTERED("id")
)
GO
CREATE TABLE "dbo"."core_trace_log"  ( 
	"id"        	int IDENTITY(1,1) NOT NULL,
	"message_id"	nvarchar(100) NULL,
	"status"    	nvarchar(50) NOT NULL,
	"origin"    	nvarchar(150) NOT NULL,
	"timestamp" 	datetime NOT NULL,
	"ref_id"    	bigint NOT NULL,
	"event"     	nvarchar(100) NULL,
	"channel"   	nvarchar(100) NULL,
	CONSTRAINT "PK_core_trace_log" PRIMARY KEY CLUSTERED("id")
)
GO
CREATE TABLE "dbo"."core_trace_log_attachment_download"  ( 
	"id"             	int IDENTITY(1,1) NOT NULL,
	"message_id"     	nvarchar(100) NULL,
	"filename"       	nvarchar(150) NOT NULL,
	"timestamp"      	datetime NOT NULL,
	"core_request_id"	int NOT NULL CONSTRAINT "DF__core_trac__core___1C873BEC"  DEFAULT ((0)),
	CONSTRAINT "PK_dbo.core_trace_log_attachment_download" PRIMARY KEY CLUSTERED("id")
)
GO
CREATE TABLE "dbo"."core_trace_log_attachment_download1"  ( 
	"id"        	int IDENTITY(1,1) NOT NULL,
	"message_id"	nvarchar(100) NULL,
	"filename"  	nvarchar(150) NOT NULL,
	"timestamp" 	datetime NOT NULL,
	CONSTRAINT "PK_dbo.core_trace_log_attachment_download1" PRIMARY KEY CLUSTERED("id")
)
GO
CREATE TABLE "dbo"."data_form"  ( 
	"id"    	int IDENTITY(1,1) NOT NULL,
	"name"  	nvarchar(100) NOT NULL,
	"params"	nvarchar(max) NOT NULL,
	CONSTRAINT "PK_data_form" PRIMARY KEY CLUSTERED("id")
)
GO
CREATE TABLE "dbo"."data_form_callout_motivos_consulta_mtu"  ( 
	"id"         	int IDENTITY(1,1) NOT NULL,
	"descripcion"	nvarchar(max) NOT NULL,
	CONSTRAINT "PK_data_form_callout_motivos_consulta" PRIMARY KEY CLUSTERED("id")
)
GO
CREATE TABLE "dbo"."external_api_sms_responses"  ( 
	"code"       	int NOT NULL,
	"description"	nvarchar(250) NOT NULL 
	)
GO
CREATE TABLE "dbo"."job_status"  ( 
	"id"  	int IDENTITY(1,1) NOT NULL,
	"name"	nvarchar(100) NOT NULL,
	CONSTRAINT "PK_job_status" PRIMARY KEY CLUSTERED("id")
)
GO
CREATE TABLE "dbo"."phone_area_code"  ( 
	"id"    	int IDENTITY(1,1) NOT NULL,
	"code"  	int NOT NULL,
	"region"	nvarchar(50) NOT NULL,
	"area"  	nvarchar(max) NOT NULL,
	CONSTRAINT "PK_phone_area_code" PRIMARY KEY CLUSTERED("id")
)
GO
CREATE TABLE "dbo"."phone_user_response"  ( 
	"id"       	int IDENTITY(1,1) NOT NULL,
	"from"     	nvarchar(100) NOT NULL,
	"messge"   	nvarchar(500) NOT NULL,
	"timestamp"	datetime NOT NULL,
	"custom_id"	nvarchar(50) NULL,
	CONSTRAINT "PK_phone_user_response" PRIMARY KEY CLUSTERED("id")
)
GO
CREATE TABLE "dbo"."smtp_domain"  ( 
	"id"  	int IDENTITY(1,1) NOT NULL,
	"name"	nvarchar(100) NOT NULL,
	CONSTRAINT "PK_smtp_domain" PRIMARY KEY CLUSTERED("id")
)
GO
CREATE TABLE "dbo"."smtp_mailbox"  ( 
	"id"       	int IDENTITY(1,1) NOT NULL,
	"name"     	nchar(80) NOT NULL,
	"domain_id"	int NOT NULL,
	CONSTRAINT "PK_smtp_mailbox" PRIMARY KEY CLUSTERED("id")
)
GO
CREATE TABLE "dbo"."smtp_result"  ( 
	"id"         	int IDENTITY(1,1) NOT NULL,
	"server_id"  	int NOT NULL,
	"mailbox_id" 	int NOT NULL,
	"valid"      	bit NOT NULL,
	"code"       	int NOT NULL,
	"description"	nvarchar(250) NULL,
	"detail"     	nvarchar(500) NULL,
	"timestamp"  	datetime2 NOT NULL,
	CONSTRAINT "PK_smtp_result" PRIMARY KEY CLUSTERED("id")
)
GO
CREATE TABLE "dbo"."smtp_result_cache"  ( 
	"id"         	int IDENTITY(1,1) NOT NULL,
	"domain"     	nvarchar(100) NOT NULL,
	"mailbox"    	nchar(80) NOT NULL,
	"valid"      	bit NOT NULL,
	"catchall"   	bit NOT NULL,
	"code"       	int NOT NULL,
	"description"	nvarchar(250) NULL,
	"detail"     	nvarchar(500) NULL,
	"timestamp"  	datetime2 NOT NULL,
	CONSTRAINT "PK_smtp_result_cache" PRIMARY KEY CLUSTERED("id")
)
GO
CREATE TABLE "dbo"."smtp_server"  ( 
	"id"        	int IDENTITY(1,1) NOT NULL,
	"domain_id" 	int NOT NULL,
	"preference"	int NOT NULL,
	"endpoint"  	nvarchar(150) NOT NULL,
	"timestamp" 	datetime2 NOT NULL,
	"catchall"  	bit NOT NULL,
	CONSTRAINT "PK_smtp_mx_result" PRIMARY KEY CLUSTERED("id")
)
GO
CREATE TABLE "dbo"."smtp_server_cache"  ( 
	"id"        	int IDENTITY(1,1) NOT NULL,
	"domain"    	nvarchar(100) NOT NULL,
	"preference"	int NOT NULL,
	"endpoint"  	nvarchar(150) NOT NULL,
	"timestamp" 	datetime2 NOT NULL,
	"catchall"  	bit NOT NULL,
	CONSTRAINT "PK_smtp_server_cache" PRIMARY KEY CLUSTERED("id")
)
GO
CREATE TABLE "dbo"."smtp_whitelist"  ( 
	"item"   	varchar(250) NOT NULL,
	"enabled"	bit NOT NULL 
	)
GO
CREATE TABLE "dbo"."sysdiagrams"  ( 
	"name"        	sysname NOT NULL,
	"principal_id"	int NOT NULL,
	"diagram_id"  	int IDENTITY(1,1) NOT NULL,
	"version"     	int NULL,
	"definition"  	varbinary(max) NULL,
	CONSTRAINT "PK__sysdiagr__C2B05B61117F9D94" PRIMARY KEY CLUSTERED("diagram_id")
	WITH FILLFACTOR = 90
	)
GO

CREATE UNIQUE NONCLUSTERED INDEX "IX_core_message_content_body"
	ON "dbo"."core_message_content_body"("message_content_id")
GO
CREATE NONCLUSTERED INDEX "IX_message_content_id"
	ON "dbo"."core_message_content_view"("message_content_id")
GO
CREATE NONCLUSTERED INDEX "IX_core_template_id"
	ON "dbo"."core_request"("core_template_id")
GO
CREATE NONCLUSTERED INDEX "i1_mtu"
	ON "dbo"."core_trace_log"("status")
	INCLUDE ("ref_id")
GO
ALTER TABLE "dbo"."external_api_sms_responses"
	ADD CONSTRAINT "IX_external_api_sms_responses"
	UNIQUE ("code")
GO
ALTER TABLE "dbo"."sysdiagrams"
	ADD CONSTRAINT "UK_principal_name"
	UNIQUE ("principal_id", "name")
	WITH FILLFACTOR = 90
	
GO
ALTER TABLE "dbo"."background_job"
	ADD CONSTRAINT "FK_background_job_job_status"
	FOREIGN KEY("status_id")
	REFERENCES "dbo"."job_status"("id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "dbo"."batch_campaign_execution"
	ADD CONSTRAINT "FK_batch_campaign_execution_batch_campaign"
	FOREIGN KEY("id_batch_campaign")
	REFERENCES "dbo"."batch_campaign"("id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "dbo"."batch_campaign_execution_detail"
	ADD CONSTRAINT "FK_batch_campaign_execution_detail_batch_campaign_execution"
	FOREIGN KEY("id_batch_campaign_execution")
	REFERENCES "dbo"."batch_campaign_execution"("id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "dbo"."core_event"
	ADD CONSTRAINT "FK_core_event_core_request_origin"
	FOREIGN KEY("id_origin")
	REFERENCES "dbo"."core_request_origin"("id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "dbo"."core_message_attachments"
	ADD CONSTRAINT "FK_core_message_attachments_core_request"
	FOREIGN KEY("id_request")
	REFERENCES "dbo"."core_request"("id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "dbo"."core_message_content_body"
	ADD CONSTRAINT "FK_core_message_content_body_core_message_content"
	FOREIGN KEY("message_content_id")
	REFERENCES "dbo"."core_message_content"("id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "dbo"."core_message_content_read"
	ADD CONSTRAINT "FK_core_message_content_read_core_message_content"
	FOREIGN KEY("message_content_id")
	REFERENCES "dbo"."core_message_content"("id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "dbo"."core_message_content_view"
	ADD CONSTRAINT "FK_core_message_content_view_core_message_content"
	FOREIGN KEY("message_content_id")
	REFERENCES "dbo"."core_message_content"("id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "dbo"."core_recipient_validation"
	ADD CONSTRAINT "FK_core_recipient_validation_core_request"
	FOREIGN KEY("id_request")
	REFERENCES "dbo"."core_request"("id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "dbo"."core_recipient_validation"
	ADD CONSTRAINT "FK_core_recipient_validation_core_channel"
	FOREIGN KEY("id_channel")
	REFERENCES "dbo"."core_channel"("id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "dbo"."core_request"
	ADD CONSTRAINT "FK_dbo.core_request_dbo.core_template_core_template_id"
	FOREIGN KEY("core_template_id")
	REFERENCES "dbo"."core_template"("id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "dbo"."core_request"
	ADD CONSTRAINT "FK_core_request_core_request_status"
	FOREIGN KEY("request_status_id")
	REFERENCES "dbo"."core_request_status"("id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "dbo"."core_request"
	ADD CONSTRAINT "FK_core_request_core_request_origin"
	FOREIGN KEY("origin_id")
	REFERENCES "dbo"."core_request_origin"("id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "dbo"."core_request"
	ADD CONSTRAINT "FK_core_request_core_message_content"
	FOREIGN KEY("message_content_id")
	REFERENCES "dbo"."core_message_content"("id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "dbo"."core_request"
	ADD CONSTRAINT "FK_core_request_core_event"
	FOREIGN KEY("event_id")
	REFERENCES "dbo"."core_event"("id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "dbo"."core_request"
	ADD CONSTRAINT "FK_core_request_core_channel"
	FOREIGN KEY("channel_id")
	REFERENCES "dbo"."core_channel"("id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "dbo"."core_request_external_result"
	ADD CONSTRAINT "FK_core_request_external_result_core_request"
	FOREIGN KEY("request_id")
	REFERENCES "dbo"."core_request"("id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "dbo"."core_template"
	ADD CONSTRAINT "FK_core_template_core_event"
	FOREIGN KEY("id_event")
	REFERENCES "dbo"."core_event"("id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "dbo"."core_template"
	ADD CONSTRAINT "FK_core_template_core_channel"
	FOREIGN KEY("id_channel")
	REFERENCES "dbo"."core_channel"("id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "dbo"."smtp_mailbox"
	ADD CONSTRAINT "FK_smtp_mailbox_smtp_domain"
	FOREIGN KEY("domain_id")
	REFERENCES "dbo"."smtp_domain"("id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "dbo"."smtp_result"
	ADD CONSTRAINT "FK_smtp_result_smtp_server"
	FOREIGN KEY("server_id")
	REFERENCES "dbo"."smtp_server"("id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "dbo"."smtp_result"
	ADD CONSTRAINT "FK_smtp_result_smtp_mailbox"
	FOREIGN KEY("mailbox_id")
	REFERENCES "dbo"."smtp_mailbox"("id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO
ALTER TABLE "dbo"."smtp_server"
	ADD CONSTRAINT "FK_smtp_mx_result_smtp_domain"
	FOREIGN KEY("domain_id")
	REFERENCES "dbo"."smtp_domain"("id")
	ON DELETE NO ACTION 
	ON UPDATE NO ACTION 
GO

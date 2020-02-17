-- Al querer modelar una entidad a partir de una tabla, la query retorna la construcción tentativa de 
-- como quedarian las propiedades de la entidad en Java. 
-- OBS!: Esta pensado para un esquema con notación camelCase (En DB). Y se desarrollaron 2 querys para 2 tipos de conversiones. 

--Conversión A) db_column = AnyColumnName => any_column_name

------------------------ Query Conversion A ----------------------------

declare @entityBuild varchar(max) = ''
declare @tableName varchar(100) = 'TableName'

select @entityBuild +=
			case when sc.is_identity = 1 and sc.is_nullable = 0 
				 then '@Id'
				 else ''
			end + CHAR(13) + CHAR(10) +
		   '@Column(name = "' + sc.name + '")' + CHAR(13) + CHAR(10) +
		   'private ' + case st.name when 'int' then 'long' 
								 when 'datetime' then 'Calendar' 
								 when 'varbinary' then 'byte[]' 
								 else 'String' 
						end + ' ' + 
			 case when PATINDEX('%[A-Z]%' COLLATE Latin1_General_Bin, RIGHT(sc.name, LEN(sc.name) - 1)) + 1 > 2 
				  then LOWER(Stuff(sc.name, PATINDEX('%[A-Z]%' COLLATE Latin1_General_Bin, RIGHT(sc.name, LEN(sc.name) - 1)) + 1, 0, '_'))
				  else
				  LOWER(sc.name)
			 end + ';' + CHAR(13) + CHAR(10)
	from sys.columns sc
	inner join sys.types st
	on sc.system_type_id = st.system_type_id
	and st.user_type_id <> 256
	where sc.object_id = 
	(select top 1 so.object_id 
	from sys.objects so 
	where so.name = @tableName and type_desc = 'USER_TABLE')
	order by sc.column_id

print(@entityBuild);


--Conversión B) db_column = AnyColumnName => anyColumnName

------------------------ Query Conversion B ----------------------------

/******** Tipo de conversión: db_column = AnyColumnName => Java Property = anyColumnName ********/
-- Seguir adelante los puntos 1 y 2. 

declare @entityBuild nvarchar(max) = ''
-- 1) Reemplazar por nombre de tabla correspondiente.
declare @tableName varchar(100) = 'TableName'

-- 2) 
    -- ****** Ejecución en Aqua Data Studio: ******
    -- Descomentar linea 11. F5 
     select
    -- ****** Ejecución en Managment Studio SQL: ******
    -- Descomentar linea 14 y 36. F5
    -- select @entityBuild += 
			case when sc.is_identity = 1 and sc.is_nullable = 0 
				 then '@Id'
				 else ''
			end + CHAR(13) + CHAR(10) +
		   '@Column(name = "' + sc.name + '")' + CHAR(13) + CHAR(10) +
		   'private ' + case st.name when 'int' then 'long' 
								 when 'datetime' then 'Calendar' 
								 when 'varbinary' then 'byte[]' 
								 else 'String' 
						end + ' ' + 
			 LOWER(LEFT(sc.name,1))+ SUBSTRING(sc.name,2,LEN(sc.name)) + ';' + CHAR(13) + CHAR(10) EntityProperties
	from sys.columns sc
	inner join sys.types st
	on sc.system_type_id = st.system_type_id
	and st.user_type_id <> 256
	where sc.object_id = 
	(select top 1 so.object_id 
	from sys.objects so 
	where so.name = @tableName and type_desc = 'USER_TABLE')
	order by sc.column_id

-- print(@entityBuild);
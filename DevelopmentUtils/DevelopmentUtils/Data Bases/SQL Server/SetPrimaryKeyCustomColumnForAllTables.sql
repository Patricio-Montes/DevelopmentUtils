-- falta añadir el comentario de la condición where para que la query cumpla totalmente.

DECLARE @PKScript AS VARCHAR(max) = '';
DECLARE @columnPK varchar(100) = 'id'

SELECT @PKScript += 
     ' ALTER TABLE ' + QUOTENAME(SCHEMA_NAME(obj.SCHEMA_ID))+'.'+QUOTENAME(obj.name) + 
                     ' ADD CONSTRAINT PK_ID_' + obj.name+ ' PRIMARY KEY NONCLUSTERED (' + @columnPK + ') '
 FROM sys.objects obj
 WHERE object_id not in
     (select parent_object_id
      from sys.key_constraints 
      where type = 'PK'
      UNION
      Select object_id
      from sys.identity_columns
      )
      AND type = 'U' 
	  --Aca puede verificarse tambien que el objeto tenga una columna de tipo @columnPK
PRINT (@PKScript);
--EXEC(@PKScript);
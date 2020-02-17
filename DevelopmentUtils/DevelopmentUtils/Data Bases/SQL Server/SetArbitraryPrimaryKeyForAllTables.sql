DECLARE @PKScript AS VARCHAR(max) = '';
SELECT @PKScript += 
    '  ALTER TABLE ' + QUOTENAME(SCHEMA_NAME(obj.SCHEMA_ID))+'.'+ QUOTENAME(obj.name) + 
                      ' ADD PK_ID BIGINT IDENTITY;' +
     ' ALTER TABLE ' + QUOTENAME(SCHEMA_NAME(obj.SCHEMA_ID))+'.'+QUOTENAME(obj.name) + 
                     ' ADD CONSTRAINT PK_ID_' + obj.name+ ' PRIMARY KEY NONCLUSTERED (PK_ID) '
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
PRINT (@PKScript);
--EXEC(@PKScript);
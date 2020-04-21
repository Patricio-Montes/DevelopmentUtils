select * from [ServerName/ServerIP].DBName.dbo.TableName

update [ServerName/ServerIP].DBName.dbo.TableName set Image_Column = (SELECT BulkColumn 
FROM Openrowset( Bulk 'C:\cbimage.jpg', Single_Blob) as image)
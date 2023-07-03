declare @databasename as nvarchar(max) ='WideWorldImportersDW'
declare @filepath as nvarchar(max) = 'C:\SQL\BACKUP\WideWorldImporters\'
declare @filename as nvarchar(max) = 'WideWorldImportersDW_Backup'
declare @filenamedate as nvarchar(max) = cast(cast(GETDATE () as date) as nvarchar)
declare @filetype as char(4) = '.bak'
declare @sql as nvarchar(max) =
	
	(
		'
		BACKUP DATABASE '+@databasename+
		' TO DISK='''+@filepath+@filename+@filenamedate+'_1'+@filetype+''','
		+' DISK='''++@filepath+@filename+@filenamedate+'_2'+@filetype+''','
		+' DISK='''++@filepath+@filename+@filenamedate+'_3'+@filetype+''','
		+' DISK='''++@filepath+@filename+@filenamedate+'_4'+@filetype+''','
		+' DISK='''++@filepath+@filename+@filenamedate+'_5'+@filetype+''''
		+' WITH COMPRESSION
		,STATS = 5
		'
	)
EXEC sp_executesql @sql
Print @sql
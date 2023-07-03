----------------------------------------------------------------------------------
--Name: Restore New Database
--Purpose: Restore new database 
----------------------------------------------------------------------------------

/*Declare the database name and the file path */
Declare @databasename nvarchar(256) = '<databasename>'
Declare @filepath nvarchar(500) = '<filepath>' 

/*Find the file names */
RESTORE FILELISTONLY    
FROM disk = @filepath


RESTORE DATABASE @databasename
FROM DISK = @filepath
/* with updates every 5% completed */
WITH STATS = 5,
/* Add file moves  below */  
MOVE 'WWI_Primary' TO 'C:\SQL\DATA\WideWorldImportersDW.mdf',
MOVE 'WWI_UserData' TO 'C:\SQL\DATA\WideWorldImportersDW_UserData.ndf',
MOVE 'WWI_Log' TO 'C:\SQL\Logs\WideWorldImportersDW_InMemory_Data_1',
MOVE 'WWIDW_InMemory_Data_1' TO 'C:\SQL\DATA\WideWorldImportersDW';


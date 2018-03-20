USE [master]
GO

-- Checking if db exists
 IF EXISTS(SELECT name FROM sys.databases
    WHERE name = 'n_kozoriz_library_view')
    DROP DATABASE n_kozoriz_library_view
 GO
 -- Creating db
 CREATE DATABASE n_kozoriz_library_view
 GO


 --create new file group
USE [master]
GO
ALTER DATABASE [n_kozoriz_library_view] ADD FILEGROUP [Data]
GO

--create new data file 
USE [master]
GO
ALTER DATABASE [n_kozoriz_library_view] 
ADD FILE ( NAME = N'n_kozoriz_library_view_data', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\n_kozoriz_library_view.mdf' , SIZE = 5120KB , FILEGROWTH = 1024KB ) TO FILEGROUP [Data]
GO

--set default file group
USE [n_kozoriz_library_view]
GO
IF NOT EXISTS (SELECT name FROM sys.filegroups WHERE is_default=1 AND name = N'Data') 
	ALTER DATABASE [n_kozoriz_library_view] MODIFY FILEGROUP [Data] DEFAULT
GO




-- CREATING SCHEMA
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'libra')
BEGIN
  
    EXEC( 'CREATE SCHEMA libra' );
END




/****************************************************************************
************************   CHECKING SCRIPT   ************************
*****************************************************************************
****************************************************************************/

IF db_id('n_kozoriz_library_view') is not null
   PRINT 'db exists'
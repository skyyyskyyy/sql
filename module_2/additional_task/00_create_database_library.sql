USE [master]
GO

-- Checking if db exists
 IF EXISTS(SELECT name FROM sys.databases
    WHERE name = 'n_kozoriz_library')
    DROP DATABASE n_kozoriz_library
 GO
 -- Creating db
 CREATE DATABASE n_kozoriz_library
 GO


 --create new file group
USE [master]
GO
ALTER DATABASE [n_kozoriz_library] ADD FILEGROUP [Data]
GO

--create new data file 
USE [master]
GO
ALTER DATABASE [n_kozoriz_library] 
ADD FILE ( NAME = N'n_kozoriz_library_data', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\n_kozoriz_library.mdf' , SIZE = 5120KB , FILEGROWTH = 1024KB ) TO FILEGROUP [Data]
GO

--set default file group
USE [n_kozoriz_library]
GO
IF NOT EXISTS (SELECT name FROM sys.filegroups WHERE is_default=1 AND name = N'Data') 
	ALTER DATABASE [n_kozoriz_library] MODIFY FILEGROUP [Data] DEFAULT
GO






/****************************************************************************
************************   CHECKING SCRIPT   ************************
*****************************************************************************
****************************************************************************/

IF db_id('n_kozoriz_library') is not null
   PRINT 'db exists'
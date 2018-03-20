USE [master]
GO

-- Checking if db exists
 IF EXISTS(SELECT name FROM sys.databases
    WHERE name = 'n_kozoriz_module_2')
    DROP DATABASE n_kozoriz_module_2
 GO
 -- Creating db
 CREATE DATABASE n_kozoriz_module_2
 GO

/****************************************************************************
************************   CHECKING SCRIPT   ************************
*****************************************************************************
****************************************************************************/

IF db_id('n_kozoriz_module_2') is not null
   PRINT 'db exists'
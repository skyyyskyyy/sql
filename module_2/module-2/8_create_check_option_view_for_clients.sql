USE n_kozoriz_module_2
GO


--Dropping view if it exists
IF EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[creation].[clients_check_option]'))
DROP VIEW [creation].[clients_check_option]
GO


-- View creation
CREATE VIEW creation.clients_check_option
AS
SELECT  [Surname]
       ,[Name]
       ,[Phone]
       ,[Street]
	   ,[City]
  FROM [creation].[clients]
  WHERE Birth_date > '19700826'
  WITH CHECK OPTION
GO



/****************************************************************************
************************   CHECKING SCRIPT   ************************
*****************************************************************************
****************************************************************************/

SELECT * FROM creation.clients_check_option
GO


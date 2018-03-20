USE n_kozoriz_module_2
GO

--Dropping view if it exists
IF EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[creation].[shortInform]'))
DROP VIEW [creation].[shortInform]
GO

-- View Creation
CREATE VIEW creation.shortInform
AS
SELECT  [Surname]
       ,[Name]
       ,[Phone]
       ,[Birth_date]
  FROM [creation].[clients]
GO

/****************************************************************************
************************   CHECKING SCRIPT   ************************
*****************************************************************************
****************************************************************************/

SELECT * FROM creation.shortInform
GO


USE n_kozoriz_module_2
GO

--Dropping view if it exists
IF EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[creation].[shortOrders]'))
DROP VIEW [creation].[shortOrders]
GO


-- view creation
CREATE VIEW creation.shortOrders
AS
SELECT  [Order_number]
       ,[Price_per_one]
       ,[Inserted_date]
       ,[Sum]
  FROM [creation].[orders]
GO

/****************************************************************************
************************   CHECKING SCRIPT   ************************
*****************************************************************************
****************************************************************************/


SELECT * FROM creation.shortOrders
go


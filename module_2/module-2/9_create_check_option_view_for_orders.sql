USE n_kozoriz_module_2
GO


--Dropping view if it exists
IF EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[creation].[orders_check_option]'))
DROP VIEW [creation].[orders_check_option]
GO



-- view creation
CREATE VIEW creation.orders_check_option
AS
SELECT  [Order_Number]
       ,[Quantity]
       ,[Price_per_one]
       ,[Sum]
  FROM [creation].[orders]
  WHERE Quantity > 10
  WITH CHECK OPTION
GO


/****************************************************************************
************************   CHECKING SCRIPT   ************************
*****************************************************************************
****************************************************************************/

SELECT * FROM creation.orders_check_option
GO

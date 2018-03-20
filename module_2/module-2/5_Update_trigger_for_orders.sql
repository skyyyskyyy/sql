USE n_kozoriz_module_2
GO

-- Dropping trigger if it exists
IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[Creation].[triggerUpdateOrdersTable]'))
DROP TRIGGER [creation].[triggerUpdateOrdersTable]
GO


-- Creatting trigger that updates date in Upadated_date column when we update row
create trigger triggerUpdateOrdersTable 
ON creation.orders 
for UPDATE
AS
Begin
	IF @@ROWCOUNT = 0
		RETURN
	SET NOCOUNT ON;

    UPDATE [creation].[orders] 
	SET  [Updated_date] = GETDATE() 
    FROM Inserted i
    WHERE i.ordersID = orders.ordersID
END
GO

-- Updating price
UPDATE [creation].[orders]
SET price_per_one = '100'
Where ordersID = 10
GO


/****************************************************************************
************************   CHECKING SCRIPT   ************************
*****************************************************************************
****************************************************************************/

SELECT [ordersID]
      ,[Order_number]
      ,[Date_created]
      ,[Client_id]
      ,[Item_id]
      ,[Quantity]
      ,[Price_per_one]
      ,[Shipped]
      ,[Inserted_date]
      ,[Sum]
      ,[Updated_date]
  FROM [n_kozoriz_module_2].[creation].[orders]
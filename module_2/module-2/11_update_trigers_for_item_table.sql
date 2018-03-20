USE n_kozoriz_module_2
GO


-- Dropping trigger if it exists
IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[Creation].[triggerUpdateItemsTable]'))
DROP TRIGGER [creation].[triggerUpdateItemsTable]
GO

--Creating trigger which updates date in Updated date column and adds Quantity_On_Stock items to existing in table
create trigger triggerUpdateItemsTable 
ON creation.items
for UPDATE
AS
Begin
	IF @@ROWCOUNT = 0
		RETURN
	SET NOCOUNT ON;

    UPDATE [creation].[items] 
	SET [Updated_date] = GETDATE(), Quantity_on_Stock = items.Quantity_on_Stock + i.Quantity_on_Stock
    FROM Inserted i
    WHERE i.itemsID = items.itemsID
END
GO




UPDATE [creation].[items]
SET Name = 'Banana', Quantity_on_stock = '100'
Where itemsID = 1
GO

/****************************************************************************
************************   CHECKING SCRIPT   ************************
*****************************************************************************
****************************************************************************/

-- Here we would see that date has updated and we added some items quantity to existing ones
SELECT [itemsID]
      ,[Name]
      ,[Category]
      ,[Type]
      ,[Class]
      ,[Date_of_Starting_Sell]
      ,[No_partion]
      ,[Dimention]
      ,[Value]
      ,[Quantity_on_Stock]
      ,[Inserted_date]
      ,[Updated_date]
      ,[Available]
      ,[Purchase_price]
      ,[Quality]
  FROM [creation].[items]





USE n_kozoriz_module_2
GO

-- Dropping trigger if it exists
IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[Creation].[triggerAllowDeleteItems]'))
DROP TRIGGER [creation].[triggerAllowDeleteItems]
GO


CREATE TRIGGER triggerAllowDeleteItems 
ON creation.items
FOR DELETE 
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @CheckQuantity AS INT;
	SELECT @CheckQuantity = Quantity_on_Stock FROM deleted
	IF  @CheckQuantity > 1 
    BEGIN
		Print @CheckQuantity
		RAISERROR ('Deleting records with quantity > 1 not allowed', 16, 1)
		ROLLBACK 
	END

END
GO


--This will delete row
DELETE FROM creation.items  
WHERE itemsID = 3;  
GO  
--This won't delete row because Quantity_on_Stock > 1
DELETE FROM creation.items  
WHERE itemsID = 2;  
GO  


/****************************************************************************
************************   CHECKING SCRIPT   ********************************
*****************************************************************************
****************************************************************************/

-- Here we can see that we cannot delete now row where quantity_on_stock is > 1 and we
-- will get error and transaction will rollback

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

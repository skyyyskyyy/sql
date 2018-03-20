USE n_kozoriz_module_2
GO


-- Dropping trigger if it exists
IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[Creation].[triggerInsertItemsTable]'))
DROP TRIGGER [creation].[triggerInsertItemsTable]
GO

-- Creating trigger: When we insert values into a table, it takes purchase_price value from new data  and depends on it 
-- puts cheap or expensive values to quality colunm
CREATE TRIGGER triggerInsertItemsTable 
ON creation.items
FOR INSERT
AS
Begin
	IF @@ROWCOUNT = 0
		RETURN
	SET NOCOUNT ON

	DECLARE @value INT
	SELECT @value = Purchase_price FROM inserted 
   

	if @value < '10'
		UPDATE [creation].[items] 
		Set items.quality = 'cheap'
		 FROM Inserted i
		 WHERE i.itemsID = items.itemsID
	else
		UPDATE [creation].[items] 
		SET items.quality = 'expensive'
		 FROM Inserted i
		 WHERE i.itemsID = items.itemsID

END
GO

INSERT INTO [creation].[items]([Name],[Category],[Type],[Class],[Date_of_Starting_Sell],[No_partion],[Dimention],[Value],[Quantity_on_Stock],[Inserted_date],[Updated_date],[Available],[Purchase_price]) 
VALUES('Pineapples','Fruits','Food','Perishable','2016-09-01','1630092445599','Small','6','153',GETDATE(),NULL,'3','4');
INSERT INTO [creation].[items]([Name],[Category],[Type],[Class],[Date_of_Starting_Sell],[No_partion],[Dimention],[Value],[Quantity_on_Stock],[Inserted_date],[Updated_date],[Available],[Purchase_price]) 
VALUES('Plums','Fruits','Food','Perishable','2015-09-01','1635692442799','Big','11','0',GETDATE(),NULL,'5','12');


/****************************************************************************
************************   CHECKING SCRIPT   ********************************
*****************************************************************************
****************************************************************************/

--

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


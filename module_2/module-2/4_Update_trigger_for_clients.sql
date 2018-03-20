USE n_kozoriz_module_2
GO

-- Dropping trigger if it exists
IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[Creation].[triggerUpdateClientsTable]'))
DROP TRIGGER [creation].[triggerUpdateClientsTable]
GO



-- Creating trigger that updates Updated_date and puts there the date of updating row
create trigger triggerUpdateClientsTable 
ON creation.clients  
for UPDATE
AS
Begin
	IF @@ROWCOUNT = 0
		RETURN
	SET NOCOUNT ON;

    UPDATE [creation].[clients] 
	SET  [Updated_date] = GETDATE() 
    FROM Inserted i
    WHERE i.clientsID = clients.clientsID
END
GO



-- Updating Surname
UPDATE [creation].[clients]
SET Surname = 'Trump'
Where clientsID = 10
GO

/****************************************************************************
************************   CHECKING SCRIPT   ************************
*****************************************************************************
****************************************************************************/

  SELECT [clientsID]
      ,[Surname]
      ,[Name]
      ,[Phone]
      ,[Email]
      ,[Birth_date]
      ,[SSN]
      ,[Passport]
      ,[City]
      ,[Street]
      ,[Inserted_date]
      ,[Updated_date]
  FROM [creation].[clients]
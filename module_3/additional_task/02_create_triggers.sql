USE n_kozoriz_library
GO


-- Dropping trigger if it exists
IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[lib].[TriggerPopulateAuthorsLog]'))
DROP TRIGGER [lib].[TriggerPopulateAuthorsLog]
GO



-- Creating trigger that populates author_log
CREATE TRIGGER [lib].[TriggerPopulateAuthorsLog] 
ON [lib].[Authors]  
FOR INSERT, DELETE, UPDATE
AS
Begin

	

	DECLARE @operation CHAR(1)
	DECLARE @ins INT = (SELECT count(*) FROM INSERTED)
	DECLARE @del INT = (SELECT count(*) FROM DELETED)
	SET @operation = 
	CASE
		WHEN @ins > 0 and @del > 0 THEN 'U'  
		WHEN @ins = 0 and @del > 0 THEN 'D'  
		WHEN @ins > 0 and @del = 0 THEN 'I'  
	END

	

	---- insert
	IF @operation = 'I'
	BEGIN
		INSERT INTO [lib].[Authors_log]
				(Author_Id_new, Name_new, URL_new, Operation_type, operation_datetime)
		SELECT
			inserted.Author_Id, 
			inserted.Name,
			inserted.URL,
			@operation, 
			GETDATE()
		FROM lib.authors 
		inner join inserted ON lib.authors.Author_Id = inserted.Author_Id
	END
	---- Delete
	IF @operation = 'D'

	BEGIN
		INSERT INTO [lib].[Authors_log]
				(Author_Id_old, Name_old, URL_old, Operation_type, operation_datetime)
		SELECT 
			deleted.Author_Id, 
			deleted.Name,
			deleted.url,
			@operation, 
			GETDATE()
		FROM deleted 

	END

	---- Update
	IF @operation = 'U'
	PRINT 'U'
	BEGIN
		INSERT INTO [lib].[Authors_log]
				(Author_Id_new, Name_new, URL_new, Operation_type, operation_datetime,Author_Id_old, Name_old, URL_old)
		SELECT
			inserted.Author_Id, 
			inserted.Name,
			inserted.URL,
			@operation, 
			GETDATE(),
			deleted.Author_Id, 
			deleted.Name,
			deleted.url
		FROM [lib].[authors]
		inner join inserted ON lib.authors.Author_Id = inserted.Author_Id
		inner join deleted ON lib.authors.Author_Id = deleted.Author_Id

	END

END
GO




-- Dropping trigger if it exists
IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[lib].[triggerUpdateAuthors]'))
DROP TRIGGER [lib].[triggerUpdateAuthors]
GO



-- Creating trigger that populates author_log
CREATE TRIGGER [lib].[triggerUpdateAuthors]
ON [lib].[Authors]
FOR UPDATE
AS
Begin

    UPDATE [lib].[authors] 
	SET  [updated] = GETDATE(), [updated_by] = SYSTEM_USER
    FROM Inserted i
    WHERE i.Author_Id = authors.Author_Id
END
GO



-- Dropping trigger if it exists
IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[lib].[triggerUpdateBooks]'))
DROP TRIGGER [lib].[triggerUpdateBooks]
GO



-- Creating trigger that updates books table
CREATE TRIGGER [lib].[triggerUpdateBooks]
ON [lib].[Books]
FOR UPDATE
AS
Begin

    UPDATE [lib].[books] 
	SET  [updated] = GETDATE(), [updated_by] = SYSTEM_USER
    FROM Inserted i
    WHERE i.ISBN = books.ISBN
END
GO

-- Dropping trigger if it exists
IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[lib].[triggerUpdateBooksAuthors]'))
DROP TRIGGER [lib].[triggerUpdateBooksAuthors]
GO





-- Creating trigger that updates books table
CREATE TRIGGER [lib].[triggerUpdateBooksAuthors]
ON [lib].[BooksAuthors]
FOR UPDATE
AS
Begin

    UPDATE [lib].[BooksAuthors] 
	SET  [updated] = GETDATE(), [updated_by] = SYSTEM_USER
    FROM Inserted i
    WHERE i.BooksAuthors_id = BooksAuthors.BooksAuthors_id
END
GO




-- Dropping trigger if it exists
IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[lib].[triggerUpdatePublishers]'))
DROP TRIGGER [lib].[triggerUpdatePublishers]
GO



-- Creating trigger that updates books table
create trigger [lib].[triggerUpdatePublishers]
ON [lib].[Publishers]
FOR UPDATE
AS
Begin

    UPDATE [lib].[Publishers] 
	SET  [updated] = GETDATE(), [updated_by] = SYSTEM_USER
    FROM Inserted i
    WHERE i.Publisher_Id = Publishers.Publisher_Id
END
GO








/****************************************************************************
************************   CHECKING SCRIPT   ************************
*****************************************************************************
****************************************************************************/

---- Inserting values into clients table
--INSERT INTO [lib].[authors]([Name],[URL]) 
--VALUES('apple2','www.fb.com');

--DELETE FROM lib.authors
--WHERE Author_Id = '1'


--UPDATE lib.authors
--SET Name = 'Tomatos'
--Where Author_Id = '11'
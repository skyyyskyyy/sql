USE n_kozoriz_library
GO


-- Dropping trigger if it exists
IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[lib].[triggerPopulateAuthorsLog]'))
DROP TRIGGER [lib].[triggerPopulateAuthorsLog]
GO



-- Creating trigger that populates author_log
create trigger triggerPopulateAuthorsLog 
ON lib.Authors  
FOR INSERT, UPDATE, DELETE
AS
Begin

	

	DECLARE @operation char(1)
	DECLARE @ins int = (select count(*) from INSERTED)
	DECLARE @del int = (select count(*) from DELETED)
	set @operation = 
	case 
		when @ins > 0 and @del > 0 then 'U'  
		when @ins = 0 and @del > 0 then 'D'  
		when @ins > 0 and @del = 0 then 'I'  
	end 

	

	---- insert
	if @operation = 'I'
	begin
		insert into lib.Authors_log
				(Author_Id_new, Name_new, URL_new, Operation_type, operation_datetime)
		Select 
			inserted.Author_Id, 
			inserted.Name,
			inserted.URL,
			@operation, 
			GETDATE()
		FROM lib.authors 
		inner join inserted on lib.authors.Author_Id = inserted.Author_Id
	end
	---- Delete
	if @operation = 'D'
	begin
		insert into lib.Authors_log
				(Author_Id_old, Name_old, URL_old, Operation_type, operation_datetime)
		Select 
			deleted.Author_Id, 
			deleted.Name,
			deleted.url,
			@operation, 
			GETDATE()
		FROM deleted 

	end


END
GO




-- Dropping trigger if it exists
IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[lib].[triggerUpdateAuthors]'))
DROP TRIGGER [lib].[triggerUpdateAuthors]
GO



-- Creating trigger that populates author_log
create trigger triggerUpdateAuthors
ON lib.Authors  
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
create trigger triggerUpdateBooks
ON lib.Books
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
create trigger triggerUpdateBooksAuthors
ON lib.BooksAuthors
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
create trigger triggerUpdatePublishers
ON lib.Publishers
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
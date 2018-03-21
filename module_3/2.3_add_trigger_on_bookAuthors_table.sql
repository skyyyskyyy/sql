USE n_kozoriz_library
GO

-- Dropping trigger if it exists
IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[lib].[triggerInsertAuthors]'))
DROP TRIGGER [lib].[triggerInsertAuthors]
GO

-- Dropping trigger if it exists
IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[lib].[triggerDeleteAuthors]'))
DROP TRIGGER [lib].[triggerDeleteAuthors]
GO

-- Dropping trigger if it exists
IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[lib].[triggerUpdateAuthors]'))
DROP TRIGGER [lib].[triggerUpdateAuthors]
GO

CREATE TRIGGER [lib].[triggerInsertAuthors]
ON [lib].[BooksAuthors]
FOR INSERT
AS

BEGIN
	IF @@ROWCOUNT = 0
		RETURN
	DECLARE @Author_Id INT, @edition INT
	DECLARE c CURSOR FOR
		SELECT Author_Id, edition FROM inserted
		INNER JOIN [lib].[books] AS b
		ON b.ISBN = inserted.ISBN and b.issue = inserted.issue
	OPEN c
	FETCH NEXT FROM c INTO @Author_Id, @edition
	WHILE @@FETCH_STATUS = 0
	BEGIN
		UPDATE [lib].[Authors]
		SET total_edition = total_edition + @edition,
			book_amount = book_amount + 1,
			issue_amount = issue_amount + 1

		FROM [lib].[Authors]

		INNER JOIN inserted AS i 
		ON @Author_id = Authors.Author_id
		INNER JOIN lib.booksAuthors 
		ON booksAuthors.Author_id = Authors.author_id
		INNER JOIN lib.books AS b
		ON b.ISBN = booksAuthors.ISBN
		FETCH NEXT FROM c INTO @author_id, @edition
	END
	CLOSE c
	DEALLOCATE c
END
GO


CREATE TRIGGER [lib].[triggerDeleteAuthors]
ON [lib].[BooksAuthors]
FOR DELETE
AS
BEGIN

		IF @@ROWCOUNT = 0
		RETURN
		DECLARE @author_id INT, @edition INT
		DECLARE c CURSOR FOR
		SELECT Author_Id, edition FROM deleted 
		INNER JOIN lib.books AS b
		ON b.ISBN = deleted.ISBN
		OPEN c
		FETCH NEXT FROM c INTO @author_id, @edition

		WHILE @@FETCH_STATUS = 0
		BEGIN
			UPDATE [lib].[Authors]
			SET total_edition = total_edition - @edition,
				issue_amount = issue_amount - 1,
				book_amount = book_amount - 1
			
			FROM DELETED AS d
			WHERE d.author_id = Authors.Author_Id
			FETCH NEXT FROM c INTO @author_id, @edition
		END
		CLOSE c
		DEALLOCATE c
END
GO


--CREATE TRIGGER [lib].[triggerUpdateAuthors]
--ON [lib].[BooksAuthors]
--FOR UPDATE
--AS
--BEGIN
--		IF @@ROWCOUNT = 0
--		RETURN

--		Begin
--			UPDATE [lib].[Authors]
--			SET total_edition = total_edition - @edition,
--				issue_amount = issue_amount - 1,
--				book_amount = book_amount - 1
			
--			FROM DELETED as d
--			WHERE d.author_id = Authors.Author_Id
	
--END

--GO






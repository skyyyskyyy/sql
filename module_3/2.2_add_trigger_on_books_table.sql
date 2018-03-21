USE n_kozoriz_library
GO

-- Dropping trigger if it exists
IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[lib].[triggerUpdatePublishers]'))
DROP TRIGGER [lib].[triggerUpdatePublishers]
GO

-- Dropping trigger if it exists
IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[lib].[triggerInsertPublishers]'))
DROP TRIGGER [lib].[triggerInsertPublishers]
GO

-- Dropping trigger if it exists
IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[lib].[triggerDeletePublishers]'))
DROP TRIGGER [lib].[triggerDeletePublishers]
GO


--This trigger updates publishers when books is updated

CREATE TRIGGER triggerUpdatePublishers 
ON [lib].[Books]
for UPDATE
AS
BEGIN
	
	IF @@ROWCOUNT = 0
		RETURN

	UPDATE lib.Publishers
		SET total_edition = ((publishers.total_edition - d.edition) + i.edition),
			issue_amount = issue_amount + 1
		FROM lib.Publishers
		INNER JOIN inserted AS i
		ON i.publisher_id = Publishers.Publisher_Id
		INNER JOIN books AS b
		ON b.publisher_id = Publishers.Publisher_Id
		INNER JOIN deleted AS d
		ON d.publisher_id = b.Publisher_Id

END
GO



CREATE TRIGGER [lib].[triggerInsertPublishers] 
ON [lib].[Books]
FOR INSERT
AS
BEGIN
	IF @@ROWCOUNT = 0
		RETURN
	DECLARE @publisher_id iNT, @edition INT
	DECLARE c CURSOR FOR
		SELECT publisher_id, edition FROM inserted
	OPEN c
	FETCH NEXT FROM c INTO @publisher_id, @edition

	WHILE @@FETCH_STATUS = 0
	
	BEGIN
		UPDATE [lib].[Publishers]
		SET total_edition = total_edition + @edition,
			issue_amount = issue_amount + 1,
			book_amount = book_amount + 1
		FROM [lib].[Publishers]

		INNER JOIN inserted AS i
		ON @publisher_id = Publishers.Publisher_Id
		INNER JOIN books AS b
		ON b.publisher_id = Publishers.Publisher_Id
		WHERE @publisher_id = b.publisher_id
		FETCH NEXT FROM c INTO @publisher_id, @edition
	END
	CLOSE c
	DEALLOCATE c
END
GO







CREATE TRIGGER triggerDeletePublishers 
ON [lib].[Books]
FOR DELETE
AS
BEGIN

	IF @@ROWCOUNT = 0
		RETURN
	DECLARE @publisher_id iNT, @edition INT
	DECLARE c CURSOR FOR
		SELECT publisher_id, edition FROM deleted
	OPEN c
	FETCH NEXT FROM c INTO @publisher_id, @edition

	WHILE @@FETCH_STATUS = 0
	BEGIN
		UPDATE lib.Publishers
		SET total_edition = total_edition - d.edition,
			issue_amount = issue_amount - 1,
			book_amount = book_amount - 1
			
		FROM DELETED AS d
		WHERE @publisher_id = publishers.publisher_id
		FETCH NEXT FROM c INTO @publisher_id, @edition

	END

	CLOSE c
	DEALLOCATE c

END
GO























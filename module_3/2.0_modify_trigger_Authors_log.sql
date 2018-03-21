USE n_kozoriz_library
GO

--Altering triggerPopulateAuthorsLog
ALTER TRIGGER [lib].[triggerPopulateAuthorsLog]
ON [lib].[Authors]
FOR INSERT, DELETE, UPDATE
AS
BEGIN
	
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
				(book_amount_new, issue_amount_new, total_edition_new, Operation_type, operation_datetime)
		SELECT
			inserted.book_amount, 
			inserted.issue_amount,
			inserted.total_edition,
			@operation, 
			GETDATE()
		FROM [lib].[authors]
		inner join inserted ON lib.authors.Author_Id = inserted.Author_Id
	END
		---- DELETE
	IF @operation = 'D'
	BEGIN
		INSERT INTO [lib].[Authors_log]
				(createdbook_amount_old, issue_amount_old, total_edition_old, Operation_type, operation_datetime)
		SELECT
			deleted.book_amount, 
			deleted.issue_amount,
			deleted.total_edition,
			@operation, 
			GETDATE()
		FROM deleted 
	END
		---- UPDATE
	IF @operation = 'U'
	BEGIN
		INSERT INTO [lib].[Authors_log]
				(book_amount_new, issue_amount_new, total_edition_new, Operation_type, operation_datetime, createdbook_amount_old, issue_amount_old, total_edition_old)
		SELECT 
			inserted.book_amount, 
			inserted.issue_amount,
			inserted.total_edition,
			@operation, 
			GETDATE(),
			deleted.book_amount, 
			deleted.issue_amount,
			deleted.total_edition
		FROM [lib].[authors]
		inner join inserted ON lib.authors.Author_Id = inserted.Author_Id
		inner join deleted ON lib.authors.Author_Id = deleted.Author_Id

	END

END
GO

--Allowing nested triggers
sp_CONFIGURE 'nested_triggers',0
GO
RECONFIGURE
GO



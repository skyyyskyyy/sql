USE n_kozoriz_library
GO


-- Dropping trigger if it exists
IF EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[lib].[trg_nondelete_authors_log]'))
DROP TRIGGER [lib].[trg_nondelete_authors_log]
GO



CREATE TRIGGER trg_nondelete_authors_log
ON [lib].[authors_log]
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (
        SELECT  *
        FROM    deleted d
    )
    BEGIN
    
        RAISERROR('Delete from authors_log table is not allowed', 16, 1);
    END
END
GO


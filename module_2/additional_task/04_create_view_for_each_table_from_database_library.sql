USE n_kozoriz_library_view
GO


--Dropping view if it exists
IF EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[libra].[viewAuthors]'))
DROP VIEW [libra].[viewAuthors]
GO


-- View Creation
CREATE VIEW libra.viewAuthors
AS
SELECT [Author_Id]
      ,[Name]
      ,[URL]
      ,[inserted]
      ,[inserted_by]
      ,[updated]
      ,[updated_by]
  FROM [n_kozoriz_library].[lib].[authors]
GO


--Dropping view if it exists
IF EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[libra].[viewBooks]'))
DROP VIEW [libra].[viewBooks]
GO


-- View Creation
CREATE VIEW libra.viewBooks
AS
SELECT [ISBN]
      ,[Publisher_Id]
      ,[URL]
      ,[Price]
      ,[Inserted]
      ,[Inserted_by]
      ,[updated]
      ,[updated_by]
  FROM [n_kozoriz_library].[lib].[books]
GO


--Dropping view if it exists
IF EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[libra].[viewBooksAuthors]'))
DROP VIEW [libra].[viewBooksAuthors]
GO


-- View Creation
CREATE VIEW libra.viewBooksAuthors
AS
SELECT [BooksAuthors_id]
      ,[ISBN]
      ,[Author_Id]
      ,[Seq_No]
      ,[Inserted]
      ,[Inserted_by]
      ,[updated]
      ,[updated_by]
  FROM [n_kozoriz_library].[lib].[BooksAuthors]
GO

--Dropping view if it exists
IF EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[libra].[viewPublishers]'))
DROP VIEW [libra].[viewPublishers]
GO


-- View Creation
CREATE VIEW libra.viewPublishers
AS
SELECT [Publisher_Id]
      ,[Name]
      ,[Url]
      ,[Inserted]
      ,[Inserted_by]
      ,[updated]
      ,[updated_by]
  FROM [n_kozoriz_library].[lib].[Publishers]
GO




--Dropping view if it exists
IF EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[libra].[viewAuthors_log]'))
DROP VIEW [libra].[viewAuthors_log]
GO


-- View Creation
CREATE VIEW libra.viewAuthors_log
AS
SELECT [Operation_id]
      ,[Author_Id_new]
      ,[URL_new]
      ,[name_new]
      ,[Author_Id_old]
      ,[Name_old]
      ,[URL_old]
      ,[Operation_type]
      ,[Operation_datetime]
  FROM [n_kozoriz_library].[lib].[Authors_log]
GO






/****************************************************************************
************************   CHECKING SCRIPT   ************************
*****************************************************************************
****************************************************************************/

SELECT * FROM libra.viewAuthors
GO

SELECT * FROM libra.viewBooks
GO

SELECT * FROM libra.viewBooksAuthors
GO

SELECT * FROM libra.viewPublishers
GO

SELECT * FROM libra.viewAuthors_log
GO

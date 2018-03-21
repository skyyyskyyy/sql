USE [n_kozoriz_library]
GO

-- CREATING SCHEMA
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE NAME = 'lib')
BEGIN
  
    EXEC( 'CREATE SCHEMA lib' );
END

GO



-- Droping foreign keys in order to drop parent table

IF EXISTS(SELECT 1 FROM sys.foreign_keys WHERE parent_object_id = OBJECT_ID(N'[lib].[Books]'))

BEGIN 

ALTER TABLE [lib].[Books]
DROP CONSTRAINT Books_FK;
END 

GO


IF EXISTS(SELECT 1 FROM sys.foreign_keys WHERE parent_object_id = OBJECT_ID(N'[lib].[BooksAuthors]'))

BEGIN 

ALTER TABLE [lib].[BooksAuthors]
DROP CONSTRAINT BooksAuthors_FK;
END 

GO

IF EXISTS(SELECT 1 FROM sys.foreign_keys WHERE parent_object_id = OBJECT_ID(N'[lib].[BooksAuthors]'))

BEGIN 

ALTER TABLE [lib].[BooksAuthors]
DROP CONSTRAINT BooksAuthorstoID_FK;
END 

GO


-- Checking if table exists and dropping it
IF EXISTS(SELECT 1 FROM sys.tables WHERE object_id = OBJECT_ID('lib.Publishers'))
BEGIN;
    DROP TABLE [lib].[Publishers];
END;
GO


-- Creating the table authors
CREATE TABLE [lib].[Publishers] (
	[Publisher_Id] INTEGER  NOT NULL IDENTITY(101, 1),
    [Name] VARCHAR(50) NOT NULL CONSTRAINT [publisher_name_unique] UNIQUE ([name]),
    [Url] VARCHAR(50) NOT NULL CONSTRAINT [publisher_url_df] DEFAULT ('www.publishersname.com'), 
	[Inserted] DATE NOT NULL CONSTRAINT [publisher_inserted_df] DEFAULT (GETDATE()),
	[Inserted_by] VARCHAR(30) NOT NULL CONSTRAINT [publisher_inserted_by_df] DEFAULT (SYSTEM_USER),
    [Updated] DATE NULL,
    [Updated_by] VARCHAR(30) NULL,
	CONSTRAINT [PK_Publisher_Id] PRIMARY KEY ([Publisher_Id])
);
GO




-- Checking if table exists and dropping it
IF EXISTS(SELECT 1 FROM sys.tables WHERE object_id = OBJECT_ID('lib.Authors'))
BEGIN;
    DROP TABLE [lib].[Authors];
END;
GO


-- Creating the table authors
CREATE TABLE [lib].[Authors] (
    [Author_Id] INTEGER NOT NULL IDENTITY(1, 1),
    [Name] VARCHAR(30) NOT NULL CONSTRAINT [authors_name_unique] UNIQUE ([name]),
	[URL] VARCHAR(50) NOT NULL  CONSTRAINT [authors_url_df] DEFAULT ('www.authors_name.com'),
    [Inserted] DATETIME NOT NULL CONSTRAINT [authors_inserted_df] DEFAULT (GETDATE()),
    [Inserted_by] VARCHAR(50) NOT NULL CONSTRAINT [authors_inserted_by_df] DEFAULT (SYSTEM_USER),
    [Updated] DATETIME NULL,
    [Updated_by] VARCHAR(30) NULL,
	CONSTRAINT [PK_Author_Id] PRIMARY KEY ([Author_Id])
);
GO


-- Checking if table exists and dropping it
IF EXISTS(SELECT 1 FROM sys.tables WHERE object_id = OBJECT_ID('lib.Books'))
BEGIN;
    DROP TABLE [lib].[Books];
END;
GO


---- Creating the table authors
--CREATE TABLE [lib].[Books] (
--    [ISBN] VARCHAR(30) NOT NULL CONSTRAINT [books_isbn_unique] UNIQUE ([isbn]),
--    [Publisher_Id] INTEGER NOT NULL,
--    [URL] VARCHAR(70) NOT NULL CONSTRAINT [books_url_unique] UNIQUE ([url]),
--    [Price] MONEY NOT NULL  CONSTRAINT [books_price_df] DEFAULT ('0') CONSTRAINT [authors_price_chk] CHECK ([Price] >= '0'),
--	[Inserted] DATE NOT NULL CONSTRAINT [books_inserted_df] DEFAULT (GETDATE()),
--	[Inserted_by] VARCHAR(30) NOT NULL CONSTRAINT [books_inserted_by_df] DEFAULT (SYSTEM_USER),
--    [Updated] DATE NULL,
--    [Updated_by] VARCHAR(30) NULL,
--    CONSTRAINT [Books_PK] PRIMARY KEY ([ISBN]),
--	CONSTRAINT [Books_FK] FOREIGN KEY (Publisher_Id) REFERENCES [lib].[Publishers](Publisher_id) 
--	ON DELETE CASCADE
--	ON UPDATE CASCADE,
--);
--GO


-- Creating the table authors
CREATE TABLE [lib].[Books] (
    [ISBN] VARCHAR(30) NOT NULL,
    [Publisher_Id] INTEGER NOT NULL,
    [URL] VARCHAR(70) NOT NULL CONSTRAINT [books_url_unique] UNIQUE ([url]),
    [Price] MONEY NOT NULL  CONSTRAINT [books_price_df] DEFAULT ('0') CONSTRAINT [authors_price_chk] CHECK ([Price] >= '0'),
	[Inserted] DATE NOT NULL CONSTRAINT [books_inserted_df] DEFAULT (GETDATE()),
	[Inserted_by] VARCHAR(30) NOT NULL CONSTRAINT [books_inserted_by_df] DEFAULT (SYSTEM_USER),
    [Updated] DATE NULL,
    [Updated_by] VARCHAR(30) NULL,
    CONSTRAINT [Books_PK] PRIMARY KEY ([ISBN]),
	CONSTRAINT [Books_FK] FOREIGN KEY (Publisher_Id) REFERENCES [lib].[Publishers](Publisher_id) 
	ON DELETE CASCADE
	ON UPDATE CASCADE,
);
GO


-- Checking if table exists and dropping it
IF EXISTS(SELECT 1 FROM sys.tables WHERE object_id = OBJECT_ID('lib.BooksAuthors'))
BEGIN;
    DROP TABLE [lib].[BooksAuthors];
END;
GO


-- Creating the table authors
CREATE TABLE [lib].[BooksAuthors] (
	[BooksAuthors_id] INTEGER IDENTITY(1, 1),
    [ISBN] VARCHAR(30) NOT NULL CONSTRAINT [booksauthors_isbn_unique] UNIQUE ([isbn]), 
    [Author_Id] Integer NOT NULL, 
    [Seq_No] BIGINT NOT NULL CONSTRAINT [booksauthors_seq_no_df] DEFAULT ('1') CONSTRAINT [booksauthors_seq_no_chk] CHECK ([seq_no] >= '1'),
	[Inserted] DATE NOT NULL CONSTRAINT [booksauthors_inserted_df] DEFAULT (GETDATE()),
	[Inserted_by] VARCHAR(30) NOT NULL CONSTRAINT [booksauthors_inserted_by_df] DEFAULT (SYSTEM_USER),
    [Updated] DATE NULL,
    [Updated_by] VARCHAR(30) NULL,
	CONSTRAINT [BooksAuthors_id_PK] PRIMARY KEY ([ISBN]),
	CONSTRAINT [BooksAuthors_FK] FOREIGN KEY (ISBN) REFERENCES [lib].[Books](ISBN)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	Constraint [BooksAuthorstoID_FK] FOREIGN KEY (Author_id) REFERENCES [lib].[Authors](Author_id) 
	ON DELETE CASCADE
	ON UPDATE CASCADE,
);
GO

---- Creating the table authors
--CREATE TABLE [lib].[BooksAuthors] (
--	[BooksAuthors_id] INTEGER IDENTITY(1, 1),
--    [ISBN] VARCHAR(30) NOT NULL CONSTRAINT [booksauthors_isbn_unique] UNIQUE ([isbn]), 
--    [Author_Id] Integer NOT NULL, 
--    [Seq_No] BIGINT NOT NULL CONSTRAINT [booksauthors_seq_no_df] DEFAULT ('1') CONSTRAINT [booksauthors_seq_no_chk] CHECK ([seq_no] >= '1'),
--	[Inserted] DATE NOT NULL CONSTRAINT [booksauthors_inserted_df] DEFAULT (GETDATE()),
--	[Inserted_by] VARCHAR(30) NOT NULL CONSTRAINT [booksauthors_inserted_by_df] DEFAULT (SYSTEM_USER),
--    [Updated] DATE NULL,
--    [Updated_by] VARCHAR(30) NULL,
--	CONSTRAINT [BooksAuthors_id_PK] PRIMARY KEY ([ISBN]),
--	CONSTRAINT [BooksAuthors_FK] FOREIGN KEY (ISBN) REFERENCES [lib].[Books](ISBN)
--	ON DELETE CASCADE
--	ON UPDATE CASCADE,
--	Constraint [BooksAuthorstoID_FK] FOREIGN KEY (Author_id) REFERENCES [lib].[Authors](Author_id) 
--	ON DELETE CASCADE
--	ON UPDATE CASCADE,
--);
--GO



-- Checking if table exists and dropping it
IF EXISTS(SELECT 1 FROM sys.tables WHERE object_id = OBJECT_ID('lib.Authors_log'))
BEGIN;
    DROP TABLE [lib].[Authors_log];
END;
GO


-- Creating the table authors
CREATE TABLE [lib].[Authors_log] (
	[Operation_id] INTEGER IDENTITY(1, 1),
    [Author_Id_new] INTEGER,
    [URL_new] VARCHAR(30), 
	[Name_new] VARCHAR(30),
	[Author_Id_old] INTEGER,
	[Name_old] Varchar(30),
	[URL_old] Varchar(30),
	[Operation_type] VARCHAR(30) NOT NULL  CONSTRAINT [authors_log_chk] CHECK ([operation_type] in ('I','D','U')),
    [Operation_datetime] DATETIME NULL,
	CONSTRAINT [Authors_log_id_PK] PRIMARY KEY ([Operation_id])
);
GO

/****************************************************************************
************************   CHECKING SCRIPT   ********************************
*****************************************************************************
****************************************************************************/

SELECT [Author_Id]
      ,[Name]
      ,[URL]
      ,[Inserted]
      ,[Inserted_by]
      ,[Updated]
      ,[Updated_by]
  FROM [lib].[Authors]

SELECT [Operation_id]
      ,[Author_Id_new]
      ,[URL_new]
      ,[Author_Id_old]
      ,[Name_old]
      ,[URL_old]
      ,[Operation_type]
      ,[Operation_datetime]
  FROM [lib].[Authors_log]

  SELECT [ISBN]
      ,[Publisher_Id]
      ,[URL]
      ,[Price]
      ,[Inserted]
      ,[Inserted_by]
      ,[Updated]
      ,[Updated_by]
  FROM [lib].[Books]

  SELECT [BooksAuthors_id]
      ,[ISBN]
      ,[Author_Id]
      ,[Seq_No]
      ,[Inserted]
      ,[Inserted_by]
      ,[Updated]
      ,[Updated_by]
  FROM [lib].[BooksAuthors]

  SELECT [Publisher_Id]
      ,[Name]
      ,[Url]
      ,[Inserted]
      ,[Inserted_by]
      ,[updated]
      ,[updated_by]
  FROM [lib].[Publishers]
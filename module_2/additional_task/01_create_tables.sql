USE [n_kozoriz_library]
GO

-- CREATING SCHEMA
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'lib')
BEGIN
  
    EXEC( 'CREATE SCHEMA lib' );
END

GO

--Creating sequence

IF EXISTS (SELECT * FROM sys.sequences WHERE object_id = OBJECT_ID(N'[lib].[seq_1]'))
DROP SEQUENCE [lib].[seq_1]
GO

CREATE SEQUENCE lib.seq_1 
AS int
START with 0
increment BY 1
GO



-- Droping foreign keys in order to drop parent table

IF EXISTS(SELECT 1 FROM sys.foreign_keys WHERE parent_object_id = OBJECT_ID(N'[lib].[books]'))

BEGIN 

ALTER TABLE [lib].[books]
DROP CONSTRAINT books_FK;
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
    [Name] VARCHAR(30) NOT NULL UNIQUE,
    [Url] VARCHAR(30) NOT NULL DEFAULT ('www.publishersname.com'), 
	[Inserted] DATE NOT NULL DEFAULT GETDATE(),
	[Inserted_by] VARCHAR(30) NOT NULL DEFAULT SYSTEM_USER,
    [updated] DATE NULL,
    [updated_by] VARCHAR(30) NULL,
    PRIMARY KEY ([Publisher_Id])
);
GO




-- Checking if table exists and dropping it
IF EXISTS(SELECT 1 FROM sys.tables WHERE object_id = OBJECT_ID('lib.authors'))
BEGIN;
    DROP TABLE [lib].[authors];
END;
GO


-- Creating the table authors
CREATE TABLE [lib].[authors] (
    [Author_Id] INTEGER NOT NULL IDENTITY(1, 1),
    [Name] VARCHAR(30) NOT NULL Unique,
	[URL] VARCHAR(30) NOT NULL DEFAULT ('www.authors_name.com'),
    [inserted] DATETIME NOT NULL DEFAULT GETDATE(),
    [inserted_by] VARCHAR(50) NOT NULL DEFAULT SYSTEM_USER,
    [updated] DATETIME NULL,
    [updated_by] VARCHAR(30) NULL,
    PRIMARY KEY ([Author_Id])
);
GO
--INSERT INTO [lib].[authors]([Name],[URL]) VALUES('Gemma Tyson','www.Lycos.com');

-- Checking if table exists and dropping it
IF EXISTS(SELECT 1 FROM sys.tables WHERE object_id = OBJECT_ID('lib.books'))
BEGIN;
    DROP TABLE [lib].[books];
END;
GO


-- Creating the table authors
CREATE TABLE [lib].[books] (
    [ISBN] VARCHAR(60) NOT NULL,
    [Publisher_Id] INTEGER NOT NULL,
    [URL] VARCHAR(30) UNIQUE NOT NULL,
    [Price] Money NOT NULL DEFAULT '0' CHECK (Price >= '0'),
	[Inserted] DATE NOT NULL DEFAULT GETDATE(),
	[Inserted_by] VARCHAR(30) NOT NULL DEFAULT SYSTEM_USER,
    [updated] DATE NULL,
    [updated_by] VARCHAR(30) NULL,
    PRIMARY KEY ([ISBN]),
	Constraint books_FK foreign key (Publisher_Id) references lib.publishers(publisher_id) 
	on delete cascade
	on update cascade,
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
	[BooksAuthors_id] INTEGER DEFAULT '1' CHECK (BooksAuthors_id >= 1),
    [ISBN] VARCHAR(60) NOT NULL UNIQUE, 
    [Author_Id] Integer NOT NULL UNIQUE, 
    [Seq_No] Bigint NOT NULL DEFAULT '1' CHECK (Seq_No > 1),
	[Inserted] DATE NOT NULL DEFAULT GETDATE(),
	[Inserted_by] VARCHAR(30) NOT NULL DEFAULT SYSTEM_USER,
    [updated] DATE NULL,
    [updated_by] VARCHAR(30) NULL,
    PRIMARY KEY ([BooksAuthors_id]),
	Constraint BooksAuthors_FK foreign key (ISBN) references lib.books(ISBN) 
	on delete cascade
	on update cascade,
	Constraint BooksAuthorstoID_FK foreign key (Author_id) references lib.authors(Author_id) 
	on delete cascade
	on update cascade,
);
GO



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
	[name_new] VARCHAR(30),
	[Author_Id_old] INTEGER,
	[Name_old] Varchar(30),
	[URL_old] Varchar(30),
	[Operation_type] VARCHAR(30) NOT NULL Check (Operation_type in ('I','D','U')),
    [Operation_datetime] DATETIME NULL,
    PRIMARY KEY ([operation_id])
);
GO

/****************************************************************************
************************   CHECKING SCRIPT   ********************************
*****************************************************************************
****************************************************************************/

SELECT [Author_Id]
      ,[Name]
      ,[URL]
      ,[inserted]
      ,[inserted_by]
      ,[updated]
      ,[updated_by]
  FROM [lib].[authors]

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
      ,[updated]
      ,[updated_by]
  FROM [lib].[books]

  SELECT [BooksAuthors_id]
      ,[ISBN]
      ,[Author_Id]
      ,[Seq_No]
      ,[Inserted]
      ,[Inserted_by]
      ,[updated]
      ,[updated_by]
  FROM [lib].[BooksAuthors]

  SELECT [Publisher_Id]
      ,[Name]
      ,[Url]
      ,[Inserted]
      ,[Inserted_by]
      ,[updated]
      ,[updated_by]
  FROM [lib].[Publishers]
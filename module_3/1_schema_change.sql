USE n_kozoriz_library
GO

--We can run this script only once because Column names can be specified only once

ALTER TABLE [lib].[Authors]
ADD Birthday DATE NULL,
	Book_amount INT DEFAULT '0' CHECK (Book_amount >= 0) NOT NULL,
	Issue_amount INT DEFAULT '0' CHECK (Issue_amount >= 0) NOT NULL,
	Total_edition INT DEFAULT '0' CHECK (Total_edition >= 0) NOT NULL
GO

--Delete primary key and foreign key in order to create new
ALTER TABLE [lib].[BooksAuthors]
DROP CONSTRAINT BooksAuthors_FK;
GO

ALTER TABLE [lib].[Books]
DROP CONSTRAINT Books_PK;
GO



ALTER TABLE [lib].[Books]
ADD Title VARCHAR(90) DEFAULT 'Title' NOT NULL,
	Edition INT DEFAULT '1' CHECK (Edition >= 1) NOT NULL,
	Published DATE NULL,
	Issue INT DEFAULT '1' NOT NULL,
	CONSTRAINT [PK_books] PRIMARY KEY ([ISBN],[Issue])
GO


ALTER TABLE [lib].[BooksAuthors]
DROP CONSTRAINT BooksAuthors_id_PK;
GO

ALTER TABLE [lib].[BooksAuthors]
ADD 
	Issue INT DEFAULT '1' NOT NULL,
	CONSTRAINT [BooksAuthors_id_PK] PRIMARY KEY ([ISBN],[Issue])
GO

UPDATE [lib].[BooksAuthors]
    SET Issue = (
        SELECT Issue
        FROM [lib].[Books]
        WHERE [lib].[Books].[ISBN] = [lib].[BooksAuthors].[ISBN]
    );
GO

ALTER TABLE [lib].[BooksAuthors]
ADD CONSTRAINT BooksAuthors_FK FOREIGN KEY ([ISBN],[Issue]) REFERENCES [lib].[Books]([ISBN],[Issue])
ON DELETE CASCADE
ON UPDATE CASCADE
GO



ALTER TABLE [lib].[BooksAuthors]
DROP CONSTRAINT booksauthors_isbn_unique;
GO


ALTER TABLE [lib].[Publishers]
ADD Created DATE DEFAULT '19900101' NOT NULL,
	Country VARCHAR(20) DEFAULT 'USA' NOT NULL,
	City VARCHAR(20) DEFAULT 'NY' NOT NULL,
	Book_amount INT DEFAULT '0' CHECK ( Book_amount >= 0 ) NOT NULL,
	Issue_amount INT DEFAULT '0' CHECK ( Issue_amount >=0 ) NOT NULL,
	Total_edition INT DEFAULT '0' CHECK ( Total_edition >=0 ) NOT NULL
GO

ALTER TABLE [lib].[Authors_log]
ADD Createdbook_amount_old INT NULL,
	Issue_amount_old INT NULL,
	Total_edition_old INT NULL,
	Book_amount_new INT NULL,
	Issue_amount_new INT NULL,
	Total_edition_new INT NULL
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
      ,[Birthday]
      ,[Book_amount]
      ,[Issue_amount]
      ,[Total_edition]
  FROM [lib].[Authors]

  SELECT [Operation_id]
      ,[Author_Id_new]
      ,[URL_new]
      ,[Name_new]
      ,[Author_Id_old]
      ,[Name_old]
      ,[URL_old]
      ,[Operation_type]
      ,[Operation_datetime]
      ,[Createdbook_amount_old]
      ,[Issue_amount_old]
      ,[Total_edition_old]
      ,[Book_amount_new]
      ,[Issue_amount_new]
      ,[Total_edition_new]
  FROM [lib].[Authors_log]

  SELECT [ISBN]
      ,[Publisher_Id]
      ,[URL]
      ,[Price]
      ,[Inserted]
      ,[Inserted_by]
      ,[Updated]
      ,[Updated_by]
      ,[Title]
      ,[Edition]
      ,[Published]
      ,[Issue]
  FROM [lib].[books]

  SELECT [Publisher_Id]
      ,[Name]
      ,[Url]
      ,[Inserted]
      ,[Inserted_by]
      ,[Updated]
      ,[Updated_by]
      ,[Created]
      ,[Country]
      ,[City]
      ,[Book_amount]
      ,[Issue_amount]
      ,[Total_edition]
  FROM [lib].[Publishers]
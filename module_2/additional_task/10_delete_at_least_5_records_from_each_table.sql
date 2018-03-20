USE n_kozoriz_library
GO

--delete from books
DELETE FROM [lib].[books]
WHERE ISBN IN ('1607060960199', '1620010775599', '1645080331499', '1624022633399', '1638121297999');


--delete from authors
DELETE FROM [lib].[authors]
WHERE Author_Id > 10;

--delete from booksAuthors

DELETE FROM [lib].[booksAuthors]
WHERE booksAuthors_Id > 15;

--delete from booksAuthors

DELETE FROM [lib].[Publishers]
WHERE Publisher_Id > 115;

--delete from Authors_log - error will occure

DELETE FROM [lib].[Authors_log]
WHERE Operation_id > 5;


/****************************************************************************
************************   CHECKING SCRIPT   ************************
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

  SELECT [Operation_id]
      ,[Author_Id_new]
      ,[URL_new]
      ,[name_new]
      ,[Author_Id_old]
      ,[Name_old]
      ,[URL_old]
      ,[Operation_type]
      ,[Operation_datetime]
  FROM [lib].[Authors_log]
USE n_kozoriz_library
GO


-- update library.books

UPDATE [lib].[books]
   SET Price = CASE ISBN 
                      WHEN '0062678418' THEN '$9.99' 
                      WHEN '0316273902' THEN '$12.12' 
					  WHEN '0345546806' THEN '$16.12' 
                      WHEN '042528591X' THEN '$7.12' 
					  WHEN '0545791324' THEN '$16.12'  
                      WHEN '0545935180' THEN '$14.12' 
					  WHEN '076532637X' THEN '$6.12' 
                      WHEN '0998274135' THEN '$23.12' 
					  WHEN '1250158060' THEN '$15.12' 
                      WHEN '1449486797' THEN '$8.12' 
                      ELSE Price
              END
GO
-- update library.publishers

UPDATE [lib].[publishers]
   SET Name = CASE Publisher_Id 
                      WHEN '101' THEN 'Pearson Ltd' 
                      WHEN '102' THEN 'ThomsonReuters Corporation' 
					  WHEN '103' THEN 'RELX Group LTD' 
                      WHEN '104' THEN 'Wolters Kluwer Publishing' 
					  WHEN '105' THEN 'Penguin Random House Inc.'  
                      WHEN '106' THEN 'Phoenix Publishing and Media' 
					  WHEN '107' THEN 'China South Publishing & Media Group Co' 
                      WHEN '108' THEN 'Hachette Livre Co.' 
					  WHEN '109' THEN 'McGraw-Hill Education Ltd.' 
                      WHEN '110' THEN 'Holtzbrinck Co.' 
                      ELSE Name
              END

GO
-- update library.authors

UPDATE [lib].[authors]
   SET Name = CASE Author_Id 
                      WHEN '1' THEN 'Rowling Joan' 
                      WHEN '2' THEN 'Patterson James' 
					  WHEN '3' THEN 'Wolff Mike' 
                      WHEN '4' THEN 'Forest Bella' 
					  WHEN '5' THEN 'King Stephen'  
                      WHEN '6' THEN 'Kaur Rupi' 
					  WHEN '7' THEN 'Roberts Nora' 
                      WHEN '8' THEN 'Eliot Kendra' 
					  WHEN '9' THEN 'Leigh Melinda' 
                      WHEN '10' THEN 'Sullivan Mark' 
                      ELSE Name
              END
GO


-- update library.authors

UPDATE [lib].[BooksAuthors]
   SET Seq_No = CASE BooksAuthors_id
                      WHEN '1' THEN '8671468178' 
                      WHEN '2' THEN '8671468167' 
					  WHEN '3' THEN '8671468234' 
                      WHEN '4' THEN '4466464646' 
					  WHEN '5' THEN '3744474747'  
                      WHEN '6' THEN '47247373737' 
					  WHEN '7' THEN '5558375839' 
                      WHEN '8' THEN '592749099' 
					  WHEN '9' THEN '3531623727' 
                      WHEN '10' THEN '4474747777' 
                      ELSE Seq_No
              END
GO





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
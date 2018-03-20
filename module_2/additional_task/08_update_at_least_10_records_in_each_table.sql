USE n_kozoriz_library
GO


-- update library.books

UPDATE [lib].[books]
   SET Price = CASE ISBN 
                      WHEN '1607060960199' THEN '$44.08' 
                      WHEN '1614060811399' THEN '$45.12' 
					  WHEN '1620010775599' THEN '$46.12' 
                      WHEN '1620100884399' THEN '$97.12' 
					  WHEN '1624022633399' THEN '$56.12'  
                      WHEN '1638121297999' THEN '$34.12' 
					  WHEN '1642070342199' THEN '$56.12' 
                      WHEN '1645080331499' THEN '$23.12' 
					  WHEN '1647090778999' THEN '$45.12' 
                      WHEN '1651051792499' THEN '$98.12' 
                      ELSE Price
              END
GO
-- update library.publishers

UPDATE [lib].[publishers]
   SET Name = CASE Publisher_Id 
                      WHEN '101' THEN 'Avram O. Simpson' 
                      WHEN '102' THEN 'Jena T. Church' 
					  WHEN '103' THEN 'Barclay T. Bass' 
                      WHEN '104' THEN 'Lesley B. Craig' 
					  WHEN '105' THEN 'Oscar W. Wilcox'  
                      WHEN '106' THEN 'Coby S. Leonard' 
					  WHEN '107' THEN 'Cameran D. Parker' 
                      WHEN '108' THEN 'Martina S. Robertson' 
					  WHEN '109' THEN 'Laith C. Giles' 
                      WHEN '110' THEN 'Jonah E. Hayne' 
                      ELSE Name
              END

GO
-- update library.authors

UPDATE [lib].[authors]
   SET Name = CASE Author_Id 
                      WHEN '1' THEN 'Tom Simpson' 
                      WHEN '2' THEN 'Jerry Church' 
					  WHEN '3' THEN 'Mike Bass' 
                      WHEN '4' THEN 'Jake  Craig' 
					  WHEN '5' THEN 'OKarl Wilcox'  
                      WHEN '6' THEN 'Coby Leonard' 
					  WHEN '7' THEN 'Gaby Parker' 
                      WHEN '8' THEN 'Pagi Robertson' 
					  WHEN '9' THEN 'Mike Giles' 
                      WHEN '10' THEN 'Jonah Hayne' 
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
USE [education_task]
GO

SELECT [supplierid]
      ,[name]
      ,[rating]
      ,[city]
  FROM [dbo].[suppliers]
  ORDER BY rating DESC
GO
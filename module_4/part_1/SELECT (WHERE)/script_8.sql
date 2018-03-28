USE [education_task]
GO

SELECT [supplierid]
      ,[name]
      ,[rating]
      ,[city]
  FROM [dbo].[suppliers]
  WHERE [city] LIKE 'L%'
  GO


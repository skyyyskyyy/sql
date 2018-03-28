USE [education_task]
GO

SELECT [supplierid]
      ,[name]
      ,[rating]
      ,[city]
  FROM [dbo].[suppliers]
  WHERE [rating] NOT BETWEEN 12 AND 15
  GO

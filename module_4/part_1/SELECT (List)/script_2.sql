USE [education_task]
GO


SELECT [supplierid]
      ,[name]
      ,[rating]
      ,[city]
  FROM [dbo].[suppliers]
  WHERE rating > 20
GO
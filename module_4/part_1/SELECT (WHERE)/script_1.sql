USE [education_task]
GO


SELECT [supplierid]
      ,[name]
      ,[rating]
      ,[city]
  FROM [dbo].[suppliers]
  WHERE [supplierid] = 1
  GO
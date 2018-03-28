USE [education_task]
GO


SELECT [supplierid]
      ,[name]
      ,[rating]
      ,[city]
  FROM [dbo].[suppliers]
  WHERE [supplierid] NOT IN (1,2,3)
  GO
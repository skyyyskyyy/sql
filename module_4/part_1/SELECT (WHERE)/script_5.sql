USE [education_task]
GO



SELECT [supplierid]
      ,[name]
      ,[rating]
      ,[city]
  FROM [dbo].[suppliers]
  WHERE [rating] IS NULL
  GO
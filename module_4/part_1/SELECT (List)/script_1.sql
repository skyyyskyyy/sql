USE [education_task]
GO


SELECT * FROM [dbo].[suppliers]

--This way is better
SELECT [supplierid]
      ,[name]
      ,[rating]
      ,[city]
  FROM [dbo].[suppliers]
GO
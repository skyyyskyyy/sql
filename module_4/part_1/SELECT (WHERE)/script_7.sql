USE [education_task]
GO

SELECT [detailid]
      ,[name]
      ,[color]
      ,[weight]
      ,[city]
  FROM [dbo].[details]
  WHERE [color] = 'red' OR [color] = 'green'
  GO


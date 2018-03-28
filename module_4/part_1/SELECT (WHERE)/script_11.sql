USE [education_task]
GO

SELECT [detailid]
      ,[name]
      ,[color]
      ,[weight]
      ,[city]
  FROM [dbo].[details]
  WHERE [weight] = '17' OR [city] = 'London'
  GO
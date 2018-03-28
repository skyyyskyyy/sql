USE [education_task]
GO


SELECT [detailid]
      ,[name]
      ,[color]
      ,[weight] * 2 AS new_weight
      ,[city]
  FROM [dbo].[details]
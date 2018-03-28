USE [education_task]
GO


SELECT [detailid]
      ,[name]
      ,[color]
      ,[weight]
      ,[city]
  FROM [dbo].[details]
  WHERE [color] NOT LIKE 'G%'
GO
USE [education_task]
GO




SELECT COUNT (quantity) AS quantity_less_500
  FROM [dbo].[supplies]
  WHERE quantity < 500
GO
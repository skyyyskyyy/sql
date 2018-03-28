USE [education_task]
GO


SELECT [supplierid], AVG(quantity) as avg_quantity_per_supplier
  FROM [dbo].[supplies]
  GROUP BY [supplierid]
  HAVING AVG(quantity) > 500
GO
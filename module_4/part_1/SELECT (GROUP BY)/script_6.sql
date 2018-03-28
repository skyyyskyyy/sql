USE [education_task]
GO


SELECT [supplierid], MIN (quantity) AS min_quantity_per_supplier
  FROM [dbo].[supplies]
  GROUP BY [supplierid]
GO
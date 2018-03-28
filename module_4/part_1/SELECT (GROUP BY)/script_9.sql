USE [education_task]
GO


SELECT [supplierid]
	,MIN(quantity) AS min_detailes
	,MAX(quantity) AS max_detailes
	,AVG(quantity) AS avg_quantity_per_supplier
  FROM [dbo].[supplies]
  GROUP BY [supplierid]
GO
USE [education_task]
GO


SELECT [supplierid]
      ,COUNT (DISTINCT [detailid]) AS types_of_details
  FROM [dbo].[supplies]
  GROUP BY [supplierid]
GO
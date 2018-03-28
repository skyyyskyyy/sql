USE [education_task]
GO


SELECT [supplierid]
      ,[detailid]
      ,[productid]
      ,[quantity]
      ,[operationdate]
  FROM [dbo].[supplies]
  WHERE [quantity] >= 700
  GO
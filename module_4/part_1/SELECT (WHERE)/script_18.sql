USE [education_task]
GO


SELECT [supplierid]
      ,[detailid]
      ,[productid]
      ,[quantity]
      ,[operationdate]
  FROM [dbo].[supplies]
  WHERE [detailid] + [supplierid] = 4
GO
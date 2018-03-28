USE [education_task]
GO



SELECT [supplierid]
      ,[detailid]
      ,[productid]
      ,[quantity]
      ,[operationdate]
  FROM [dbo].[supplies]
  WHERE [quantity] BETWEEN 300 AND 500
  GO
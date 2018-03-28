USE [education_task]
GO


SELECT [supplierid]
      ,[detailid]
      ,[productid]
      ,[quantity]
      ,[operationdate]
	  ,(([productid]+[detailid]+[supplierid])/3) AS AVG_code
  FROM [dbo].[supplies]
  WHERE (([productid]+[detailid]+[supplierid])/3) = 1
GO

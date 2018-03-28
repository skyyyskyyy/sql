USE [education_task]
GO


-- First method
SELECT 
  DISTINCT([suppliers].[supplierid])
  ,[suppliers].[name]
  FROM [dbo].[suppliers]
  INNER JOIN [dbo].[supplies] ON [suppliers].[supplierid] = [supplies].[supplierid]
GO


-- Second method


SELECT   
   DISTINCT([suppliers].[supplierid])
   ,[suppliers].[name]
   FROM [dbo].[suppliers], [dbo].[supplies]
   WHERE  [suppliers].[supplierid] = [supplies].[supplierid]
GO
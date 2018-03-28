USE [education_task]
GO

SELECT 
  DISTINCT ([suppliers].[supplierid])
  ,[suppliers].[name]
  FROM [dbo].[suppliers]
  FULL OUTER JOIN [dbo].[supplies] ON [suppliers].[supplierid] = [supplies].[supplierid]
  WHERE [suppliers].[supplierid] IS NULL OR [supplies].[supplierid] IS NULL
GO


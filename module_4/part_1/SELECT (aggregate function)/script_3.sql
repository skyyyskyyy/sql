USE [education_task]
GO

SELECT COUNT([supplierid]) AS supplies_quantity
 FROM [dbo].[supplies]
 WHERE [supplierid] = 2
 GO
USE [education_task]
GO

-- SUM of Supplies of each detail
SELECT [detailid]
	   ,SUM ([quantity]) AS sum_of_supplies
	FROM [dbo].[supplies]
	GROUP BY [detailid]
GO


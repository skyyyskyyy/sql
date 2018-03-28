USE [education_task]
GO

-- AVG quantity of each details
SELECT [detailid]
	   ,SUM ([quantity]) / COUNT ([quantity]) AS average_amount_of_details
	FROM [dbo].[supplies]
	GROUP BY [detailid]
GO


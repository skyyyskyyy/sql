USE [education_task]
GO


SELECT TOP 1 WITH TIES
	[supplierid]
	,[rating]
	FROM [dbo].[suppliers]
	WHERE [rating] IS NOT NULL
	order by rating DESC
 GO

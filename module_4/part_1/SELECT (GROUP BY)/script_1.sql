USE [education_task]
GO


SELECT  [city]
		,COUNT([supplierid]) AS quantity
		FROM [dbo].[suppliers]
		GROUP BY [city]
GO
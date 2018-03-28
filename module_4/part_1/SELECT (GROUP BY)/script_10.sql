USE [education_task]
GO

SELECT [city]
	   ,MIN( [weight] ) as min_weight
		FROM [dbo].[details]
		GROUP BY [city]
GO
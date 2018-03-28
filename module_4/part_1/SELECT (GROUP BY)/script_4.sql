USE [education_task]
GO

SELECT [city]
	   ,SUM ( [weight] ) as sum_weight
		FROM [dbo].[details]
		GROUP BY [city]
HAVING [city] = 'London' OR [city] = 'PARIS'
GO
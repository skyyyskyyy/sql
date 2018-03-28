USE [education_task]
GO


SELECT  [city],
		AVG ([rating]) AS avg_city_rating
		FROM [dbo].[suppliers]
		GROUP BY [city]
		HAVING [city] = 'London'
 GO
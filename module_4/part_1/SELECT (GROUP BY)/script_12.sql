USE [education_task]
GO


SELECT
	AVG (DISTINCT [rating]) AS avg_rating
 FROM [dbo].[suppliers]
 GO

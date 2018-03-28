USE [education_task]
GO


SELECT COUNT (DISTINCT [rating]) AS unique_rating_quantity
FROM [dbo].[suppliers]
GO
USE [education_task]
GO

SELECT COUNT( DISTINCT [color])   AS unique_colors_quantity  
FROM [dbo].[details]
GO
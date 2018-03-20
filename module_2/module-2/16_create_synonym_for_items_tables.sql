USE education
GO

-- Dropping trigger if it exists
IF EXISTS (SELECT * FROM sys.synonyms WHERE object_id = OBJECT_ID(N'[dbo].[items]'))
DROP SYNONYM [dbo].[items]
GO

create synonym dbo.items for n_kozoriz_module_2.creation.items
go


/****************************************************************************
************************   CHECKING SCRIPT   ************************
*****************************************************************************
****************************************************************************/

select * from  dbo.items
go


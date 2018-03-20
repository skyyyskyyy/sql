USE education
GO

-- Dropping synonym if it exists
IF EXISTS (SELECT * FROM sys.synonyms WHERE object_id = OBJECT_ID(N'[dbo].[items_2]'))
DROP SYNONYM [dbo].[items_2]
GO

create synonym dbo.items_2 for n_kozoriz_module_2.creation.items_2
go


/****************************************************************************
************************   CHECKING SCRIPT   ************************
*****************************************************************************
****************************************************************************/

select * from  dbo.items_2
go


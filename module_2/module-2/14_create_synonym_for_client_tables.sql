USE education
GO

-- Dropping trigger if it exists
IF EXISTS (SELECT * FROM sys.synonyms WHERE object_id = OBJECT_ID(N'[dbo].[clients]'))
DROP SYNONYM [dbo].[clients]
GO

create synonym dbo.clients for n_kozoriz_module_2.creation.clients
go


/****************************************************************************
************************   CHECKING SCRIPT   ************************
*****************************************************************************
****************************************************************************/

select * from  dbo.clients
go


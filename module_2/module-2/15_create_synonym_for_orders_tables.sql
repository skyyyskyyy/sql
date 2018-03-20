USE education
GO

-- Dropping synonym if it exists
IF EXISTS (SELECT * FROM sys.synonyms WHERE object_id = OBJECT_ID(N'[dbo].[orders]'))
DROP SYNONYM [dbo].[orders]
GO

create synonym dbo.orders for n_kozoriz_module_2.creation.orders
go


/****************************************************************************
************************   CHECKING SCRIPT   ************************
*****************************************************************************
****************************************************************************/

select * from  dbo.orders
go


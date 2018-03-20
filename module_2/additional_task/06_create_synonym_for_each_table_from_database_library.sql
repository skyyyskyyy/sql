USE n_kozoriz_library_synonym
GO

-- Dropping synonym if it exists
IF EXISTS (SELECT * FROM sys.synonyms WHERE object_id = OBJECT_ID(N'[libra_syn].[books]'))
DROP SYNONYM [libra_syn].[books]
GO

create synonym libra_syn.books for n_kozoriz_library.lib.books
go


-- Dropping synonym if it exists
IF EXISTS (SELECT * FROM sys.synonyms WHERE object_id = OBJECT_ID(N'[libra_syn].[authors_log]'))
DROP SYNONYM [libra_syn].[authors_log]
GO


create synonym libra_syn.authors_log for n_kozoriz_library.lib.authors_log
go


-- Dropping synonym if it exists
IF EXISTS (SELECT * FROM sys.synonyms WHERE object_id = OBJECT_ID(N'[libra_syn].[authors]'))
DROP SYNONYM [libra_syn].[authors]
GO


create synonym libra_syn.authors for n_kozoriz_library.lib.authors
go


-- Dropping synonym if it exists
IF EXISTS (SELECT * FROM sys.synonyms WHERE object_id = OBJECT_ID(N'[libra_syn].[BooksAuthors]'))
DROP SYNONYM [libra_syn].[BooksAuthors]
GO


create synonym libra_syn.BooksAuthors for n_kozoriz_library.lib.BooksAuthors
go


-- Dropping synonym if it exists
IF EXISTS (SELECT * FROM sys.synonyms WHERE object_id = OBJECT_ID(N'[libra_syn].[Publishers]'))
DROP SYNONYM [libra_syn].[Publishers] 
GO


create synonym libra_syn.Publishers for n_kozoriz_library.lib.Publishers
go










/****************************************************************************
************************   CHECKING SCRIPT   ************************
*****************************************************************************
****************************************************************************/

select * from  libra_syn.books
go

select * from  libra_syn.authors_log
go

select * from  libra_syn.authors
go

select * from  libra_syn.BooksAuthors
go

select * from  libra_syn.Publishers
go

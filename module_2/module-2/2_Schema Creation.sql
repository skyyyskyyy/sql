USE [n_kozoriz_module_2]
GO

-- CREATING SCHEMA
IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'creation')
BEGIN
  
    EXEC( 'CREATE SCHEMA creation' );
END

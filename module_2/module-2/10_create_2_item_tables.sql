USE n_kozoriz_module_2
GO

-- Droping table if exists
IF EXISTS(SELECT 1 FROM sys.tables WHERE object_id = OBJECT_ID('creation.items'))
BEGIN;
    DROP TABLE [creation].[items];
END;
GO

-- Creating new table items
CREATE TABLE [creation].[items] (
    [itemsID] INTEGER NOT NULL IDENTITY(1, 1),
    [Name] VARCHAR(30) NOT NULL,
    [Category] VARCHAR(30) NOT NULL,
    [Type] VARCHAR(30) NOT NULL,
    [Class] VARCHAR(30) NOT NULL,
    [Date_of_Starting_Sell] Date NOT NULL,
    [No_partion] VARCHAR(30) NOT NULL,
    [Dimention] VARCHAR(30) NOT NULL,
    [Value] INTEGER NOT NULL,
    [Quantity_on_Stock] INTEGER NOT NULL,
	[Inserted_date] DATETIME NOT NULL,
	[Updated_date] DATETIME NULL,
	[Available] Bit NOT NULL,
	[Purchase_price] INTEGER NOT NULL,
	[Quality] Varchar (30) NULL,
    PRIMARY KEY ([itemsID]),
);
GO

-- Inserting values into items table
INSERT INTO [creation].[items]([Name],[Category],[Type],[Class],[Date_of_Starting_Sell],[No_partion],[Dimention],[Value],[Quantity_on_Stock],[Inserted_date],[Updated_date],[Available],[Purchase_price]) 
VALUES('Apples','Fruits','Food','Perishable','2017-09-01','1630092042499','Small','10','123',GETDATE(),NULL,'1','3');

-- Dropping items_2 table if it exists
IF EXISTS(SELECT 1 FROM sys.tables WHERE object_id = OBJECT_ID('creation.items_2'))
BEGIN;
    DROP TABLE [creation].[items_2];
END;
GO

-- Creating table item_2
CREATE TABLE [creation].[items_2] (
    [itemsID] INTEGER NOT NULL IDENTITY(1, 1),
    [Name] VARCHAR(30) NOT NULL,
    [Category] VARCHAR(30) NOT NULL,
    [Type] VARCHAR(30) NOT NULL,
    [Class] VARCHAR(30) NOT NULL,
    [Date_of_Starting_Sell] Date NOT NULL,
    [No_partion] VARCHAR(13) NULL UNIQUE,
    [Dimention] VARCHAR(10) NOT NULL,
    [Value] INTEGER NULL,
    [Quantity_on_Stock] INTEGER NULL,
	[Inserted_date] DATETIME NOT NULL,
	[Updated_date] DATETIME NULL,
	[Available] Bit NOT NULL,
	[Purchase_price] INTEGER NOT NULL check (Purchase_price > 0),
	[Operation] Varchar(12) NULL,
	[Date_of_Operation] Datetime NULL,
    PRIMARY KEY ([itemsID]),
);
GO

-- Inserting Values into table item_2
INSERT INTO [creation].[items_2]([Name],[Category],[Type],[Class],[Date_of_Starting_Sell],[No_partion],[Dimention],[Value],[Quantity_on_Stock],[Inserted_date],[Updated_date],[Available],[Purchase_price]) 
VALUES('Apples','Fruits','Food','Perishable','2017-09-01','1630092042499','Small','10','123',GETDATE(),NULL,'1','3');

/****************************************************************************
************************   CHECKING SCRIPT   ************************
*****************************************************************************
****************************************************************************/

SELECT [itemsID]
      ,[Name]
      ,[Category]
      ,[Type]
      ,[Class]
      ,[Date_of_Starting_Sell]
      ,[No_partion]
      ,[Dimention]
      ,[Value]
      ,[Quantity_on_Stock]
      ,[Inserted_date]
      ,[Updated_date]
      ,[Available]
      ,[Purchase_price]
      ,[Quality]
  FROM [creation].[items]

  SELECT [itemsID]
      ,[Name]
      ,[Category]
      ,[Type]
      ,[Class]
      ,[Date_of_Starting_Sell]
      ,[No_partion]
      ,[Dimention]
      ,[Value]
      ,[Quantity_on_Stock]
      ,[Inserted_date]
      ,[Updated_date]
      ,[Available]
      ,[Purchase_price]
      ,[Operation]
      ,[Date_of_Operation]
  FROM [creation].[items_2]
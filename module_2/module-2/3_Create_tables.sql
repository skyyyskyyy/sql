USE n_kozoriz_module_2
GO


-- Droping foreign key in order to drop parent table

IF EXISTS(SELECT 1 FROM sys.foreign_keys WHERE parent_object_id = OBJECT_ID(N'[creation].[orders]'))

BEGIN 

ALTER TABLE [creation].[orders]
DROP CONSTRAINT orders_FK;
END 

GO



-- Checking if table exists and dropping it
IF EXISTS(SELECT 1 FROM sys.tables WHERE object_id = OBJECT_ID('creation.clients'))
BEGIN;
    DROP TABLE [creation].[clients];
END;
GO

-- Creating the table clients
CREATE TABLE [creation].[clients] (
    [clientsID] INTEGER NOT NULL IDENTITY(1, 1),
    [Surname] VARCHAR(255) NOT NULL,
    [Name] VARCHAR(255) NOT NULL,
    [Phone] VARCHAR(100) NOT NULL,
    [Email] VARCHAR(255) NOT NULL,
    [Birth_date] Date NOT NULL CHECK (Birth_date > '19300826'),
    [SSN] VARCHAR(13) NOT NULL,
    [Passport] VARCHAR(10) NOT NULL UNIQUE,
    [City] VARCHAR(255) NULL,
    [Street] VARCHAR(255) NULL,
	[Inserted_date] DATETIME NOT NULL,
	[Updated_date] DATETIME NULL,
    PRIMARY KEY ([clientsID])
);
GO
-- Inserting values into clients table
INSERT INTO [creation].[clients]([Surname],[Name],[Phone],[Email],[Birth_date],[SSN],[Passport],[City],[Street],[Inserted_date]) 
VALUES('Montgomery','Wang','050-708-8405','enim.non.nisi@eratneque.co.uk','1971-09-01','1630092042499','RS 596859','Lillois-WitterzŽe','Ap #975-4706 Ipsum. Avenue',GETDATE()),
('Howell','Clark','096-098-9371','diam@magnis.net','1995-09-07','1610010570599','RS 596899','Massemen','9427 Donec St.', GETDATE()),
('Yates','Keelie','067-082-6205','facilisis.Suspendisse.commodo@est.org','1966-08-01','1686050308999','RS 592859','Kapolei','516-6775 Arcu Ave', GETDATE()),
('Cote','Fiona','067-730-9272','lacus.pede.sagittis@sed.edu','1969-01-10','1648041931999','RS 596853','Milnathort','4124 Ligula. Street', GETDATE()),
('Aguilar','Adena','096-506-2841','dictum.cursus@Nuncsollicitudincommodo.net','1972-10-10','1672071737099','RS 596851','Sciacca','P.O. Box 689, 8072 Egestas Ave', GETDATE()),
('Watts','Janna','050-194-5311','taciti.sociosqu.ad@Aeneanegetmagna.edu','1955-10-17','1669101289899','RS 596866','Okene','302-5962 Quisque Street', GETDATE()),
('Schroeder','Kimberly','050-326-8673','vel.sapien.imperdiet@Namligulaelit.co.uk','1963-12-10','1693051137299','RS 596834','Cagnes-sur-Mer','P.O. Box 951, 6939 Aliquet. Rd.', GETDATE()),
('Savage','Palmer','063-137-0056','amet@duiCumsociis.edu','1951-12-01','1617080744099','RS 596889','Melilla','P.O. Box 133, 1826 Ultrices Road', GETDATE()),
('Ortiz','Stacy','067-035-7264','Proin.velit.Sed@orci.co.uk','1974-09-12','1628051724799','RS 596823','Ararat','Ap #916-5279 Vitae St.', GETDATE()),
('Vance','Karly','050-914-2518','adipiscing@urnaVivamus.co.uk','1964-12-09','1678050978499','RS 596887','Cuddalore','6246 Aptent Rd.', GETDATE());

-- Checking if orders table exists and droping it
IF EXISTS(SELECT 1 FROM sys.tables WHERE object_id = OBJECT_ID('creation.orders'))
BEGIN;
    DROP TABLE [creation].[orders];
END;
GO
-- Creating orders table
CREATE TABLE [creation].[orders] (
    [ordersID] INTEGER NOT NULL IDENTITY(1, 1),
    [Order_number] VARCHAR(13) NOT NULL UNIQUE,
    [Date_created] Date NOT NULL,
    [Client_id] INTEGER NOT NULL,
    [Item_id] INTEGER NOT NULL,
    [Quantity] INTEGER NOT NULL check (Quantity > 0),
    [Price_per_one] MONEY NOT NULL check (Price_per_one > 0),
    [Shipped] BIT NOT NULL,
	[Inserted_date] DATETIME,
	[Sum] AS [Quantity] * [Price_per_one],
	[Updated_date] DATETIME NULL,
    PRIMARY KEY ([ordersID]),
	Constraint orders_FK foreign key (Client_id) references creation.clients (clientsID) 
	on delete cascade
	on update cascade
);
GO

-- Inserting values into orders table
INSERT INTO [creation].[orders]([Order_number],[Date_created],[Client_id],[Item_id],[Quantity],[Price_per_one],[Shipped],[Inserted_date]) VALUES('16880510-9314','2017-11-22 12:16:57',1,5193,94,'158.07','0',GETDATE()),
('16711203-4827','2015-03-24 09:04:32',10,2124,1,'99.64','1',GETDATE()),
('16951204-9611','2016-06-28 03:54:43',4,501,2,'88.63','0',GETDATE()),
('16831123-8557','2017-11-01 15:09:57',7,4304,3,'738.53','1',GETDATE()),
('16720719-5434','2017-01-28 04:26:53',8,7751,3,'665.39','1',GETDATE()),
('16740504-0614','2017-05-18 08:26:20',2,1495,2,'325.21','0',GETDATE()),
('16950209-8354','2017-04-12 02:43:25',4,7355,5,'60.81','0',GETDATE()),
('16151023-7140','2016-11-13 13:15:52',2,7497,1,'333.56','0',GETDATE()),
('16060307-5789','2017-06-22 21:15:59',10,1062,11,'847.13','1',GETDATE()),
('16350601-0119','2017-10-15 11:43:24',10,1916,14,'500.79','0',GETDATE());


/****************************************************************************
************************   CHECKING SCRIPT   ************************
*****************************************************************************
****************************************************************************/

SELECT [ordersID]
      ,[Order_number]
      ,[Date_created]
      ,[Client_id]
      ,[Item_id]
      ,[Quantity]
      ,[Price_per_one]
      ,[Shipped]
      ,[Inserted_date]
      ,[Sum]
      ,[Updated_date]
  FROM [creation].[orders]

  SELECT [clientsID]
      ,[Surname]
      ,[Name]
      ,[Phone]
      ,[Email]
      ,[Birth_date]
      ,[SSN]
      ,[Passport]
      ,[City]
      ,[Street]
      ,[Inserted_date]
      ,[Updated_date]
  FROM [creation].[clients]
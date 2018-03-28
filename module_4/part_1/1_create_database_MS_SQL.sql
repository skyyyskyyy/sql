USE [master]
GO 


-- Checking if db exists
 IF EXISTS(SELECT NAME FROM sys.databases
    WHERE NAME = 'education_task')
    DROP DATABASE [education_task]
 GO


create database education_task
go

use education_task
go
 


CREATE TABLE [dbo].[categories](
	[id] [int]  NOT NULL PRIMARY KEY,
	[name] [varchar](30) NOT NULL)
GO




CREATE TABLE details (
       detailid             integer NOT NULL,
       name                 varchar(20) NULL,
       color                varchar(20) NULL,
       weight               integer NULL,
       city                 varchar(20) NULL
)
go


ALTER TABLE details
       ADD CONSTRAINT XPKdetails PRIMARY KEY CLUSTERED (detailid ASC)
go


CREATE TABLE products (
       productid            integer NOT NULL,
       name                 varchar(20) NULL,
       city                 varchar(20) NULL,
	   categoryid           int
)
go


ALTER TABLE products
       ADD CONSTRAINT XPKproducts PRIMARY KEY CLUSTERED (productid ASC)
go


CREATE TABLE suppliers (
       supplierid           integer NOT NULL,
       name                 varchar(20) NULL,
       rating               integer NULL,
       city                 varchar(20) NULL
)
go


ALTER TABLE suppliers
       ADD CONSTRAINT XPKsuppliers PRIMARY KEY CLUSTERED (supplierid ASC)
go


CREATE TABLE supplies (
       supplierid           integer NOT NULL,
       detailid             integer NOT NULL,
       productid            integer NOT NULL,
       quantity             integer NOT NULL default 0,
	   operationdate        datetime NOT NULL default getdate()
)
go


ALTER TABLE supplies
       ADD CONSTRAINT R_4
              FOREIGN KEY (productid)
                             REFERENCES products  (productid)
go


ALTER TABLE supplies
       ADD CONSTRAINT R_3
              FOREIGN KEY (detailid)
                             REFERENCES details  (detailid)
go


ALTER TABLE supplies
       ADD CONSTRAINT R_1
              FOREIGN KEY (supplierid)
                             REFERENCES suppliers  (supplierid)
go

ALTER TABLE products
       ADD CONSTRAINT P_1
              FOREIGN KEY (categoryid)
                             REFERENCES categories  (id)
go



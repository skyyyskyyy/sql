USE [master]
GO 


-- Checking if db exists
 IF EXISTS(SELECT NAME FROM sys.databases
    WHERE NAME = 'SalesOrders')
    DROP DATABASE [SalesOrders]
 GO


create database SalesOrders
go

use SalesOrders
go

CREATE TABLE Customers 
  (CustomerID int PRIMARY KEY,
   CustFirstName varchar (25),
   CustLastName varchar (25),
   CustStreetAddress varchar (50),
   CustCity varchar (30),
   CustState varchar (2),
   CustZipCode varchar (10),
   CustAreaCode smallint,
   CustPhoneNumber varchar (8)) 

CREATE TABLE Employees 
  (EmployeeID int PRIMARY KEY,
   EmpFirstName varchar (25),
   EmpLastName varchar (25),
   EmpStreetAddress varchar (50),
   EmpCity varchar (30),
   EmpState varchar (2),
   EmpZipCode varchar (10),
   EmpAreaCode smallint,
   EmpPhoneNumber varchar (8)) 

CREATE TABLE Vendors 
  (VendorID smallint PRIMARY KEY,
   VendName varchar (25),
   VendStreetAddress varchar (50),
   VendCity varchar (30),
   VendState varchar (2),
   VendZipCode varchar (10),
   VendPhoneNumber varchar (15),
   VendFaxNumber varchar (15),
   VendWebPage varchar (255),
   VendEMailAddress varchar (50))

CREATE TABLE Categories 
  (CategoryID smallint PRIMARY KEY,
   CategoryDescription varchar (75)) 
GO

CREATE TABLE Products 
  (ProductNumber smallint PRIMARY KEY,
   ProductName varchar (50),
   ProductDescription varchar (100),
   RetailPrice decimal (10,2),
   QuantityOnHand smallint,
   CategoryID smallint REFERENCES Categories (CategoryID)) 

CREATE TABLE Orders 
  (OrderNumber smallint PRIMARY KEY,
   OrderDate date,
   ShipDate date,
   CustomerID int REFERENCES Customers (CustomerID),
   EmployeeID int REFERENCES Employees (EmployeeID)) 

CREATE TABLE Order_Details 
  (OrderNumber smallint NOT NULL REFERENCES Orders (OrderNumber),
   ProductNumber smallint NOT NULL REFERENCES Products (ProductNumber),
   QuotedPrice decimal (10,2),
   QuantityOrdered smallint,
   PRIMARY KEY (OrderNumber, ProductNumber)) 

CREATE TABLE Product_Vendors 
  (ProductNumber smallint NOT NULL REFERENCES Products (ProductNumber),
   VendorID smallint NOT NULL REFERENCES Vendors (VendorID),
   WholesalePrice decimal (10,2),
   DaysToDeliver smallint,
   PRIMARY KEY (ProductNumber, VendorID)) 
go

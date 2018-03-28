USE [SalesOrders]
GO

/****************************************************************************
************************   Task One   ************************
*****************************************************************************
****************************************************************************/

SELECT DISTINCT ([CustCity])
FROM [Customers]
GO

/****************************************************************************
************************   Task Two   ************************
*****************************************************************************
****************************************************************************/

SELECT
	   [EmpFirstName]
      ,[EmpLastName]
	  ,[EmpPhoneNumber]
FROM [Employees]
GO

/****************************************************************************
************************   Task Three   ************************
*****************************************************************************
****************************************************************************/

SELECT 
	DISTINCT ([CategoryDescription])
	FROM [Products], [Categories]
	WHERE products.CategoryID = Categories.CategoryID
GO

/****************************************************************************
************************   Task Four   ************************
*****************************************************************************
****************************************************************************/


SELECT 
	   DISTINCT([Products].[ProductName])
		,[Categories].[CategoryDescription]
		,[Order_Details].[QuotedPrice]
	from [Order_Details]
	INNER JOIN Products ON [Products].[ProductNumber] = [Order_Details].[ProductNumber]
	INNER JOIN Categories ON Categories.CategoryID = products.CategoryID
	Order by ProductName
GO



	SELECT TOP (1000) [OrderNumber]
      ,[ProductNumber]
      ,[QuotedPrice]
      ,[QuantityOrdered]
  FROM [SalesOrders].[dbo].[Order_Details]

/****************************************************************************
************************   Task Five   ************************
*****************************************************************************
****************************************************************************/

SELECT [VendName]
      ,[VendZipCode]   
  FROM [Vendors]
  ORDER BY [VendZipCode]
GO

/****************************************************************************
************************   Task Six   ************************
*****************************************************************************
****************************************************************************/

SELECT [EmpFirstName]
      ,[EmpLastName]
	  ,[EmployeeID]
      ,[EmpPhoneNumber]
  FROM [Employees]
  ORDER BY [EmpFirstName],[EmpLastName]
GO

/****************************************************************************
************************   Task Seven   ************************
*****************************************************************************
****************************************************************************/

SELECT [VendName]
  FROM [Vendors]
GO

/****************************************************************************
************************   Task Eight   ************************
*****************************************************************************
****************************************************************************/

SELECT DISTINCT([CustState])
	FROM [Customers]
GO

/****************************************************************************
************************   Task Nine   ************************
*****************************************************************************
****************************************************************************/

SELECT [ProductName]
      ,[RetailPrice]
  FROM [Products]
GO

/****************************************************************************
************************   Task Ten   ************************
*****************************************************************************
****************************************************************************/


SELECT [EmpFirstName]
      ,[EmpLastName] 
      ,[EmpStreetAddress]
      ,[EmpCity]
      ,[EmpState]
      ,[EmpZipCode]
      ,[EmpAreaCode]
      ,[EmpPhoneNumber]
      ,OrderCount = (SELECT COUNT ([Orders].[OrderNumber]) FROM [Orders] WHERE [Orders].[EmployeeID] = [Employees].[EmployeeID])
FROM [Employees] 
GO

/****************************************************************************
************************   Task Eleven   ************************
*****************************************************************************
****************************************************************************/

SELECT 
      [VendCity]
      ,[VendName]
  FROM [Vendors]
  ORDER BY [VendCity]
GO

/****************************************************************************
************************   Task Twelve   ************************
*****************************************************************************
****************************************************************************/

SELECT 
	   Max([Product_Vendors].[DaysToDeliver]) AS Max_day_to_deviever_per_product
	FROM [Orders]
	INNER JOIN [Order_Details] ON [Orders].[OrderNumber] = [Order_Details].[OrderNumber]
	INNER JOIN [Products] ON [Order_Details].[ProductNumber] = [Products].[ProductNumber]
	INNER JOIN [Product_Vendors] ON [Products].[ProductNumber] = [Product_Vendors].[ProductNumber]
	GROUP BY Orders.OrderNumber
GO

/****************************************************************************
************************   Task Thirteen   ************************
*****************************************************************************
****************************************************************************/

SELECT [ProductName]
      ,[RetailPrice]*[QuantityOnHand] as value_of_stock
  FROM [Products]
GO

/****************************************************************************
************************   Task Fourteen   ************************
*****************************************************************************
****************************************************************************/
SELECT [OrderNumber]
	  ,DATEDIFF(DAY, [OrderDate],[ShipDate]) AS days_between_shipment_and_order
	  FROM [Orders]
GO
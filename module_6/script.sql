USE SalesOrders
GO


/****************************************************************************
************************   Task One   ***************************************
*****************************************************************************
****************************************************************************/

--1)	�� ����, ���� �� �������� ���� ������� �������� �� 5%?

SELECT [ProductNumber]
      ,[ProductName]
	  ,CAST([RetailPrice] - (([RetailPrice] / 100) * 5) AS decimal(10,2)) AS reduced_price
  FROM [Products]
GO

/****************************************************************************
************************   Task Two   ***************************************
*****************************************************************************
****************************************************************************/

--2)	�������� ����������, �������� ������ �볺���� � ������� ��������� ����.

SELECT  [OrderNumber]
      ,[OrderDate]
      ,[ShipDate]
      ,[CustomerID]
      ,[EmployeeID]
  FROM [Orders]
  ORDER BY CustomerID, OrderDate DESC
GO




/****************************************************************************
************************   Task Three   ***************************************
*****************************************************************************
****************************************************************************/

--3)	�������� �볺��� � ����������� ���� ����� ������� �����  
SELECT 
	   Distinct [Employees].[EmpFirstName]
      ,[Employees].[EmpLastName]
	  ,[Customers].[CustFirstName]
	  ,[Customers].[CustLastName]

  FROM [Employees]
  INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
  INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
  WHERE [Employees].[EmpFirstName] = [Customers].[CustFirstName]
GO




/****************************************************************************
************************   Task Four   ***************************************
*****************************************************************************
****************************************************************************/


--4)	�������� �볺��� ���� �������� ���������� � ����� �������� ������ 


SELECT 
     [Customers].[CustFirstName]
      ,[Customers].[CustLastName]

	  FROM [Customers]
INNER JOIN Orders ON [Customers].[CustomerID] = [Orders].[CustomerID]
INNER JOIN Order_Details ON [Order_Details].[OrderNumber] = [Orders].[OrderNumber]
INNER JOIN Products ON [Products].[ProductNumber] = [Order_Details].[ProductNumber]
WHERE [Products].CategoryID IN (SELECT CategoryID FROM Categories WHERE CategoryID = 2) 

INTERSECT

SELECT
    [Customers].[CustFirstName]
      ,[Customers].[CustLastName]
	  FROM [Customers]
INNER JOIN Orders ON [Customers].[CustomerID] = [Orders].[CustomerID]
INNER JOIN Order_Details ON [Order_Details].[OrderNumber] = [Orders].[OrderNumber]
INNER JOIN Products ON [Products].[ProductNumber] = [Order_Details].[ProductNumber]
WHERE Products.ProductName in (SELECT [ProductName] FROM [Products] WHERE ProductName LIKE '%Helmet%')

GO




/****************************************************************************
************************   Task FIVE   ***************************************
*****************************************************************************
****************************************************************************/

--5)	�������� ���������� � ������, ���� ���� ��� �����������

SELECT 
       [Vendors].[VendName]
	   ,[Products].[ProductName]
  FROM [Vendors]
  INNER JOIN Product_Vendors ON Product_Vendors.VendorID = Vendors.VendorID
  INNER JOIN Products ON Products.ProductNumber = Product_Vendors.ProductNumber
  ORDER BY [Vendors].[VendName] 
GO


/****************************************************************************
************************   Task Six   ***************************************
*****************************************************************************
****************************************************************************/

--6)	������ ������ ����������� � �볺���, ��� ������ ���� ������������ ����������

SELECT  
		[EmpLastName]
		,[EmpFirstName]
		,[Orders].[OrderNumber]
		,[Customers].[CustFirstName]
		,[CustLastName]
  FROM [Employees]
  INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
  INNER JOIN  Customers ON Orders.CustomerID = Customers.CustomerID
  ORDER BY [EmpLastName],[EmpFirstName]
GO




/****************************************************************************
************************   Task Seven   ***************************************
*****************************************************************************
****************************************************************************/

--7)	�� ������ ����� �� �����������?

INSERT INTO Products
  VALUES (41, 'Bike Specialized S-Works', NULL, 1504.99, 
   2, 2)

SELECT 
      [ProductName]
  FROM [Products]
  WHERE ProductNumber NOT IN (Select ProductNumber From Order_Details)

GO


/****************************************************************************
************************   Task Eight   ***************************************
*****************************************************************************
****************************************************************************/

--8)	�������� �볺��� ���� ����� �� ��������� �����

INSERT INTO Customers
  VALUES (1028, 'Taras', 'Shevchenko', '47 1th Ave SE', 
   'NY', 'NY', '97567', 501, '555-344')


SELECT 
	  [Customers].[CustFirstName]
      ,[Customers].[CustLastName] 

  FROM [Customers]

EXCEPT 

SELECT 
	  [CustFirstName]
      ,[CustLastName] 
  FROM [Customers]
  INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
  INNER JOIN Order_Details ON Orders.OrderNumber = Order_Details.OrderNumber
  INNER JOIN Products ON Order_Details.ProductNumber = Products.ProductNumber
  WHERE products.ProductNumber IN (SELECT ProductNumber FROM Products WHERE productname LIKE '%Helmet%')

GO


/****************************************************************************
************************   Task Nine   ***************************************
*****************************************************************************
****************************************************************************/

--9)	�������� ������ ��� ������ � ���� ��� ���������

SELECT 
      [Products].[ProductName]
	  ,[Order_Details].[OrderNumber]
	  ,[Orders].[OrderDate]
  FROM [Products]
  INNER JOIN Order_Details ON Products.ProductNumber = Order_Details.ProductNumber
  INNER JOIN Orders ON Orders.OrderNumber = Order_Details.OrderNumber
  ORDER BY [Products].[ProductName]
GO


/****************************************************************************
************************   Task Ten   ***************************************
*****************************************************************************
****************************************************************************/

--10)	������� ������ ������ ���� � ����� ����������, ������������� �� ������.

SELECT [VendorID]
      ,[VendName]
      ,[VendStreetAddress]
      ,[VendCity]
      ,[VendState]
      ,[VendZipCode]
     
  FROM [Vendors]
  ORDER BY [VendName]
GO




/****************************************************************************
************************   Task Eleven   ***************************************
*****************************************************************************
****************************************************************************/

--11)	�� � � ��� ����������, ��� ���� ��������� ���� �������� ���������� ����� ���� ����������?

INSERT INTO Orders
  VALUES (945, '1999-12-28', '1998-12-31', 1020, 702)
GO

SELECT  [OrderNumber]
  FROM [Orders]
  WHERE DATEDIFF (day, [ShipDate],[OrderDate]) > 0

GO

/****************************************************************************
************************   Task Twelve   ***************************************
*****************************************************************************
****************************************************************************/


--12)	�������� ������ ������, �������� ���� ���� 50 ������ � �����.

SELECT [Products].[ProductNumber]
      ,[ProductName]
      ,[RetailPrice]
  FROM [Products]
  INNER JOIN Product_Vendors ON Products.ProductNumber = Product_Vendors.ProductNumber
  WHERE [WholesalePrice] <= 50
GO

/****************************************************************************
************************   Task Thirteen   ***************************************
*****************************************************************************
****************************************************************************/
--13)	������ ������ �볺���, � ������ ������� ����������� � �Mar�

INSERT INTO Customers
  VALUES (1029, 'Ryan', 'Maryan', '4433 East Palm Ave', 
   'Dallas', 'TX', '71284', 210, '555-2111')

SELECT [CustomerID]
      ,[CustFirstName]
      ,[CustLastName]
  FROM [Customers]
  WHERE [CustLastName] LIKE 'Mar%'
GO


/****************************************************************************
************************   Task Fourteen   ***************************************
*****************************************************************************
****************************************************************************/

--14)	�������� ������ ����������, � ���� ������ ���� ������� ����� �Forest�.

INSERT INTO Vendors
  VALUES (11, 'Pixel LTD', '12311 Forest Str.', 
   'La', 'CA', '45646', '(211) 444-92226', '(214) 555-2222', 
   '#http://www.pixel.com#', 'BikeProducts@pixel.com')

SELECT [VendorID]
      ,[VendName]
      ,[VendStreetAddress]
      ,[VendCity]
      ,[VendState]
      ,[VendZipCode]
      ,[VendPhoneNumber]
      ,[VendFaxNumber]
      ,[VendWebPage]
      ,[VendEMailAddress]
  FROM [Vendors]
  WHERE [VendStreetAddress] LIKE '%Forest%'
GO

/****************************************************************************
************************   Task Fifteen   ***************************************
*****************************************************************************
****************************************************************************/

--15)	�������� ������ ��� ��������� ���������, �� ����������� ���, �� �������� � ����. 

SELECT [OrderNumber]
      ,[OrderDate]
      ,[ShipDate]
      ,[CustomerID]
      ,[EmployeeID]
  FROM [Orders]
  WHERE MONTH([OrderDate]) != 7
GO

/****************************************************************************
************************   Task Sixteen   ***************************************
*****************************************************************************
****************************************************************************/
--16)	�������� ������� � ��� �볺��� �� ���������� � Redmond � ������� ���� ���������� � P 

SELECT 
      [CustFirstName]
      ,[CustLastName]
 
  FROM [Customers]
  WHERE CustCity = 'Redmond' AND CustLastName LIKE 'P%'
GO

/****************************************************************************
************************   Task Seventeen   ***************************************
*****************************************************************************
****************************************************************************/
--17)	�������� �볺��� � ����������, �� ����� ������� ����� 

SELECT  DISTINCT ([Customers].[CustomerID])
      ,[Customers].[CustFirstName]
      ,[Customers].[CustLastName]   
	  ,[Employees].[EmployeeID]
	  ,[Employees].[EmpFirstName]
	  ,[Employees].[EmpLastName]
  FROM [Customers]
  INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
  INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
  WHERE [Customers].[CustFirstName] = [Employees].[EmpFirstName]
  ORDER BY [Customers].[CustFirstName]
GO



/****************************************************************************
************************   Task Eighteen   ***************************************
*****************************************************************************
****************************************************************************/

--18)	�������� �볺��� ����� ������ �� ���������� � ������� ����������

SELECT 
      [Customers].[CustFirstName]
      ,[Customers].[CustLastName]   
  FROM [Customers]

EXCEPT

SELECT 
      [Customers].[CustFirstName]
      ,[Customers].[CustLastName]   
  FROM [Customers]
  INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
  INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
  WHERE [Customers].[CustFirstName] = [Employees].[EmpFirstName]
  ORDER BY [Customers].[CustFirstName]
GO

/****************************************************************************
************************   Task Nineteen   ***************************************
*****************************************************************************
****************************************************************************/
--19)	������ ��� �볺��� �� �������� ��������� � �� �������� �����
INSERT INTO Order_Details
  VALUES (946, 41, 180, 2)


INSERT INTO Orders
  VALUES (946, '1999-12-28', '1999-12-31', 1029, 702)

SELECT 
	 [Customers].[CustomerID]
      ,[CustFirstName]
      ,[CustLastName]
  FROM [Customers]
  INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
  INNER JOIN Order_Details ON Orders.OrderNumber = Order_Details.OrderNumber
  INNER JOIN Products ON Order_Details.ProductNumber = Products.ProductNumber
  WHERE CategoryID = 2


EXCEPT

SELECT 
	 [Customers].[CustomerID]
      ,[CustFirstName]
      ,[CustLastName]
  FROM [Customers]
  INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
  INNER JOIN Order_Details ON Orders.OrderNumber = Order_Details.OrderNumber
  INNER JOIN Products ON Order_Details.ProductNumber = Products.ProductNumber
  WHERE ProductName LIKE '%Helmet%'

GO




/****************************************************************************
************************   Task Twenty   ***************************************
*****************************************************************************
****************************************************************************/

--20)	�������� �볺��� ���� �� ���������� � ����� �� � ���� � ���� ����������

SELECT 
      [CustFirstName]
      ,[CustLastName]
  FROM [Customers]
  WHERE CustCity NOT IN (Select EmpCity From Employees)
GO



/****************************************************************************
************************   Task Twenty ONE  ***************************************
*****************************************************************************
****************************************************************************/

--21)	�������� �볺��� � ����������� � ���������� �������


SELECT 
	   Distinct [Employees].[EmpFirstName]
      ,[Employees].[EmpLastName]
	  ,[Customers].[CustFirstName]
	  ,[Customers].[CustLastName]

  FROM [Employees]
  INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
  INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
  WHERE [Employees].[EmpFirstName] = [Customers].[CustFirstName]
GO



/****************************************************************************
************************   Task Twenty Two  ***************************************
*****************************************************************************
****************************************************************************/

--22)	�������� �볺��� � ����������� ���� ���������� � ������ ���

SELECT 
	   Distinct [Employees].[EmpFirstName]
      ,[Employees].[EmpLastName]
	  ,[Customers].[CustFirstName]
	  ,[Customers].[CustLastName]
	  ,[Employees].[EmpCity]
	  ,[Customers].[CustCity]

  FROM [Employees]
  INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
  INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
  WHERE [Employees].[EmpCity] = [Customers].[CustCity]
GO


/****************************************************************************
************************   Task Twenty Three  ***************************************
*****************************************************************************
****************************************************************************/

--23)	������ ��� �볺��� ���� �������� ��������� � ��� ���� �������� �����

SELECT 
     [Customers].[CustFirstName]
      ,[Customers].[CustLastName]

	  FROM [Customers]
INNER JOIN Orders ON [Customers].[CustomerID] = [Orders].[CustomerID]
INNER JOIN Order_Details ON [Order_Details].[OrderNumber] = [Orders].[OrderNumber]
INNER JOIN Products ON [Products].[ProductNumber] = [Order_Details].[ProductNumber]
WHERE [Products].CategoryID IN (SELECT CategoryID FROM Categories WHERE CategoryID = 2) 

INTERSECT

SELECT
    [Customers].[CustFirstName]
      ,[Customers].[CustLastName]
	  FROM [Customers]
INNER JOIN Orders ON [Customers].[CustomerID] = [Orders].[CustomerID]
INNER JOIN Order_Details ON [Order_Details].[OrderNumber] = [Orders].[OrderNumber]
INNER JOIN Products ON [Products].[ProductNumber] = [Order_Details].[ProductNumber]
WHERE Products.ProductName in (SELECT [ProductName] FROM [Products] WHERE ProductName LIKE '%Helmet%')

GO

/****************************************************************************
************************   Task Twenty Four  ********************************
*****************************************************************************
****************************************************************************/

--24)	�������� �� ������ � �� �������

SELECT  [ProductNumber]
      ,[ProductName]
	  ,[CategoryDescription]
  FROM [Products]
  INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID
GO





/****************************************************************************
************************   Task Twenty Five  ********************************
*****************************************************************************
****************************************************************************/

--25)	������ ��� �볺��� ���� ���� ������ ��������� �����

SELECT 
	  Distinct([CustFirstName])
      ,[CustLastName] 
  FROM [Customers]
  INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
  INNER JOIN Order_Details ON Orders.OrderNumber = Order_Details.OrderNumber
  INNER JOIN Products ON Order_Details.ProductNumber = Products.ProductNumber
  WHERE products.ProductNumber IN (SELECT ProductNumber FROM Products WHERE productname LIKE '%Helmet%')

GO

/****************************************************************************
************************   Task Twenty Six  ********************************
*****************************************************************************
****************************************************************************/

--26)	�������� ������ ��� ������ � ���� ��� ���������


SELECT 
      [ProductName]
	  ,[Orders].OrderDate
  FROM [Products]
  INNER JOIN Order_Details ON Products.ProductNumber = Order_Details.ProductNumber
  INNER JOIN Orders ON Order_Details.OrderNumber = Orders.OrderNumber
  GO

/****************************************************************************
************************   Task Twenty Seven  ********************************
*****************************************************************************
****************************************************************************/

--27)	�������� ��� �볺��� � �� ���������� �� ����������

SELECT [Customers].[CustomerID]
      ,[CustFirstName]
      ,[CustLastName]
	  ,[Orders].[OrderNumber]
	  ,[ProductName]
  FROM [Customers]
  INNER JOIN Orders ON Customers.CustomerID = Orders.[CustomerID]
  INNER JOIN Order_Details ON Orders.OrderNumber = Order_Details.OrderNumber
  INNER JOIN Products ON Order_Details.ProductNumber = Products.ProductNumber
  WHERE Products.CategoryId = 2
GO







/****************************************************************************
************************   Task Twenty Eight  ********************************
*****************************************************************************
****************************************************************************/

--28)	������� ��� �볺���, ���� �� ����� �������� ������������ (�����������) � ��������� �������� �����

SELECT 
      [Customers].[CustFirstName]
      ,[Customers].[CustLastName]   
  FROM [Customers]

Except

SELECT 
      [Customers].[CustFirstName]
      ,[Customers].[CustLastName]   
  FROM [Customers]
  INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
  INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
  WHERE [Customers].[CustZipCode] = [Employees].[EmpZipCode]
  ORDER BY [Customers].[CustFirstName]
GO


SELECT 
      [Customers].[CustFirstName]
      ,[Customers].[CustLastName]   
  FROM [Customers]

Except

SELECT 
      [Customers].[CustFirstName]
      ,[Customers].[CustLastName]   
  FROM [Customers]
  INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
  INNER JOIN Order_Details ON Orders.OrderNumber = Order_Details.OrderNumber
  INNER JOIN Products ON Order_Details.ProductNumber = Products.ProductNumber
  INNER JOIN Product_Vendors ON Products.ProductNumber = Product_Vendors.ProductNumber
  INNER JOIN Vendors on Product_Vendors.VendorID = Vendors.VendorID 
  WHERE [Customers].[CustZipCode] = [Vendors].[VendZipCode]
  ORDER BY [Customers].[CustFirstName]
GO


/****************************************************************************
************************   Task Twenty Nine  ********************************
*****************************************************************************
****************************************************************************/

--29)	�������� ����� � ������ ��� �����������

SELECT [EmployeeID]
      ,[EmpFirstName]
      ,[EmpLastName]
      ,[EmpStreetAddress]
      ,[EmpCity]
      ,[EmpState]
      ,[EmpZipCode]
      ,[EmpAreaCode]
      ,[EmpPhoneNumber]
  FROM [Employees]

GO


/****************************************************************************
************************   Task Thirty  ********************************
*****************************************************************************
****************************************************************************/

--30)	������� ������ ��� �볺��� �� �������� ��������� � �볺���, �� �������� �����

SELECT 
      [CustFirstName]
      ,[CustLastName]

  FROM [Customers]
  INNER JOIN Orders ON Customers.CustomerID = Orders.[CustomerID]
  INNER JOIN Order_Details ON Orders.OrderNumber = Order_Details.OrderNumber
  INNER JOIN Products ON Order_Details.ProductNumber = Products.ProductNumber
  WHERE Products.CategoryId = 2

UNION



SELECT 
	  Distinct([CustFirstName])
      ,[CustLastName] 
  FROM [Customers]
  INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
  INNER JOIN Order_Details ON Orders.OrderNumber = Order_Details.OrderNumber
  INNER JOIN Products ON Order_Details.ProductNumber = Products.ProductNumber
  WHERE products.ProductNumber IN (SELECT ProductNumber FROM Products WHERE productname LIKE '%Helmet%')


GO



/****************************************************************************
************************   Task Thirty ONE  ********************************
*****************************************************************************
****************************************************************************/

--31)	�������� ����������, ���� ������ �� ���������,  ��� � �����


SELECT [Orders].[OrderNumber]
 
  FROM [Orders]
  INNER JOIN Order_Details ON Orders.OrderNumber = Order_Details.OrderNumber
  INNER JOIN Products ON Order_Details.ProductNumber = Products.ProductNumber
  WHERE Products.CategoryID = 2 

INTERSECT

SELECT [Orders].[OrderNumber]
 
  FROM [Orders]
  INNER JOIN Order_Details ON Orders.OrderNumber = Order_Details.OrderNumber
  INNER JOIN Products ON Order_Details.ProductNumber = Products.ProductNumber
  WHERE Productname LIKE '%Helmet%'
GO





/****************************************************************************
************************   Task Thirty Two  ********************************
*****************************************************************************
****************************************************************************/

--32)	�������� ������ �볺��� � ���� ��������� ���� ��������� � ������� ��������� ���.

SELECT  
      [CustFirstName]
      ,[CustLastName]
	  ,[OrderNumber]
  FROM [Customers]
  INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
  ORDER BY OrderDate
GO




/****************************************************************************
************************   Task Thirty Three  ********************************
*****************************************************************************
****************************************************************************/

--33)	�������� ������ ����������� � �볺��� ��� ����������� ������������ ����������

SELECT  
		[EmpLastName]
		,[EmpFirstName]
		,[Orders].[OrderNumber]
		,[Customers].[CustFirstName]
		,[CustLastName]
  FROM [Employees]
  INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
  INNER JOIN  Customers ON Orders.CustomerID = Customers.CustomerID
  ORDER BY [EmpLastName],[EmpFirstName]
GO


/****************************************************************************
************************   Task Thirty Four  ********************************
*****************************************************************************
****************************************************************************/


--34)	������� �� ����� �� ����������, ������ � ������� ��������� � ����, ����� ������� 
--��������� �� ������ �����, ������������ �� ��� ����������

SELECT  [Orders].[OrderNumber]
		,[Products].[ProductName]
		,[Products].[RetailPrice]
  FROM [Orders]
  INNER JOIN Order_Details ON Order_Details.OrderNumber = Orders.OrderNumber
  INNER JOIN Products ON Products.ProductNumber = Order_Details.ProductNumber
  ORDER BY OrderDate
GO



/****************************************************************************
************************   Task Thirty Five  ********************************
*****************************************************************************
****************************************************************************/

--35)	�������� ���������� � ������ ���� ���� ��� ���������� ������� ����� 100 ������

SELECT [Vendors].[VendorID]
      ,[VendName]
	  ,[Products].[ProductName]
	  ,[Products].[RetailPrice]
  FROM [Vendors]
  INNER JOIN Product_Vendors ON Vendors.VendorID = Product_Vendors.VendorID
  INNER JOIN Products ON Product_Vendors.ProductNumber = Products.ProductNumber
  WHERE RetailPrice < 100
  ORDER BY VendorID
GO


/****************************************************************************
************************   Task Thirty Six  ********************************
*****************************************************************************
****************************************************************************/

--36)	�������� �볺��� � ����������� � ���������� �������


SELECT 
	   Distinct [Employees].[EmpFirstName]
      ,[Employees].[EmpLastName]
	  ,[Customers].[CustFirstName]
	  ,[Customers].[CustLastName]

  FROM [Employees]
  INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
  INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
  WHERE [Employees].[EmpFirstName] = [Customers].[CustFirstName]
GO

/****************************************************************************
************************   Task Thirty Seven  ********************************
*****************************************************************************
****************************************************************************/
--37)	�������� �볺��� � ����������� �� ���������� � ��������� �����.

SELECT 
	   Distinct [Employees].[EmpFirstName]
      ,[Employees].[EmpLastName]
	  ,[Customers].[CustFirstName]
	  ,[Customers].[CustLastName]
	  ,[Employees].[EmpCity]
	  ,[Customers].[CustCity]

  FROM [Employees]
  INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID
  INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
  WHERE [Employees].[EmpCity] = [Customers].[CustCity]
GO






/****************************************************************************
************************   Task Thirty Eight  ********************************
*****************************************************************************
****************************************************************************/

--38)	�������� ������ ���� � �������� ���������� �� ����������� � ������ ��������� �� ��������.

SELECT  [VendorID]
      ,[VendName]
      ,[VendPhoneNumber]
      ,[VendFaxNumber]
  FROM [Vendors]
  WHERE VendState = 'CA' OR VendState = 'WA'
GO


/****************************************************************************
************************   Task Thirty Nine  ********************************
*****************************************************************************
****************************************************************************/

--39)	�������� �� ���������� �볺��� 1001

SELECT  [OrderNumber]
 
  FROM [Orders]
  WHERE CustomerID = 1001
GO




/****************************************************************************
************************   Task Fourty  ********************************
*****************************************************************************
****************************************************************************/

--40)	�������� ������ ������ � �������, �� ����������� � �Dog� � ���������� �������

SELECT  [ProductNumber]
      ,[ProductName]
     
  FROM [Products]
  WHERE ProductName LIKE 'Dog%'
  ORDER BY ProductName
GO


/****************************************************************************
************************   Task Fourty One ********************************
*****************************************************************************
****************************************************************************/

--41)	�������� ������������ �� ����������� � ��������� ����� Ballard, Bellevue, Redmond.

SELECT
	  [VendorID]
      ,[VendName]
    
  FROM [Vendors]
  WHERE VendCity IN ('Ballard', 'Bellevue', 'Redmond')
GO

/****************************************************************************
************************   Task Fourty Two ********************************
*****************************************************************************
****************************************************************************/

--42)	������ ������ ������ � ��������� ����� 125 ������ � ����� � ���������� ������ .

SELECT [Products].[ProductNumber]
      ,[ProductName]
      ,[WholesalePrice]
  FROM [Products]
  INNER JOIN Product_Vendors ON Products.ProductNumber = Product_Vendors.ProductNumber
  WHERE [WholesalePrice] >= 125
  ORDER BY ProductName
GO

/****************************************************************************
************************   Task Fourty THREE ********************************
*****************************************************************************
****************************************************************************/
--43)	��� � ����������, � ����� �� ��������, �� �� ��� �����.


SELECT [VendorID]
      ,[VendName]
      ,[VendStreetAddress]
      ,[VendCity]
      ,[VendState]
      ,[VendZipCode]
      ,[VendPhoneNumber]
      ,[VendFaxNumber]
      ,[VendWebPage]
      ,[VendEMailAddress]
  FROM [Vendors]
  WHERE [VendWebPage] IS NULL
GO
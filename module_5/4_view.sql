USE education_task_nk
GO

/****************************************************************************
************************   Task One   ************************
*****************************************************************************
****************************************************************************/

--1.	створити представлення в якому можна було б побачити тільки деталі з Лондона


CREATE VIEW det_from_london
AS
SELECT [detailid]
      ,[name]
      ,[color]
      ,[weight]
      ,[city]
  FROM [details]
  WHERE [city] = 'London'
GO

SELECT * FROM det_from_london
GO

/****************************************************************************
************************   Task Two   ************************
*****************************************************************************
****************************************************************************/


--2.	створити представлення в якому можна побачити вироби усіх міст, крім Риму з кількістю в поставці більшу за середню. (назва, кількість)


CREATE VIEW products_not_from_rome
AS

SELECT [products].[name]
	  ,sum (quantity) AS sum_of_supply_quantity
  FROM [products]
  INNER JOIN [supplies] ON [products].[productid] = [supplies].[productid] 
  WHERE city != 'Roma' and supplies.quantity > (SELECT avg (quantity) FROM [supplies])
  GROUP BY [products].[name]
GO


SELECT * FROM products_not_from_rome
GO


/****************************************************************************
************************   Task Three   *************************************
*****************************************************************************
****************************************************************************/

--3.	показати всі поставки з деталями з Лондона, використовуючи в запиті представлення з першого прикладу

SELECT * FROM det_from_london
GO


/****************************************************************************
************************   Task Four  **************************************
*****************************************************************************
****************************************************************************/

--4.	створити представлення, в якому мають бути всі назви, занесені в базу даних.


CREATE VIEW all_names
AS
	SELECT
		[products].[name] AS Pr_name
		,[details].[name] AS DT_name
		,[categories].[name] AS cat_name
		,[suppliers].[name] AS supp_name
	FROM [products]
	INNER JOIN [categories] ON [categories].[id] = [products].[categoryid]
	INNER JOIN [supplies] ON [products].[productid] = [supplies].[supplierid]
	INNER JOIN [details] ON [supplies].detailid = [details].[detailid]
	INNER JOIN [suppliers] ON [supplies].[supplierid] = suppliers.supplierid
	
GO 

CREATE VIEW all_names_2
AS
	SELECT NAME FROM products
		UNION
	SELECT NAME FROM details
		UNION
	SELECT NAME FROM suppliers
		UNION
	SELECT NAME FROM categories
GO 

SELECT * FROM all_names
SELECT * FROM all_names_2


/****************************************************************************
************************   Task FIVE  **************************************
*****************************************************************************
****************************************************************************/


--5.	Створити представлення в якому мають бути всі вироби і поставки по них
-- (включаючи ті, по яких поставок нема, без використання OUTER JOIN)



CREATE VIEW all_product
AS
SELECT [products].[productid]
      ,[name]
      ,[city]
	  ,count ([supplies].[productid]) AS number_of_supplies
  FROM [products]
  LEFT JOIN supplies ON products.productid = supplies.productid
  GROUP BY products.productid, name , city
GO 

INSERT INTO Products (productid, name, city, categoryid)
VALUES (8, 'Scanner', 'Paris',4);

SELECT * FROM all_product
GO


/****************************************************************************
************************  ADDITIONAL Task   **************************************
*****************************************************************************
****************************************************************************/


--Задача
--Умови задачі з  JOIN
--Створити два представлення: в одному мають бути підлеглі, в другому - керівники


USE education_task_additional_nk
GO


CREATE VIEW empl
AS
	SELECT name FROM tblEmployee
GO

SELECT * FROM empl
GO

CREATE VIEW bosses
AS
  SELECT
		IsNull(Manager.Name, null) AS boss
	FROM tblEmployee Employee
	left join tblEmployee Manager
	ON Employee.boss = Manager.EmployeeId
GO

SELECT * FROM bosses
GO
USE education_task_nk
GO

/****************************************************************************
************************   Task One   ***************************************
*****************************************************************************
****************************************************************************/
--1.	Отримати номери виробів для котрих деталі повністю поставляє поставщик 3

INSERT INTO Products (productid, name, city, categoryid)
VALUES (8, 'Iphone', 'London',2);
INSERT INTO Supplies ([supplierid],[detailid],[productid],[quantity])
VALUES (3, 4, 8, 500);
INSERT INTO Supplies ([supplierid],[detailid],[productid],[quantity])
VALUES (3, 2, 8, 300);

SELECT 
	DISTINCT (productid)
	FROM supplies
	WHERE supplierid = 3 AND productid not in(SELECT productid FROM supplies WHERE supplierid  != 3 )
GO




/****************************************************************************
************************   Task TWO   ***************************************
*****************************************************************************
****************************************************************************/

--2. Отримати номера і прізвища поставщиків, котрі поставляють деталі для якого-небудь виробу з деталлю 1
-- в кількості більшім, ніж середній об’єм поставок деталі 1 для цього виробу.






SELECT
	supplies.supplierid
	,suppliers.name
	,supplies.quantity
	FROM supplies
	inner join suppliers on supplies.supplierid = suppliers.supplierid
	WHERE detailid = 1 and quantity in (SELECT avg (quantity) FROM supplies where detailid = 1 group by productid )
GO



/****************************************************************************
************************   Task Three   ***************************************
*****************************************************************************
****************************************************************************/

--3.	Отримати повний список деталей для всіх виробів, котрі виготовляються в Лондоні.

SELECT 
	DISTINCT(supplies.productid)
	,detailid
	FROM supplies
	INNER JOIN products ON supplies.productid = products.productid
	WHERE products.city = 'London'
	ORDER BY productid
GO




/****************************************************************************
************************   Task Four   ***************************************
*****************************************************************************
****************************************************************************/

--4.	Показати номери і назви поставщиків, що поставляють по крайній мірі одну червону деталь.

SELECT
	DISTINCT(supplies.supplierid),
	suppliers.name
	FROM supplies
	INNER JOIN suppliers ON supplies.supplierid = suppliers.supplierid
	WHERE supplies.supplierid in (SELECT supplies.supplierid FROM supplies INNER JOIN details ON 
	supplies.detailid = details.detailid WHERE details.color = 'red')
GO





/****************************************************************************
************************   Task FIVE   ***************************************
*****************************************************************************
****************************************************************************/

--5.	Показати номери деталей, котрі використовуються по крайній мірі в одному виробі, котра поставляється поставщиком 2

SELECT
	DISTINCT(supplies.detailid)
	FROM supplies
	WHERE productid in (SELECT productid FROM supplies WHERE supplierid = 2)
GO




/****************************************************************************
************************   Task SIX   ***************************************
*****************************************************************************
****************************************************************************/

--6.	Отримати номери виробів, для котрих середній об’єм поставки деталей 1 більше найбільшого об’єму поставки будь якої деталі для виробу 1.

INSERT INTO Supplies ([supplierid],[detailid],[productid],[quantity])
VALUES (5, 1, 4, 600);

SELECT
	DISTINCT(productid)
	FROM supplies
	WHERE (SELECT AVG(quantity) FROM supplies WHERE detailid = 1) > (SELECT MAX(quantity) from supplies where productid = 1)
GO

/****************************************************************************
************************   Task SEVEN   ***************************************
*****************************************************************************
****************************************************************************/


--7.	Добавити запис в таблицю виробів. Вибрати ті вироби, 
--котрі коли не будь були в поставках (написати два варіанти використовуючи під-запит) 


INSERT INTO Products (productid, name, city, categoryid)
VALUES (10, 'HP PRObook', 'London',3);


SELECT 
	products.productid
	FROM products
	WHERE productid IN (SELECT productid FROM supplies)
GO

SELECT 
	DISTINCT(products.productid)
	FROM products
	INNER JOIN supplies ON products.productid = supplies.productid
GO


/****************************************************************************
************************   Task SEVEN   ***************************************
*****************************************************************************
****************************************************************************/


--8.	Вибрати вироби, що не поставлялися (під-запит)


SELECT 
	products.productid
	FROM products
	WHERE productid NOT IN (SELECT productid FROM supplies)
GO


/****************************************************************************
************************   Task Additional  ***************************************
*****************************************************************************
****************************************************************************/

--Задача
--Переписати спільну задачу з JOIN, використовуючи під-запит.

USE [master]
GO 


-- Checking if db exists
 IF EXISTS(SELECT NAME FROM sys.databases
    WHERE NAME = 'education_task_additional_nk')
    DROP DATABASE [education_task_additional_nk]
 GO


CREATE DATABASE education_task_additional_nk
GO

USE education_task_additional_nk
GO


CREATE TABLE tblEmployee
(
  EmployeeId int PRIMARY kEY,
  Name NVARCHAR(30),
  boss INT
)
ALTER TABLE [tblEmployee]
       ADD CONSTRAINT FK_0
              FOREIGN KEY (boss )
                             REFERENCES [tblEmployee] (EmployeeId )
GO




INSERT INTO [dbo].[tblEmployee] 
(EmployeeId, name, boss)
VALUES
(1, 'JOHN', 2),
(2, 'IREN', 3),
(3, 'PITER', 4),
(4, 'VASIL', NULL)
GO



SELECT
	 Employee.Name AS [Employee Name]
	 ,boss = (SELECT IsNull(Manager.Name, null) AS [Boss Name])
  FROM tblEmployee Employee
  LEFT JOIN tblEmployee Manager
  ON Employee.boss = Manager.EmployeeId
GO

USE education_task_nk
GO

/****************************************************************************
************************   Task One   ***************************************
*****************************************************************************
****************************************************************************/

--������ (������ ����� � ������������� �Ỻ������ ������(UNION, EXCEPT, INTERSECT )
--1.	������� ���������� � ������� ��� ������


SELECT
	supplierid FROM suppliers
	WHERE city = 'London'

	UNION

SELECT
	supplierid FROM suppliers
	WHERE city = 'Paris'

GO





/****************************************************************************
************************   Task Two   ***************************************
*****************************************************************************
****************************************************************************/
--2.	������� ���������� � ����� � ������� (���, ����� � ����)

SELECT
	supplierid
	,name
	,rating as [rating/weight]
	FROM suppliers
	WHERE city = 'London'

	UNION

SELECT 
	detailid
	,name
	,weight 
	FROM details

GO


/****************************************************************************
************************   Task Three   ***************************************
*****************************************************************************
****************************************************************************/

--3.	������� �� ����, �� � ���������� �  (���) ����� (��� ������ � ���� � 
--����������, ������ ���) � ����������� � ���������� ������� (�, b, c, d�)

SELECT city
	FROM suppliers

	UNION ALL

SELECT city
	FROM details
	ORDER BY city



SELECT city
	FROM suppliers

	UNION 

SELECT city
	FROM details
	ORDER BY city

GO

/****************************************************************************
************************   Task Four   ***************************************
*****************************************************************************
****************************************************************************/

--4.	������� ���������� � ������� �������� ���� �������� � ������� �������� 
--� ����������� �� ������� �������� �� ��������. (������������ ���� � �����, �������)

SELECT
	suppliers.name
	,COUNT (supplies.supplierid) AS supplies_quantity
	FROM supplies
	INNER JOIN suppliers ON supplies.supplierid= suppliers.supplierid
	GROUP BY supplies.supplierid,suppliers.name
	
	UNION

SELECT
	products.name
	,COUNT(products.productid)
	FROM supplies

	INNER JOIN products ON supplies.supplierid= products.productid

	GROUP BY products.productid,products.name
	ORDER BY supplies_quantity DESC
	
GO
/****************************************************************************
************************   Task Five  ***************************************
*****************************************************************************
****************************************************************************/

--5.	������� ��� ����������, ��� ��� �� ����������� ����� � ������� 

SELECT
	supplierid
	FROM
	suppliers

	EXCEPT


SELECT
	supplierid
	FROM
	suppliers
	WHERE city = 'London'




/****************************************************************************
************************   Task SIX   ***************************************
*****************************************************************************
****************************************************************************/

--6.	������ ������ �� �������� �������� �� ����������� � ������ �� �����  � �������� ��������, ���� ����������� � ����� �� ���.

SELECT
	productid
	FROM products
	WHERE city = 'Paris' OR city = 'London'

	EXCEPT

SELECT
	productid
	FROM products
	WHERE city = 'Paris' OR city = 'Roma'







/****************************************************************************
************************   Task Seven   ***************************************
*****************************************************************************
****************************************************************************/

--7.	������� ���������� � �������, �������� � ������,  ����� ����� (���, �����, ��� (�������, ���������, ������)

SELECT	
	supplierid AS Id,
	name,
	rating as [rating/category/weight]
	FROM
	suppliers
	WHERE city = 'London'

	UNION

SELECT
	productid,
	name,
	categoryid
	FROM
	products
	WHERE city = 'Paris'

	UNION

SELECT
	detailid,
	name,
	weight
	FROM
	details
	WHERE color = 'green'









/****************************************************************************
************************   Task Eight   ***************************************
*****************************************************************************
****************************************************************************/

--8.	������� ��������, �� ������ ��������� � ������� ���� �������� �������
-- ������� � ����������� ����������� ������ � ������ (��� ����������, ��� �����, ��� ������)


SELECT 
	supplies.supplierid AS ID
	FROM supplies
	INNER JOIN suppliers ON supplies.supplierid = suppliers.supplierid
	WHERE city = 'London'

	UNION


SELECT
	supplies.detailid
	FROM supplies
	INNER JOIN	details ON supplies.detailid = details.detailid
	WHERE color = 'green'

	EXCEPT

SELECT 
	supplies.productid
	FROM supplies
	INNER JOIN products ON supplies.productid = products.productid
	WHERE city = 'Paris'

GO







/****************************************************************************
************************   Task Additional   ***************************************
*****************************************************************************
****************************************************************************/

--������ ������
--��������������� ����� � ������ ������ � JOIN. ��������� ������� ���������� 
--� ����������  (������������ ���� � ���, �����, ��� (1 � ���������, 2 � ���������)


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
	EmployeeId,
	name,
	type = 1
	FROM tblEmployee

	UNION

SELECT
	Manager.EmployeeId,
	IsNull(Manager.Name, null) AS [Boss Name],
	type = 2
	FROM tblEmployee Employee
	LEFT JOIN tblEmployee Manager
	ON Employee.boss = Manager.EmployeeId
GO



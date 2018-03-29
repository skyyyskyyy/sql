USE education_task_nk
GO
 
/****************************************************************************
************************   Task One   ************************
*****************************************************************************
****************************************************************************/

--1.	�������� �� ����� ������ ����������, ����� �����, ����� ������ � ���� ���� ��������� ��� ������� �������� ���    

SELECT 
	  [supplies].[productid]
	  ,[details].[detailid]
	  ,[suppliers].[supplierid]
	  ,[suppliers].[city]
	  ,[details].[city]
	  ,[products].[city]
      
   
FROM [suppliers]
INNER JOIN [supplies] ON [suppliers].[supplierid] = [supplies].[supplierid]
INNER JOIN [details] ON [supplies].[detailid] = [details].[detailid]
INNER JOIN [products] ON [supplies].[productid] = [products].[productid]
WHERE [suppliers].[city] != [details].city AND [suppliers].[city] != [products].city AND [details].city != [products].city
GO


/****************************************************************************
************************   Task Two   ************************
*****************************************************************************
****************************************************************************/

--2.	��� ����� ����� � ����-����� ������ ������� �� �����, ����� ������ � �������� �������� ������� ������� (����� �����, 
--����� �����, ����� ������, ����� ������, ������� ������� ��� ������)

--  We have repetable details - that's because the supliers of this details are different 
-- and as result the detail can be different 
SELECT 
	  [details].[detailid]
	  ,[details].[name]
	  --,[supplies].[supplierid]
	  ,[supplies].[productid]
	  ,[products].[name]
	  ,[supplies].[quantity]

    
   
FROM [supplies]

INNER JOIN [details] ON [supplies].[detailid] = [details].[detailid]
INNER JOIN [products] ON [supplies].[productid] = [products].[productid]
ORDER BY productid
GO


/****************************************************************************
************************   Task Three   ************************
*****************************************************************************
****************************************************************************/

--3.	�������� ������ � ����� �������, ���� ��������� ����-���� ��������� � ������� ��� ��������, ������ �������������� ����� � ������. 
--(� ������������ ������-��� ������� ������ � ����� �������, ����� ���������� � ����� ��������)

SELECT
	[supplies].[detailid]
	,[details].[name]
	,[suppliers].[name]
	,[products].[name]
FROM [supplies]
INNER JOIN [details] ON [supplies].[detailid] = [details].[detailid]
INNER JOIN [suppliers] ON [supplies].[supplierid] = [suppliers].[supplierid]
INNER JOIN [products] ON [supplies].[productid] = [products].[productid]
WHERE [suppliers].[city] = 'London' AND [details].[city] = 'London'
GO

/****************************************************************************
************************   Task Four   ************************
*****************************************************************************
****************************************************************************/

--4.	�������� ������ ������, ��� ������ ����� ������������� �� ������ �� ����� ����������� �� 
--� ���� ������ ����.  (����� ������, ����� ������, ����� ����������, ����� �����)

SELECT
	[supplies].[productid]
	,[products].[name]
	,[suppliers].[name]
	,[details].[name]
FROM [supplies]
INNER JOIN [details] ON [supplies].[detailid] = [details].[detailid]
INNER JOIN [suppliers] ON [supplies].[supplierid] = [suppliers].[supplierid]
INNER JOIN [products] ON [supplies].[productid] = [products].[productid]
WHERE [suppliers].[city] != [details].[city]
ORDER BY [productid]
GO

/****************************************************************************
************************   Task FIVE   ************************
*****************************************************************************
****************************************************************************/

--5.	�������� ������ ���������� � ������� ����������. ������� ��� ���������� � ���� ������� ��������.

--  Inserting data into table Suppliers
INSERT INTO Suppliers (supplierid, name, rating, city) 
VALUES (7, 'Mark',   30,  'Kiyv');



SELECT	
	[suppliers].[supplierid]
    ,([suppliers].[name])
    ,COUNT ([supplies].[supplierid]) AS quantity_of_supplies
  FROM [suppliers]
  LEFT JOIN [supplies] ON [supplies].[supplierid] = [suppliers].[supplierid]
  GROUP BY [suppliers].[supplierid], [suppliers].[name]
  ORDER BY [supplierid]
GO


/****************************************************************************
************************   Task SIX   ************************
*****************************************************************************
****************************************************************************/


--6.	������� ����� ��� ���������� � ���� ������� ��������, ���� ������ ��������.

SELECT	
	[suppliers].[supplierid]
    ,([suppliers].[name])
    ,COUNT ([supplies].[supplierid]) AS quantity_of_supplies
  FROM [suppliers]
  INNER JOIN [supplies] ON [supplies].[supplierid] = [suppliers].[supplierid]
  GROUP BY [suppliers].[supplierid], [suppliers].[name]
  ORDER BY [supplierid]
GO

/****************************************************************************
************************   Task SEVEN   ************************
*****************************************************************************
****************************************************************************/

--7.	������� �� ����� ����������, ����� �������, ����� �������� ��������� �� ����, �� �������� ������ � ��������� �� �.


SELECT 
	[suppliers].[name] AS suplier_name
	,[details].[name] AS detail_name
	,[products].[name] AS product_name
  FROM [suppliers]
  LEFT JOIN [supplies] ON [supplies].[supplierid] = [suppliers].[supplierid]
  FULL JOIN [details] ON [supplies].[detailid] = [details].[detailid]
  FULL JOIN [products] ON [supplies].[productid] = [products].[productid]
  ORDER BY [suppliers].[name]
GO


/****************************************************************************
************************   Task EIGHT   ************************
*****************************************************************************
****************************************************************************/

--8.	������� ����� ����������, ����� �������, ����� �������� ���� �������� ������ � ���������.

SELECT 
	[suppliers].[name] AS suplier_name
	,[details].[name] AS detail_name
	,[products].[name] AS product_name
  FROM [suppliers]
  INNER JOIN [supplies] ON [supplies].[supplierid] = [suppliers].[supplierid]
  INNER JOIN [details] ON [supplies].[detailid] = [details].[detailid]
  INNER JOIN [products] ON [supplies].[productid] = [products].[productid]
  ORDER BY [suppliers].[name]
GO


/****************************************************************************
************************   ADDITIONAL Task   ************************
*****************************************************************************
****************************************************************************/



--������:
--� �������� �������� ���������:  ��� ����������, ������� ����������, ��� ���������� (������� ���� �� ��� ����������).
-- ��������� ������� ������� ���������� � �� ����������.
--Id	name	boss
--1	John	2
--2	Iren	3
--3	Piter	4
--4	Vasil	

--�������� ������� ��� ��������� ���������, ��������� ����� � ��������

--��������� �� ���� ������:
--John	Iren
--Iren	Piter
--Piter	Vasil
--Vasil	NULL



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
	 ,IsNull(Manager.Name, null) AS [Boss Name]
  FROM tblEmployee Employee
  LEFT JOIN tblEmployee Manager
  ON Employee.boss = Manager.EmployeeId
GO



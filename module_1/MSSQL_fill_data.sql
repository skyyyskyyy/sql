--  Inserting data into table Categories
insert into dbo.categories 
(id, name)
values
(1, 'category 1'),
(2, 'category 2'),
(3, 'category 3'),
(4, 'category 4'),
(5, 'category 5');
go

--  Inserting data into table Suppliers
INSERT INTO Suppliers (supplierid, name, rating, city) 
VALUES (1, 'Smith',   20,  'London');
INSERT INTO Suppliers (supplierid, name, rating, city) 
VALUES (2, 'Jonth',   10,  'Paris');
INSERT INTO Suppliers (supplierid, name, rating, city) 
VALUES (3, 'Blacke',  30, 'Paris');
INSERT INTO Suppliers (supplierid, name, rating, city) 
VALUES (4, 'Clarck',  20, 'London');
INSERT INTO Suppliers (supplierid, name, rating, city) 
VALUES (5, 'Adams',   30,  'Athens');
INSERT INTO Suppliers (supplierid, name, rating, city) 
VALUES (6, 'Karl',   30,  'NY');

--  Inserting data into table Details
INSERT INTO Details (detailid, name, color, weight, city) 
VALUES (1, 'Screw',         'Red',     12, 'London');
INSERT INTO Details (detailid, name, color, weight, city) 
VALUES (2, 'Bolt',           'Green', 17, 'Paris');
INSERT INTO Details (detailid, name, color, weight, city) 
VALUES (3, 'Male-screw', 'Blue',   17, 'Roma');
INSERT INTO Details (detailid, name, color, weight, city) 
VALUES (4, 'Male-screw', 'Red',     14, 'London');
INSERT INTO Details (detailid, name, color, weight, city) 
VALUES (5, 'Whell',         'Blue',    12, 'Paris');
INSERT INTO Details (detailid, name, color, weight, city) 
VALUES (6, 'Bloom',         'Red',     19, 'London');


INSERT INTO Details (detailid, name, color, weight, city) 
VALUES (7, 'Bloom',         'Red',     19, 'London');

--  Inserting data into table Products
INSERT INTO Products (productid, name, city, categoryid)
VALUES (1, 'HDD',            'Paris',1);
INSERT INTO Products (productid, name, city, categoryid)
VALUES (2, 'Perforator', 'Roma',2);
INSERT INTO Products (productid, name, city, categoryid)
VALUES (3, 'Reader',       'Athens',3);
INSERT INTO Products (productid, name, city, categoryid)
VALUES (4, 'Printer',     'Athens',4);
INSERT INTO Products (productid, name, city, categoryid)
VALUES (5, 'FDD',            'London',5);
INSERT INTO Products (productid, name, city, categoryid)
VALUES (6, 'Terminal',    'Oslo',1);
INSERT INTO Products (productid, name, city, categoryid)
VALUES (7, 'Ribbon',       'London',2);

--  Inserting data into table Supplies
INSERT INTO Supplies ([supplierid],[detailid],[productid],[quantity])
VALUES (1, 1, 1, 200);
INSERT INTO Supplies ([supplierid],[detailid],[productid],[quantity])
VALUES (1, 1, 4, 700);
INSERT INTO Supplies ([supplierid],[detailid],[productid],[quantity])
VALUES (2, 3, 1, 400);
INSERT INTO Supplies ([supplierid],[detailid],[productid],[quantity])
VALUES (2, 3, 2, 200);
INSERT INTO Supplies ([supplierid],[detailid],[productid],[quantity])
VALUES (2, 3, 3, 200);
INSERT INTO Supplies ([supplierid],[detailid],[productid],[quantity])
VALUES (2, 3, 4, 500);
INSERT INTO Supplies ([supplierid],[detailid],[productid],[quantity])
VALUES (2, 3, 5, 600);
INSERT INTO Supplies ([supplierid],[detailid],[productid],[quantity])
VALUES (2, 3, 6, 400);
INSERT INTO Supplies ([supplierid],[detailid],[productid],[quantity])
VALUES (2, 3, 7, 800);
INSERT INTO Supplies ([supplierid],[detailid],[productid],[quantity])
VALUES (2, 5, 2, 100);
INSERT INTO Supplies ([supplierid],[detailid],[productid],[quantity])
VALUES (3, 3, 1, 200);
INSERT INTO Supplies ([supplierid],[detailid],[productid],[quantity])
VALUES (3, 4, 2, 500);
INSERT INTO Supplies ([supplierid],[detailid],[productid],[quantity])
VALUES (4, 6, 3, 300);
INSERT INTO Supplies ([supplierid],[detailid],[productid],[quantity])
VALUES (4, 6, 7, 300);
INSERT INTO Supplies ([supplierid],[detailid],[productid],[quantity])
VALUES (5, 2, 2, 200);
INSERT INTO Supplies ([supplierid],[detailid],[productid],[quantity])
VALUES (5, 2, 4, 100);
INSERT INTO Supplies ([supplierid],[detailid],[productid],[quantity])
VALUES (5, 5, 5, 500);
INSERT INTO Supplies ([supplierid],[detailid],[productid],[quantity])
VALUES (5, 5, 7, 100);
INSERT INTO Supplies ([supplierid],[detailid],[productid],[quantity])
VALUES (5, 6, 2, 200);
INSERT INTO Supplies ([supplierid],[detailid],[productid],[quantity])
VALUES (5, 1, 4, 100);
INSERT INTO Supplies ([supplierid],[detailid],[productid],[quantity])
VALUES (5, 3, 4, 200);
INSERT INTO Supplies ([supplierid],[detailid],[productid],[quantity])
VALUES (5, 4, 4, 800);



with rs as
(
select *, row_number() over (order by supplierid) rn from supplies
), rs1 as
(
select *, rn % 13  as n from rs
)
update supplies
set operationdate =  '2012'+ 

case when len(cast((case when n= 0 then 12 else n end) as varchar(2))) = 1 then '0' + cast((case when n= 0 then 12 else n end) as varchar(2))
else cast((case when n= 0 then 12 else n end) as varchar(2)) end +'01'
from supplies s
inner join rs1 on s.supplierid = rs1.supplierid and s.detailid = rs1.detailid and s.productid = rs1.productid

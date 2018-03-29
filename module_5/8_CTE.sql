USE education_task_nk
GO

/****************************************************************************
************************   Task One   ***************************************
*****************************************************************************
****************************************************************************/



---	Написати довільний запит з одним СТЕ  ((MS SQL))



WITH Supplycount(Supplierid, TotalSupplies)
AS
(
 SELECT Supplierid, COUNT(*) AS TotalSupplies
 FROM supplies
 GROUP BY Supplierid
)

SELECT name, TotalSupplies
FROM suppliers
join Supplycount
ON Supplycount.supplierid = suppliers.supplierid
ORDER BY TotalSupplies

GO





/****************************************************************************
************************   Task TWO   ***************************************
*****************************************************************************
****************************************************************************/

---	Написати довільний запит з двома СТЕ  (в одному є звертання до іншого) ((MS SQL))


;WITH
london_detail_cte AS
(
SELECT detailid, name, color, weight, city 
FROM details WHERE city = 'London'
),
red_london_detail_cte AS
(
SELECT detailid, name, color, weight, city
FROM london_detail_cte WHERE color in ('red','blue')
)
SELECT detailid, name, color, weight, city
FROM  red_london_detail_cte 

GO



/****************************************************************************
************************   Task Three   ***************************************
*****************************************************************************
****************************************************************************/

---	Створити таблицю та занести в неї дані використовуючи команди з додатку .  

create table [geography]
(id int not null primary key, name varchar(20), region_id int);

ALTER TABLE [geography]
       ADD CONSTRAINT R_GB
              FOREIGN KEY (region_id)
                             REFERENCES [geography]  (id);


insert into [geography] values (1, 'Ukraina', null);
insert into [geography] values (2, 'Lviv', 1);
insert into [geography] values (8, 'Brody', 2);
insert into [geography] values (18, 'Gayi', 8);
insert into [geography] values (9, 'Sambir', 2);
insert into [geography] values (17, 'St.Sambir', 9);
insert into [geography] values (10, 'Striy', 2);
insert into [geography] values (11, 'Drogobych', 2);
insert into [geography] values (15, 'Shidnytsja', 11);
insert into [geography] values (16, 'Truskavets', 11);
insert into [geography] values (12, 'Busk', 2);
insert into [geography] values (13, 'Olesko', 12);
insert into [geography] values (30, 'Lvivska st', 13);
insert into [geography] values (14, 'Verbljany', 12);
insert into [geography] values (3, 'Rivne', 1);
insert into [geography] values (19, 'Dubno', 3);
insert into [geography] values (31, 'Lvivska st', 19);
insert into [geography] values (20, 'Zdolbuniv', 3);
insert into [geography] values (4, 'Ivano-Frankivsk', 1);
insert into [geography] values (21, 'Galych', 4);
insert into [geography] values (32, 'Svobody st', 21);
insert into [geography] values (22, 'Kalush', 4);
insert into [geography] values (23, 'Dolyna', 4);
insert into [geography] values (5, 'Kiyv', 1);
insert into [geography] values (24, 'Boryspil', 5);
insert into [geography] values (25, 'Vasylkiv', 5);
insert into [geography] values (6, 'Sumy', 1);
insert into [geography] values (26, 'Shostka', 6);
insert into [geography] values (27, 'Trostjanets', 6);
insert into [geography] values (7, 'Crimea', 1);
insert into [geography] values (28, 'Yalta', 7);
insert into [geography] values (29, 'Sudack', 7);





/****************************************************************************
************************   Task Four   ***************************************
*****************************************************************************
****************************************************************************/

---	Написати запит (MS SQL) котрий вертає регіони першого рівня (результат нижче, колонки можуть називатися інакше)

--regionID    place_ID    name                 PlaceLevel
------------- ----------- -------------------- -----------
--1           2           Lviv                 1
--1           3           Rivne                1
--1           4           Ivano-Frankivsk      1
--1           5           Kiyv                 1
--1           6           Sumy                 1
--1           7           Crimea               1

;WITH
  regionCTE (regionID, place_ID , name, PlaceLevel)
  AS
  (
    SELECT region_id, id, name, 1
    FROM geography
    WHERE region_id = 1
    
   )

SELECT * FROM regionCTE 
GO




/****************************************************************************
************************   Task FIVE  ***************************************
*****************************************************************************
****************************************************************************/

---	Написати запит (MS SQL)  який вертає дерево для конкретного регіону  (наприклад, Івано-Франківськ) Результат має виглядати наступним чином (колонки можуть називатися інакше)

--regionID    place_ID    name                 PlaceLevel
------------- ----------- -------------------- -----------
--4           21          Galych               0
--4           22          Kalush               0
--4           23          Dolyna               0
--21          32          Svobody st           1


;With
  regionCTE (regionID, place_ID , name, PlaceLevel)
  AS
  (
    SELECT region_id, id, name, 0
    FROM geography
    WHERE region_id = 4
    
   
    
   UNION all
    
    SELECT geography.region_id, geography.id, 
    geography.name, regionCTE.PlaceLevel + 1
    FROM geography
    join regionCTE
    ON geography.region_id = regionCTE.place_ID
  )
SELECT * FROM  regionCTE
GO



/****************************************************************************
************************   Task Six  ***************************************
*****************************************************************************
****************************************************************************/

---	Написати запит котрий вертає повне дерево   і додаткову колонку, котра вказує на рівень в ієрархії


;With
  regionCTE (name, place_ID, regionID, PlaceLevel)
  AS
  (
    SELECT name, id, region_id, 0
    FROM geography
    WHERE region_id IS NULL
    
   
    
   UNION all
    
    SELECT geography.name, geography.id, geography.region_id, 
	 regionCTE.PlaceLevel + 1
    FROM geography
    join regionCTE
    ON geography.region_id = regionCTE.place_ID

  )
SELECT * FROM  regionCTE

GO





/****************************************************************************
************************   Task Seven  ***************************************
*****************************************************************************
****************************************************************************/


---	Написати запит котрий вертає дерево  для регіону Lviv . Результат має виглядати наступним чином (назви колонок можуть не співпадати):

--Name        id        region_id     level
--Lviv		2		1	1
--Brody		8		2	2
--Gayi		18		8	3
--Busk		12		2	2
--Olesko		13		12	3
--Lvivska st	30		13	4
--Verbljany	14		12	3
--Drogobych	11		2	2
--Shidnytsja	15		11	3
--Truskavets	16		11	3
--Sambir		9		2	2
--St.Sambir	17		9	3
--Striy		10		2	2




;With
  regionCTE (name, place_ID, regionID, PlaceLevel)
  AS
  (
    SELECT name, id, region_id, 1
    FROM geography
    WHERE id = 2
    
   
    
   UNION all
    
    SELECT geography.name, geography.id, geography.region_id, 
	 regionCTE.PlaceLevel + 1
    FROM geography
    join regionCTE
    ON geography.region_id = regionCTE.place_ID

  )
SELECT * FROM  regionCTE

GO

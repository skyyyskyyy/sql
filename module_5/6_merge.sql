USE education_task_nk
GO

/****************************************************************************
************************   Task One   ***************************************
*****************************************************************************
****************************************************************************/

--1)	Створити додаткову таблицю tmp_details 
--(структура аналогічна структурі details) Занести дані використовуючи команди з додатку    .


SELECT * INTO tmp_Details FROM details WHERE 1 = 2
GO


INSERT INTO tmp_Details (detailid, name, color, weight, city) 
VALUES (1, 'Screw',         'Blue',     13, 'Osaka');
INSERT INTO tmp_Details (detailid, name, color, weight, city) 
VALUES (2, 'Bolt',           'Pink', 12, 'Tokio');

INSERT INTO tmp_Details (detailid, name, color, weight, city) 
VALUES (18, 'Whell-24', 'Red',   14, 'Lviv');
INSERT INTO tmp_Details (detailid, name, color, weight, city) 
VALUES (19, 'Whell-28', 'Pink',     15, 'London');
GO

SELECT * FROM tmp_Details
GO

/****************************************************************************
************************   Task Two   ***************************************
*****************************************************************************
****************************************************************************/

--2)	Написати команду, котра поміняє дані і занесе в довідник нові.
--Результат має виглядати наступним чином (select * from details) (команду обгорнути транзакціями, завершити транзакцію командою відміни):
--detailid    name                 color                weight      city
------------- -------------------- -------------------- ----------- --------------------
--1           Screw                Blue                 13          Osaka
--2           Bolt                 Pink                 12          Tokio
--3           Male-screw           Blue                 17          Roma
--4           Male-screw           Red                  14          London
--5           Whell                Blue                 12          Paris
--6           Bloom                Red                  19          London
--18          Whell-24             Red                  14          Lviv
--19          Whell-28             Pink                 15          London

BEGIN TRY
    BEGIN TRANSACTION trans_det
     MERGE INTO details WITH (HOLDLOCK) AS target
		USING tmp_details AS source
    ON target.detailid = source.detailid
	WHEN MATCHED THEN 
    UPDATE 
	SET target.city = source.city
	,target.name = source.name
	,target.color = source.color
	,target.weight = source.weight
	WHEN NOT MATCHED BY TARGET THEN
    INSERT (detailid, name, color, weight,city)
		VALUES (source.detailid, source.name, source.color, source.weight, source.city);
	COMMIT
	END TRY
	BEGIN CATCH
			ROLLBACK
	END CATCH
GO


SELECT * FROM details
GO



/****************************************************************************
************************   Task Three  ***************************************
*****************************************************************************
****************************************************************************/


--3)	Написати команду для видалення таблиці tmp_details


DROP TABLE tmp_Details
GO
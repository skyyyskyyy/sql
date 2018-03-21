USE n_kozoriz_library
GO




--Dropping sequence if it exists
IF EXISTS (SELECT * FROM sys.sequences WHERE object_id = OBJECT_ID(N'[lib].[seq_1]'))
DROP SEQUENCE [lib].[seq_1]
GO

CREATE SEQUENCE [lib].[seq_1] 
AS INT
START WITH 1
increment BY 1
GO

--Dropping sequence if it exists
IF EXISTS (SELECT * FROM sys.sequences WHERE object_id = OBJECT_ID(N'[lib].[seq_2]'))
DROP SEQUENCE [lib].[seq_2]
GO

CREATE SEQUENCE [lib].[seq_2] 
AS INT
START WITH 101
increment BY 1
GO


-- if you want to run this sql script twice uncomment this to clear existing data
--DELETE FROM [lib].[books]
--DELETE FROM [lib].[booksAuthors]
--DELETE FROM [lib].[authors]
--DELETE FROM [lib].[Publishers]



--insert into library.authors
SET IDENTITY_INSERT  [lib].[authors] ON


INSERT INTO [lib].[authors]([Author_Id],[Name],[URL]) VALUES(NEXT VALUE FOR [lib].[seq_1],'J. K. Rowling','www.jkrowling.com'),
(NEXT VALUE FOR [lib].[seq_1],'James Patterson','www.jamespatterson.com'),
(NEXT VALUE FOR [lib].[seq_1],'Michael Wolff','www.michaelwolff.com'),
(NEXT VALUE FOR [lib].[seq_1],'Bella Forrest','www.bellaforrest.net'),
(NEXT VALUE FOR [lib].[seq_1],'Stephen King','www.stephenking.com'),
(NEXT VALUE FOR [lib].[seq_1],'Rupi Kaur','rupikaur.com'),
(NEXT VALUE FOR [lib].[seq_1],'Nora Roberts','www.noraroberts.com'),
(NEXT VALUE FOR [lib].[seq_1],'Kendra Elliot','www.kendraelliot.com'),
(NEXT VALUE FOR [lib].[seq_1],'Melinda Leigh','www.melindaleigh.com'),
(NEXT VALUE FOR [lib].[seq_1],'Mark Sullivan','marksullivanbooks.com'),
(NEXT VALUE FOR [lib].[seq_1],'Dean Koontz','www.deankoontz.com'),
(NEXT VALUE FOR [lib].[seq_1],'Ashley Farley','ashleyfarley.net'),
(NEXT VALUE FOR [lib].[seq_1],'Brandon Sanderson','brandonsanderson.com'),
(NEXT VALUE FOR [lib].[seq_1],'Robert Dugoni','www.robertdugonibooks.com'),
(NEXT VALUE FOR [lib].[seq_1],'A. J. Finn','www.instagram.com/ajfinnbooks'),
(NEXT VALUE FOR [lib].[seq_1],'David Baldacci','davidbaldacci.com'),
(NEXT VALUE FOR [lib].[seq_1],'Joy Ellis','www.joyellis.info'),
(NEXT VALUE FOR [lib].[seq_1],'Dav Pilkey','www.pilkey.com'),
(NEXT VALUE FOR [lib].[seq_1],'Pierce Brown','piercebrownbooks.com'),
(NEXT VALUE FOR [lib].[seq_1],'Douglas Preston','www.prestonchild.com');
GO
SET IDENTITY_INSERT  [lib].[authors] OFF

--insert into publishers table
SET IDENTITY_INSERT  [lib].[publishers] ON

INSERT INTO [lib].[Publishers]([Publisher_Id],[Name],[Url]) VALUES(NEXT VALUE FOR [lib].[seq_2],'Pearson','www.pearson.co.uk'),
(NEXT VALUE FOR [lib].[seq_2],'ThomsonReuters','www.thomsonreuters.com'),
(NEXT VALUE FOR [lib].[seq_2],'RELX Group','www.relx.com'),
(NEXT VALUE FOR [lib].[seq_2],'Wolters Kluwer','wolterskluwer.com'),
(NEXT VALUE FOR [lib].[seq_2],'Penguin Random House','www.penguinrandomhouse.com'),
(NEXT VALUE FOR [lib].[seq_2],'Phoenix Publishing and Media Company','en.ppm.cn'),
(NEXT VALUE FOR [lib].[seq_2],'China South Publishing & Media Group Co., Ltd','www.ingigo.com'),
(NEXT VALUE FOR [lib].[seq_2],'Hachette Livre','www.hachette.com'),
(NEXT VALUE FOR [lib].[seq_2],'McGraw-Hill Education','www.mheducation.com'),
(NEXT VALUE FOR [lib].[seq_2],'Holtzbrinck','www.holtzbrinck.com'),
(NEXT VALUE FOR [lib].[seq_2],'Grupo Planeta','www.planeta.es'),
(NEXT VALUE FOR [lib].[seq_2],'Scholastic','www.scholastic.com'),
(NEXT VALUE FOR [lib].[seq_2],'Wiley','wiley.com'),
(NEXT VALUE FOR [lib].[seq_2],'Cengage Learning Holdings II LP','www.cengage.com'),
(NEXT VALUE FOR [lib].[seq_2],'Harper Collins','www.harpercollins.com'),
(NEXT VALUE FOR [lib].[seq_2],'Houghton Mifflin Harcourt','www.hmhco.com'),
(NEXT VALUE FOR [lib].[seq_2],'De Agostini Editore','www.deagostini.com'),
(NEXT VALUE FOR [lib].[seq_2],'Oxford University Press','global.oup.com'),
(NEXT VALUE FOR [lib].[seq_2],'Springer Science and Business Media','www.springer.com'),
(NEXT VALUE FOR [lib].[seq_2],'Informa','informa.com');
GO

SET IDENTITY_INSERT  [lib].[publishers] OFF

--insert into books table

INSERT INTO [lib].[books]([ISBN],[Publisher_id],[url],[price]) VALUES('0545935180',113,'www.amazon.com/dp/0545935180','$6.40'),
('042528591X',108,'www.amazon.com/dp/042528591X',' $16.80'),
('1455536946',114,'www.amazon.com/dp/1455536946','$16.80'),
('1912106434',119,'www.amazon.com/dp/1912106434',' $9.99'),
('1455586609',107,'www.amazon.com/dp/1455586609','$16.44'),
('0062678418',107,'www.amazon.com/dp/0062678418','$16.19'),
('1477825576',107,'www.amazon.com/dp/1477825576',' $8.99'),
('076532637X',113,'www.amazon.com/dp/076532637X','$20.91'),
('0998274135',110,'www.amazon.com/dp/0998274135','$14.99'),
('0345546806',111,'www.amazon.com/dp/0345546806','$16.17'),
('1503943372',108,'www.amazon.com/dp/1503943372','$8.63'),
('1542047862',101,'www.amazon.com/dp/1542047862','$9.17'),
('1503948706',116,'www.amazon.com/dp/1503948706','$6.99'),
('1250122953',107,'www.amazon.com/dp/1250122953','$16.16'),
('1449486797',109,'www.amazon.com/dp/1449486797','$10.19'),
('1501175467',104,'www.amazon.com/dp/1501175467','$12.73'),
('1535197722',120,'www.amazon.com/dp/1535197722','$13.49'),
('1250158060',106,'www.amazon.com/Fire-Fury-Inside-Trump-White/dp/1250158060','$18.00'),
('0316273902',105,'www.amazon.com/People-vs-Alex-Cross/dp/1478923326','$19.76'),
('0545791324',103,'www.amazon.com/Harry-Potter-Chamber-Secrets-Illustrated/dp/0545791324','$27.61');
GO







--insert into booksAuthors table


INSERT INTO [lib].[BooksAuthors]([ISBN],[Author_id],[Seq_No]) VALUES
('0545791324',1,'5459297791'),
('1477825576',14,'7194166752'),
('1455586609',16,'4533430171'),
('1501175467',5,'0072945900'),
('076532637X',13,'9289674211'),
('1455536946',18,'7727860194'),
('042528591X',19,'1151966478'),
('1912106434',17,'2344213190'),
('0062678418',15,'3291460149'),
('1250158060',3,'7062315952'),
('1503948706',8,'8671468190'),
('0545935180',20,'5326738928'),
('1542047862',9,'0473570075'),
('0345546806',11,'4988197846'),
('1535197722',4,'7922124925'),
('1503943372',10,'4259557686'),
('1449486797',6,'5594311721'),
('1250122953',7,'8825729745'),
('0998274135',12,'0870001542'),
('0316273902',2,'6978438874');
GO

/****************************************************************************
************************   CHECKING SCRIPT   ************************
*****************************************************************************
****************************************************************************/

SELECT [Author_Id]
      ,[Name]
      ,[URL]
      ,[inserted]
      ,[inserted_by]
      ,[updated]
      ,[updated_by]
  FROM [lib].[authors]

  SELECT [ISBN]
      ,[Publisher_Id]
      ,[URL]
      ,[Price]
      ,[Inserted]
      ,[Inserted_by]
      ,[updated]
      ,[updated_by]
  FROM [lib].[books]

  SELECT [BooksAuthors_id]
      ,[ISBN]
      ,[Author_Id]
      ,[Seq_No]
      ,[Inserted]
      ,[Inserted_by]
      ,[updated]
      ,[updated_by]
  FROM [lib].[BooksAuthors]

  SELECT [Publisher_Id]
      ,[Name]
      ,[Url]
      ,[Inserted]
      ,[Inserted_by]
      ,[updated]
      ,[updated_by]
  FROM [lib].[Publishers]

  SELECT [Operation_id]
      ,[Author_Id_new]
      ,[URL_new]
      ,[name_new]
      ,[Author_Id_old]
      ,[Name_old]
      ,[URL_old]
      ,[Operation_type]
      ,[Operation_datetime]
  FROM [lib].[Authors_log]
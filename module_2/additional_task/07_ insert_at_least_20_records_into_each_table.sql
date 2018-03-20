USE n_kozoriz_library
GO

-- if you want to run this sql script twice uncomment this to clear existing data

--DELETE FROM [lib].[books]
--DELETE FROM [lib].[booksAuthors]
--DELETE FROM [lib].[authors]
--DELETE FROM [lib].[Publishers]

--DBCC CHECKIDENT ('[lib].[Publishers]', RESEED, 100)
--GO

--DBCC CHECKIDENT ('[lib].[Authors]', RESEED, 0)
--GO


--insert into library.books


INSERT INTO [lib].[authors]([Name],[URL]) VALUES('Gemma Tyson','www.Lycos.com'),
('Craig Tucker','www.Yahoo.com'),
('Vanna James','www.Microsoft.com'),
('Blaze Nicholson','www.Adobe.com'),
('Blake Silva','www.Borland.com'),
('Quinlan Daniel','www.Sibelius.com'),
('Lana Stewart','www.Adobe.com'),
('Kaseem Burton','www.Adobe.com'),
('Edan Madden','www.Macromedia.com'),
('Kiayada Terrell','www.Macromedia.com'),
('Raphael Jefferson','www.Adobe.com'),
('Fritz Scot','www.Finale.com'),
('Chaney Zimerman','www.Google.com'),
('Tomas Daniel','www.Lavasoft.com'),
('Wila Villarreal','www.Google.com'),
('Kyl Fleming','www.Finale.com'),
('Crus Montoya','www.Lavasoft.com'),
('Eleanora Luna','www.Sibelius.com'),
('Meredit Solomon','www.Lavasoft.com'),
('Christina Townsend','www.Microsoft.com');
GO

--insert into publishers table

INSERT INTO [lib].[Publishers]([Name],[Url]) VALUES('Jonah E. Haynes','www.kiwireport.com'),
('Laith C. Giles','www.google.com'),
('Martina S. Robertson','www.immigration.gov.au'),
('Cameran D. Parker','www.nicebooks.com'),
('Coby S. Leonard','www.genmedia.com'),
('Lesley B. Craig','www.immigration.gov.au'),
('Oscar W. Wilcox','www.ingigo.com'),
('Barclay T. Bass','www.fb.com'),
('Jena T. Church','www.space.com'),
('Avram O. Simpson','www.ingigo.com'),
('Kadeem R. Bates','www.genmedia.com'),
('Edward X. Ross','www.immigration.gov.au'),
('Roary F. Hunter','www.immigration.gov.au'),
('Jerome K. Bass','www.genmedia.com'),
('Oren X. Decker','www.primepublishing.com'),
('Sasha P. Buckley','www.space.com'),
('Driscoll W. Lawson','www.fb.com'),
('Jessica K. Dean','www.fb.com'),
('Clinton D. Allison','www.google.com'),
('Adria S. Lynch','www.insular.com');
GO


--insert into books table

INSERT INTO [lib].[books]([ISBN],[Publisher_id],[url],[price]) VALUES('1656040427299',113,'www.GMC.com','$95.08'),
('1620100884399',108,'www.Ferrari.com','$93.12'),
('1645080331499',114,'www.Seat.com','$58.87'),
('1607060960199',119,'www.Volkswagen.com','$2.48'),
('1689021733499',107,'www.GeneralMotors.com','$48.20'),
('1624022633399',107,'www.HyundaiMotors.com','$75.79'),
('1693042310999',107,'www.KiaMotors.com','$56.45'),
('1638121297999',113,'www.Peugeot.com','$90.60'),
('1675010102299',110,'www.Audi.com','$81.14'),
('1647090778999',111,'www.Porsche.com','$97.85'),
('1671111736599',108,'www.MINI.com','$35.55'),
('1654111028099',101,'www.Honda.com','$95.66'),
('1685050264699',116,'www.Daimler.com','$23.04'),
('1681091528399',107,'www.Subaru.com','$57.65'),
('1655012771999',109,'www.Daimler2.com','$75.54'),
('1652060256099',104,'www.JLR.com','$41.04'),
('1651051792499',120,'www.Isuzu.com','$60.70'),
('1620010775599',106,'www.Mazda.com','$68.62'),
('1614060811399',105,'www.Citroën.com','$42.85'),
('1642070342199',103,'www.Mercedes-Benz.com','$73.35');
GO







--insert into booksAuthors table


INSERT INTO [lib].[BooksAuthors]([BooksAuthors_id],[ISBN],[Author_id],[Seq_No]) VALUES
(1,'1642070342199',1,'5459297791'),
(2,'1614060811399',14,'7194166752'),
(3,'1620010775599',16,'4533430171'),
(4,'1651051792499',5,'0072945900'),
(5,'1652060256099',13,'9289674211'),
(6,'1655012771999',18,'7727860194'),
(7,'1681091528399',19,'1151966478'),
(8,'1685050264699',17,'2344213190'),
(9,'1654111028099',15,'3291460149'),
(10,'1671111736599',3,'7062315952'),
(11,'1647090778999',8,'8671468190'),
(12,'1675010102299',20,'5326738928'),
(13,'1638121297999',9,'0473570075'),
(14,'1693042310999',11,'4988197846'),
(15,'1624022633399',4,'7922124925'),
(16,'1607060960199',10,'4259557686'),
(17,'1689021733499',6,'5594311721'),
(18,'1645080331499',7,'8825729745'),
(19,'1620100884399',12,'0870001542'),
(20,'1656040427299',2,'6978438874');
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
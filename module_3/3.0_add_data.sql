USE n_kozoriz_library
GO



-- add 10 publishers - are already in db

SELECT [Publisher_Id]
      ,[Name]
      ,[Url]
      ,[Inserted]
      ,[Inserted_by]
      ,[updated]
      ,[updated_by]
      ,[created]
      ,[country]
      ,[city]
      ,[book_amount]
      ,[issue_amount]
      ,[total_edition]
  FROM [lib].[Publishers]

  -- add 20 authors

SET IDENTITY_INSERT  [lib].[authors] ON


INSERT INTO [lib].[authors]([Author_Id],[Name],[URL],[birthday]) VALUES(NEXT VALUE FOR [lib].[seq_1],'David Baldacci','davidbaldacci.com','19780101'),
(NEXT VALUE FOR [lib].[seq_1],'Joy Ellis','www.joyellis.info','19451212'),
(NEXT VALUE FOR [lib].[seq_1],'Dav Pilkey','www.pilkey.com','19770909'),
(NEXT VALUE FOR [lib].[seq_1],'Pierce Brown','piercebrownbooks.com','19880101'),
(NEXT VALUE FOR [lib].[seq_1],'Douglas Preston','www.prestonchild.com','19671010')

GO
SET IDENTITY_INSERT  [lib].[authors] OFF

-- add 50 books

INSERT INTO [lib].[books]([ISBN],[Publisher_id],[url],[price],[issue]) VALUES('0545935180',113,'www.amazon.com/dp/0545935180','$7.40', 3),
('042528591X',104,'www.amazon.com/dp/042528591X',' $16.80',2),
('1455536946',112,'www.amazon.com/dp/1455536946','$16.80',2),
('1912106434',115,'www.amazon.com/dp/1912106434',' $9.99',2),
('1455586609',101,'www.amazon.com/dp/1455586609','$16.44',2),
('0062678418',107,'www.amazon.com/dp/0062678418','$16.19',2),
('1477825576',101,'www.amazon.com/dp/1477825576',' $8.99',2),
('076532637X',113,'www.amazon.com/dp/076532637X','$20.91',3),
('0998274135',109,'www.amazon.com/dp/0998274135','$14.99',3),
('0345546806',111,'www.amazon.com/dp/0345546806','$16.17',3),
('1503943372',102,'www.amazon.com/dp/1503943372','$8.63',2),
('1542047862',102,'www.amazon.com/dp/1542047862','$9.17',3),
('1503948706',115,'www.amazon.com/dp/1503948706','$6.99',2),
('1250122953',104,'www.amazon.com/dp/1250122953','$16.16',2),
('1449486797',104,'www.amazon.com/dp/1449486797','$10.19',2),
('1501175467',104,'www.amazon.com/dp/1501175467','$12.73',2),
('1535197722',101,'www.amazon.com/dp/1535197722','$13.49',2),
('1250158060',105,'www.amazon.com/Fire-Fury-Inside-Trump-White/dp/1250158060','$18.00',2),
('0316273902',104,'www.amazon.com/People-vs-Alex-Cross/dp/1478923326','$19.76',3),
('0545791324',103,'www.amazon.com/Harry-Potter-Chamber-Secrets-Illustrated/dp/0545791324','$27.61',2);
GO

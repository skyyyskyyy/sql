USE n_kozoriz_library
GO

UPDATE [lib].[authors]
   SET birthday = CASE Author_id 
                      WHEN '1' THEN '1965.07.31'
					  WHEN '2' THEN '1947.03.22' 
					  WHEN '3' THEN '1953.03.27' 
					  WHEN '4' THEN '1947.12.02'
					  WHEN '5' THEN '1947.09.21'
					  WHEN '6' THEN '1992.10.05'
					  WHEN '7' THEN '1950.10.10'
					  WHEN '8' THEN '1959.01.10'
					  WHEN '9' THEN '1974.08.23'
					  WHEN '10' THEN '1968.07.28'
					  WHEN '11' THEN '1982.10.05'
					  WHEN '12' THEN '1940.10.10'
					  WHEN '13' THEN '1949.01.10'
					  WHEN '14' THEN '1990.08.23'
					  WHEN '15' THEN '1950.07.28'
                      ELSE birthday
			END,

   book_amount = CASE Author_id 
                      WHEN '1' THEN '1'
					  WHEN '2' THEN '1' 
					  WHEN '3' THEN '1' 
					  WHEN '4' THEN '1'
					  WHEN '5' THEN '1'
					  WHEN '6' THEN '1'
					  WHEN '7' THEN '1'
					  WHEN '8' THEN '1'
					  WHEN '9' THEN '1'
					  WHEN '10' THEN '1'
					  WHEN '11' THEN '1'
					  WHEN '12' THEN '1'
					  WHEN '13' THEN '1'
					  WHEN '14' THEN '1'
					  WHEN '15' THEN '1'
                      ELSE book_amount
              END,

   issue_amount = CASE Author_id 
                      WHEN '1' THEN '1'
					  WHEN '2' THEN '1' 
					  WHEN '3' THEN '1' 
					  WHEN '4' THEN '1'
					  WHEN '5' THEN '1'
					  WHEN '6' THEN '1'
					  WHEN '7' THEN '1'
					  WHEN '8' THEN '1'
					  WHEN '9' THEN '1'
					  WHEN '10' THEN '1'
					  WHEN '11' THEN '1'
					  WHEN '12' THEN '1'
					  WHEN '13' THEN '1'
					  WHEN '14' THEN '1'
					  WHEN '15' THEN '1'
                      ELSE issue_amount
              END,

	 total_edition = CASE Author_id 
                      WHEN '1' THEN '400'
					  WHEN '2' THEN '500' 
					  WHEN '3' THEN '650' 
					  WHEN '4' THEN '780'
					  WHEN '5' THEN '200'
					  WHEN '6' THEN '120'
					  WHEN '7' THEN '100'
					  WHEN '8' THEN '200'
					  WHEN '9' THEN '340'
					  WHEN '10' THEN '500'
					  WHEN '11' THEN '400'
					  WHEN '12' THEN '300'
					  WHEN '13' THEN '200'
					  WHEN '14' THEN '100'
					  WHEN '15' THEN '100'
                      ELSE total_edition
              END

         
GO

UPDATE [lib].[books]
   SET title = CASE ISBN 
                      WHEN '0062678418' THEN 'The Woman in the Window: A Novel'
					  WHEN '0316273902' THEN 'The People vs. Alex Cross' 
					  WHEN '0345546806' THEN 'The Whispering Room: A Jane Hawk Novel' 
					  WHEN '042528591X' THEN 'Iron Gold: Book 4 of the Red Rising Saga'
					  WHEN '0545791324' THEN 'Harry Potter and the Chamber of Secrets: The Illustrated Edition'
					  WHEN '0545935180' THEN 'Dog Man and Cat Kid: From the Creator of Captain Underpants'
					  WHEN '076532637X' THEN 'Oathbringer: Book Three of the Stormlight Archive'
					  WHEN '0998274135' THEN 'Sweet Tea Tuesdays'
					  WHEN '1250122953' THEN 'Year One: Chronicles of the One, Book 1'
					  WHEN '1250158060' THEN 'Fire and Fury: Inside the Trump White House'
					  WHEN '1449486797' THEN 'The Sun and Her Flowers'
					  WHEN '1455586609' THEN 'End Game (Will Robie Series)'
					  WHEN '1477825576' THEN 'My Sister''s Grave (The Tracy Crosswhite Series)'
					  WHEN '1501175467' THEN 'It: A Novel'
					  WHEN '1503943372' THEN 'Beneath a Scarlet Sky: A Novel'
					  WHEN '1542047862' THEN 'A Merciful Secret (Mercy Kilpatrick)'
                      ELSE title
			END,

     edition = CASE ISBN 
                      WHEN '0062678418' THEN '100'
					  WHEN '0316273902' THEN '500' 
					  WHEN '0345546806' THEN '400' 
					  WHEN '042528591X' THEN '130' -- pierce brown
					  WHEN '0545791324' THEN '400' 
					  WHEN '0545935180' THEN '130' -- dav picley
					  WHEN '076532637X' THEN '200'
					  WHEN '0998274135' THEN '300'
					  WHEN '1250122953' THEN '130' -- nora roberts
					  WHEN '1250158060' THEN '650'
					  WHEN '1449486797' THEN '120'
					  WHEN '1455586609' THEN '130' -- davi balacci
					  WHEN '1477825576' THEN '100'
					  WHEN '1501175467' THEN '200'
					  WHEN '1503943372' THEN '500'
					  WHEN '1542047862' THEN '200'
                      ELSE edition
			END,

    published = CASE ISBN 
                      WHEN '0062678418' THEN '20010101'
					  WHEN '0316273902' THEN '20100101' 
					  WHEN '0345546806' THEN '20110507' 
					  WHEN '042528591X' THEN '20120404'
					  WHEN '0545791324' THEN '20131212'
					  WHEN '0545935180' THEN '20141023'
					  WHEN '076532637X' THEN '20150901'
					  WHEN '0998274135' THEN '20170101'
					  WHEN '1250122953' THEN '20000505'
					  WHEN '1250158060' THEN '19990101'
					  WHEN '1449486797' THEN '20060101'
					  WHEN '1455586609' THEN '20080906'
					  WHEN '1477825576' THEN '20040201'
					  WHEN '1501175467' THEN '20150811'
					  WHEN '1503943372' THEN '20090901'
					  WHEN '1542047862' THEN '20140901'
                      ELSE published
			END,

  issue = CASE ISBN 
                      WHEN '0062678418' THEN '1'
					  WHEN '0316273902' THEN '1' 
					  WHEN '0345546806' THEN '1' 
					  WHEN '042528591X' THEN '1'
					  WHEN '0545791324' THEN '1'
					  WHEN '0545935180' THEN '1'
					  WHEN '076532637X' THEN '1'
					  WHEN '0998274135' THEN '1'
					  WHEN '1250122953' THEN '1'
					  WHEN '1250158060' THEN '1'
					  WHEN '1449486797' THEN '1'
					  WHEN '1455586609' THEN '1'
					  WHEN '1477825576' THEN '1'
					  WHEN '1501175467' THEN '1'
					  WHEN '1503943372' THEN '1'
					  WHEN '1542047862' THEN '1'
                      ELSE issue
			END
         
GO

UPDATE [lib].[Publishers]
   SET created = CASE Publisher_Id 
                      WHEN '101' THEN '19600502'
					  WHEN '102' THEN '19890506' 
					  WHEN '103' THEN '19000703' 
					  WHEN '104' THEN '19331223'
					  WHEN '105' THEN '20120304'
					  WHEN '106' THEN '19880101'
					  WHEN '107' THEN '19351201'
					  WHEN '108' THEN '19750909'
					  WHEN '109' THEN '19800401'
					  WHEN '110' THEN '19990101'
					  WHEN '111' THEN '19901016'
					  WHEN '112' THEN '19980908'
					  WHEN '113' THEN '19561010'
					  WHEN '114' THEN '19160909'
					  WHEN '115' THEN '19670101'
                      ELSE created
			END,

		country = CASE Publisher_Id 
                      WHEN '101' THEN 'GB'
					  WHEN '102' THEN 'GB' 
					  WHEN '103' THEN 'GB' 
					  WHEN '104' THEN 'Germany'
					  WHEN '105' THEN 'USA'
					  WHEN '106' THEN 'France'
					  WHEN '107' THEN 'Germany'
					  WHEN '108' THEN 'USA'
					  WHEN '109' THEN 'GB'
					  WHEN '110' THEN 'USA'
					  WHEN '111' THEN 'Spain'
					  WHEN '112' THEN 'Ireland'
					  WHEN '113' THEN 'Australia'
					  WHEN '114' THEN 'USA'
					  WHEN '115' THEN 'Sweeden'
                      ELSE country
			END,

     		city = CASE Publisher_Id 
                      WHEN '101' THEN 'London'
					  WHEN '102' THEN 'Manchester' 
					  WHEN '103' THEN 'London' 
					  WHEN '104' THEN 'Munchen'
					  WHEN '105' THEN 'Los Angeles'
					  WHEN '106' THEN 'Paris'
					  WHEN '107' THEN 'Berlin'
					  WHEN '108' THEN 'Sietle'
					  WHEN '109' THEN 'Liverpool'
					  WHEN '110' THEN 'New York'
					  WHEN '111' THEN 'Madrid'
					  WHEN '113' THEN 'Melbourne'
					  WHEN '112' THEN 'Brisbane'
					  WHEN '114' THEN 'Boston'
					  WHEN '115' THEN 'Stockgolm'
                      ELSE city
			END,

     
     	    total_edition = CASE Publisher_Id 
                      WHEN '101' THEN '200'
					  WHEN '102' THEN '0' 
					  WHEN '103' THEN '400' 
					  WHEN '104' THEN '200'
					  WHEN '105' THEN '500'
					  WHEN '106' THEN '650'
					  WHEN '107' THEN '460'
					  WHEN '108' THEN '500'
					  WHEN '109' THEN '120'
					  WHEN '110' THEN '300'
					  WHEN '111' THEN '400'
					  WHEN '112' THEN '0'
					  WHEN '113' THEN '200'
					  WHEN '114' THEN '0'
					  WHEN '115' THEN '0'
                      ELSE total_edition
			END,

			
     	    book_amount = CASE Publisher_Id 
                      WHEN '101' THEN '1'
					  WHEN '102' THEN '0' 
					  WHEN '103' THEN '1' 
					  WHEN '104' THEN '1'
					  WHEN '105' THEN '1'
					  WHEN '106' THEN '1'
					  WHEN '107' THEN '4'
					  WHEN '108' THEN '1'
					  WHEN '109' THEN '1'
					  WHEN '110' THEN '1'
					  WHEN '111' THEN '1'
					  WHEN '112' THEN '0'
					  WHEN '113' THEN '1'
					  WHEN '114' THEN '0'
					  WHEN '115' THEN '0'
                      ELSE book_amount
			END,

         			
     	    issue_amount = CASE Publisher_Id 
                      WHEN '101' THEN '1'
					  WHEN '102' THEN '1' 
					  WHEN '103' THEN '1' 
					  WHEN '104' THEN '1'
					  WHEN '105' THEN '1'
					  WHEN '106' THEN '1'
					  WHEN '107' THEN '1'
					  WHEN '108' THEN '1'
					  WHEN '109' THEN '1'
					  WHEN '110' THEN '1'
					  WHEN '111' THEN '1'
					  WHEN '112' THEN '1'
					  WHEN '113' THEN '1'
					  WHEN '114' THEN '1'
					  WHEN '115' THEN '1'
                      ELSE issue_amount
			END

         
GO
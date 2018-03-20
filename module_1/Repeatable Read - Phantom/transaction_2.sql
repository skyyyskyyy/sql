-- second transaction will insert one more row 
-- we execute transaction when the first has not finished yet 
use education
go

begin transaction

insert into dbo.products
(productid, name, city, categoryid)
values
(10,'Scaner', 'Paris', 1)


commit transaction
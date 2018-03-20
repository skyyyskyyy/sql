-- second transaction will insert new row
use education
go

-- while the first transaction is working we add one more row 
begin transaction

insert into dbo.products 
(productid, name, city, categoryid)
values
(8,'Monitor', 'Kiev', 3)


commit transaction
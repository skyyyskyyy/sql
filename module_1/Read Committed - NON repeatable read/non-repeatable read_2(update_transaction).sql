-- we update data when our first transaction has not completed yet
use education
go

begin transaction

-- we are changing our city name inside the first transaction
update dbo.products 
set city = 'Lviv' 
where productid = 1

commit transaction
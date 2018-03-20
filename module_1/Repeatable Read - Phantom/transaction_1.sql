use education
go

-- I'm setting isolation level 
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
begin transaction

select name, city 
from dbo.products
where productid > 3

-- here we are waiting to the end of another paralel transaction

select name, city 
from dbo.products
where productid > 3

-- at the end we'll get phantom anomality - one more row is added within ONE transaction
use education
go

-- setting isolation level - it's optional 'read commited' is default
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
begin transaction

-- begin commiting transaction
select * 
from dbo.products  
where productid > 3

-- here we are waiting for end of second transaction

select * 
from dbo.products  
where productid > 3


commit transaction


-- as result we'll get phantom anomality -> different selected data - one row is added by 
-- the second transaction within our first transaction is not completed jet.
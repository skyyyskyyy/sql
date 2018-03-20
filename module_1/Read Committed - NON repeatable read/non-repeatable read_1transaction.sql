use education
go

-- I'm setting isolation level - in this case it is optional because 'read commited' is default 
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

begin transaction

select * from dbo.products
-- here we are waiting for second transaction's end
-- and after second tranaction we execute the rest of our transaction

select * from dbo.products

commit transaction
-- and we will get the changed result which the second transaction has commited - this anomality called non repeateable read
-- we'll get different results within ONE transaction
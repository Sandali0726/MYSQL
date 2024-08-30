-- 2- Creating Transactions --
start transaction;
insert into orders (customer_id,order_date,status)
values(1,'2019-01-01',1);

insert into order_items
values(last_insert_id(),1,1,1);

commit;  -- rollback = error checking

start transaction;
update customers
set points = points + 10
where customer_id = 1;
commit;
-- ----------------------------------------------------------------------------------------------------------

-- 5- Transaction Isolation Levels --

show variables like 'transaction_isolation';
set  transaction isolation level serializable;  -- make isolation level in next transaction

set  session transaction isolation level serializable; -- set all future transaction are isolation
-- other transaction in database not affected 

set global transaction isolation level serializable;  -- all transaction are serialize   
-- serializable - isolation level
-- all new transaction in all session

-- -----------------------------------------------------------------------------------------------------------

-- 6- READ UNCOMMITTED Isolation Level --

set Transaction isolation level read uncommitted;
select points
from customers
where customer_id = 1;

-- 7- READ COMMITTED Isolation Level --

set Transaction isolation level read committed;
start Transaction;
select points from customers where customer_id = 1;
select points from customers where customer_id = 1;
commit;

-- 8- REPEATABLE READ Isolation Level
set Transaction isolation level repeatable read;
start Transaction;
select points from customers where customer_id = 1;
select points from customers where customer_id = 1;
commit;

set Transaction isolation level repeatable read;
start Transaction;
select * from customers where state = 'VA';
commit;

-- 9- SERIALIZABLE Isolation Level
set Transaction isolation level serializable;
start Transaction;
select * from customers where state = 'VA';
commit;

-- 10- Deadlocks
start transaction;
update customers set state = 'VA' where customer_id = 8;
update orders set status = 1 where customer_id = 8;
commit;












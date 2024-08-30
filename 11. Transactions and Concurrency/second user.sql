start transaction;
update customers
set points = points + 10
where customer_id = 1;
commit;

-- 06--------------------------------
start transaction;
update customers
set points = 20
where customer_id = 1;
rollback;
-- commit;

-- --------------------------------------------------------
-- 7- READ COMMITTED Isolation Level --
start transaction;
update customers
set points = 48    -- points=200 as there is rollback not commited. it is not read uncommited data
where customer_id = 1;
commit;

-- 8- REPEATABLE READ Isolation Level
start transaction;
update customers
set points = 40  
where customer_id = 1;
commit;

start transaction;
update customers
set state = 'VA' 
where customer_id = 3;
commit;

-- 9- SERIALIZABLE Isolation Level
start transaction;
update customers
set state = 'VA' 
where customer_id = 3;
commit;

-- 10- Deadlocks
start transaction;
update orders set status = 1 where customer_id = 8;
update customers set state = 'VA' where customer_id = 8;
commit;


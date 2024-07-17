-- create table orders_archived as
-- select * from orders  -- create copy of table
-- select table -> right-> truncate table  = delete the table all elements

-- insert into orders_archived
-- select *
-- from orders
-- where order_date < '2019-01-01'

-- Exercise
select*
from  clients c
join invoices i
	using(client_id)
insert into invoices_archived
select *
from invoices
where payment_date is null;





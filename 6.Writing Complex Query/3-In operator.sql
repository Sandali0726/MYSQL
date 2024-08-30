select *
from products
where product_id not in (
select distinct product_id
from order_items)

-- EXERCISE --
select *
from clients
where client_id not in (select distinct client_id
from invoices)
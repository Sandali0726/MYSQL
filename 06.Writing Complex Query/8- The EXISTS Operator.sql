-- Select  the client that have an invoices--
select*
from clients
where client_id in ( 
		select distinct client_id 
        from invoices)
        
select*
from clients c
where exists ( 
		select  client_id 
        from invoices
        where client_id=c.client_id)
        
-- Find the product that are never be ordered --
select*
from products p
where not exists ( 
		select  product_id 
        from order_items
        where product_id=p.product_id)
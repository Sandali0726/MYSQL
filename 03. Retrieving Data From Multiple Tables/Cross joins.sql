-- select 
    -- c.first_name as customer,
    -- p.name as product
-- from customers c
-- cross join products p

-- from customers c, products p (same)
-- order by c.first_name

-- Exercise---
select  *
-- from shippers s,products p 
from shippers s
 cross join products p 
order by s.shipper_id



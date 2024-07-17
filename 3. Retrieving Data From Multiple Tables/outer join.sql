select
	c.customer_id,
    c.first_name,
    o.order_id
from customers c      
-- join orders o   -- we get only customers who have orders --
--  left join orders o   -- get every left side elements (get all customer id in customer table)
 right join orders o      -- get every right side elements (get all customer id in order table)
    on c.customer_id = o.customer_id
order by c.customer_id





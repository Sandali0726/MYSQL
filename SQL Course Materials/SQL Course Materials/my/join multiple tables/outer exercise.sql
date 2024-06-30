select
	p.product_id,
    p.name,
    oi.quantity
from products p     
left join order_items oi 
    on oi.product_id = p.product_id
order by product_id





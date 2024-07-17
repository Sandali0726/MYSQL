select 
	c.customer_id,
	c.first_name,
	o.order_id,
    sh.name as shipper

from customers c
left join orders o
	on c.customer_id = o.customer_id
left join shippers sh
	on o.shipper_id = sh.shipper_id
order by c.customer_id


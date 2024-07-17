select 
o.order_date,
o.order_id,
c.first_name,
sh.name as shipper,
os.name as status
	
from orders o

left join shippers sh
	on o.shipper_id = sh.shipper_id
left join customers c
	on o.customer_id = c.customer_id
left join order_statuses os
	on o.status = os.order_status_id 
order by o.status
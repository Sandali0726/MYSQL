select 
	order_id,
    ifnull(shipper_id,'Not assigned') as shipper
from orders

select 
	order_id,
    coalesce(shipper_id,comments,'Not assigned') as shipper
from orders

select 
	concat(first_name,' ',last_name) as customer,
    coalesce(phone,'Unknow') as phone
from customers
-- EXERCISE--
use sql_invoicing;
select 
	p.payment_id,
	c.client_id,
	c.name,
	p.payment_method,
	pm.name
    
from payments p 
join  payment_methods pm
	on pm.payment_method_id = p.payment_method
join clients c
	on p.client_id = c.client_id



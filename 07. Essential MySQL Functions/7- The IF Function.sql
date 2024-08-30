select
	order_id,
    order_date,
    if(year(order_date)=year(now()),
    'Active',
    'Archived') as category
from orders

select
	oi.product_id,
    p.name,
    count(*) as orders,
    if(count(*)=1,
    'once',
    'Many times') as frequency
from  products p
join order_items oi using(product_id)
group by oi.product_id,p.name;



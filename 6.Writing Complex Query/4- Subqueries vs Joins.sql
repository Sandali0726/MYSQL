select distinct customer_id,first_name,last_name
from customers c
join orders o using (customer_id)
join order_items oi  using(order_id)

where oi.product_id=3
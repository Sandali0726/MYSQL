select * 
from order_items oi
join order_item_notes oin
	on oi.order_id = oin.order_Id
    and oi.product_id = oin.product_id
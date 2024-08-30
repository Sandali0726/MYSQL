 use sql_inventory;
 select *
from sql_store.order_items oi
join products p 
      on oi.product_id = p.product_id
-- select order_id,o.customer_id,first_name,last_name
-- from orders o  -- orders = o , customres = c
 -- join customers c
--          on o.customer_id = c.customer_id
        
-- EXERCISE---
select order_id, p.product_id, quantity, o.unit_price, name
    from order_items o
    join products p
             on o.product_id = p.product_id


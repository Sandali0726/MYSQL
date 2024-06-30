-- EX-:01
-- select 
      -- o.order_id,
      -- c.first_name,
      -- sh.name as shipper
      
-- from orders o
-- join customers c 
	-- on o.customer_id = c.customer_id
   -- using(customer_id)
-- left join shippers sh
	-- using (shipper_id)
    
    
-- EX-:02
-- select *
-- from order_items oi
-- join order_item_notes oin
	-- [on oi.order_id = oin.order_id and 
		-- oi.product_id = oin.product_id
        -- INSTEAD OF THIS WE CAN USE]
    --     using(order_id,product_id)
select 
       p.date,
       c.name as client,
       p.amount,
       pm.name
       
      
      
 from payments p 
 join clients c
    using(client_id)
join  payment_methods pm
    on pm.payment_method_id = p.payment_method

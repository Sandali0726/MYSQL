select * ,(quantity*unit_price) as total
FROM order_items
WHERE order_id=2
-- order by quantity*unit_price desc
order by total desc
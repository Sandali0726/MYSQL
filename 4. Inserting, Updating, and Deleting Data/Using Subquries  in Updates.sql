-- Update the invoices table
UPDATE invoices
SET 
    payment_total =78,
    -- payment_date=null
    payment_date=due_date
    -- where client_id=3
 where payment_date is null
 
 
 -- Exercise----
 
 update orders
set 
    comments = null
    where customer_id in(select customer_id
 from customers 
 where  points>3000);
 SELECT customers.customer_id  
FROM orders,customers
where  points>3000  ;



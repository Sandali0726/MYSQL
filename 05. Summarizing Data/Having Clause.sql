select 
    client_id,
     sum(invoice_total) as total_sales,
     count(*) as number_of_invoices
from invoices
-- where total_sales>500 *using where - can filter before group
-- where + column (wether we select it or not)
group by client_id
having total_sales>500 and  number_of_invoices >5  -- *using having - can filter after group  
-- the column we use in having must be we select in above as a example we can't write "having payment as we haven't select it


-- EXERCISE --
select
c.customer_id, 
c.first_name,
c.last_name,
sum(oi.unit_price*oi.quantity) as total,
c.state
from customers c
join orders o using (customer_id)
join order_items oi using (order_id)
where  c.state="VA"
group by customer_id
having total>100 

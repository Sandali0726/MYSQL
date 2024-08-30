create view sales_by_client as 
select
     c.client_id,
     c.name,
     sum(invoice_total) as total_sale
from clients c 
join invoices i using (client_id)
group by client_id,name

select *
from sales_by_client
order by total_sale desc
 
 
 -- createa view a client to see the balance for each client.
 -- client balance
 -- client_id
 -- name
 -- balance
 
create view client_balance as 
select
     c.client_id,
     c.name,
     sum(invoice_total-payment_total) as client_balance
from clients c 
join invoices i using (client_id)
group by client_id,name

 
 
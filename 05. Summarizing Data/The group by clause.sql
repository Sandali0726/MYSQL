select
	state,
    city,
    sum(invoice_total) as total_sales
from invoices i
join clients using (client_id)
-- where invoice_date>='2019-07-01'
group by state , city
order by total_sales desc  -- group clause is always be before the order clause

select
	date,
    -- payment_method,
    sum(amount) as total_payments
from payments 
-- natural join payment_methods -- using (payment_method_id)
-- where invoice_date>='2019-07-01'
-- group by state , city
order by date   -- group clause is always be before the order clause
update invoices_with_balance
set payment_total = invoice_total
where invoice_id=4

create or replace view invoices_with_balance as 
select 
	invoice_id,
    number,
    client_id,
    invoice_total,
    payment_total,
    invoice_total-payment_total as balance,
    invoice_date,
    due_date,
    payment_date
from invoices
where (invoice_total-payment_total) >0
with check option  -- you update a raw an it can't include in table anymore it show you an error
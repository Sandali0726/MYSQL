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


delete from invoices_with_balance
where invoice_id=1

update invoices_with_balance
set due_date = date_add(due_date,interval 2 day)
where invoice_id=2

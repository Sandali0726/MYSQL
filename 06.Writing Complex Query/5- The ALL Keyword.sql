-- select invoices larger than all invoices of client 3
select*
from invoices
where invoice_total> (select max(invoice_total) from invoices where client_id=3)

select*
from invoices
where invoice_total> all (select invoice_total from invoices where client_id=3)
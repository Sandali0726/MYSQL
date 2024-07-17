update invoices 
-- set payment_total = default, payment_date = NULL
set 
    payment_total = invoice_total*0.5,
    payment_date = due_date
where invoice_id = 1

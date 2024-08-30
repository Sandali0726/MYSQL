--  Aggregate Function Exercise --
select 
   'First half of 2019' as data_range,
   sum(invoice_total) as total_sales,
   sum(payment_total) as total_payments,
   sum(invoice_total - payment_total) as what_we_expected
from invoices 
where invoice_date
     between '2019-01-01' and '2019-06-30'
 union     
select 
   'Second half of 2019' as data_range,
   sum(invoice_total) as total_sales,
   sum(payment_total) as total_payments,
   sum(invoice_total - payment_total) as what_we_expected
from invoices 
where invoice_date
     between '2019-06-30' and '2019-12-31'
union     
select 
   'Total' as data_range,
   sum(invoice_total) as total_sales,
   sum(payment_total) as total_payments,
   sum(invoice_total - payment_total) as what_we_expected
from invoices 

     
   
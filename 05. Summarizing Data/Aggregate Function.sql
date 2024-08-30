select 
      MAX(invoice_total) as highest,
       MAX(payment_date) as latest_date,
      min(invoice_total) as lowest,
      avg(invoice_total) as average,
      -- sum(invoice_total) as total,
      sum(invoice_total*1.1) as total,
      count(invoice_total) as number_of_invoices,
      count(payment_date) as number_of_payment,
      -- count(*) as number_of_recordes
      count(distinct client_id) as number_of_recordes
      
from invoices
-- where invoice_date > '2019-07-01'


select 
	    state,
        city,
        sum(invoice_total) as total_sales
from invoices i
join clients c using (client_id)
group by state,city with rollup -- show summerizing of data 

-- EXERCISE --
select
      pm.name as payment_method,
      -- payment_method,
      sum(amount) as total
from payments p
join payment_methods pm -- using(payment_method_id)
on p.payment_method=pm.payment_method_id
-- **********
group by pm.name with rollup  -- **********
      
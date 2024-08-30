call make_payment(2,100,'2019-01-01')
call make_payment(2,-100,'2019-01-01')

-- User or session variables
set @invoices_count = 0

-- Local variables

-- 10- Functions
select 
	client_id,
    name,
    get_risk_factor_for_client(client_id) as risk_factor
from clients
select
 
	order_id,
    case
        when year(order_date) = year(now()) then 'Active'
        when year(order_date) = year(now())-1 then 'Last year'
        when year(order_date) < year(now()) -1 then 'Archived'
        else 'Future'
	end as category
from orders

select 
	concat(first_name,' ',last_name) as customer,
    points,
    
    case
        when points >=3000 then 'Gold'
        when points >=2000 and points<3000  then 'Silver'
        else  'Bronze'
	end as category
from customers
order by points desc
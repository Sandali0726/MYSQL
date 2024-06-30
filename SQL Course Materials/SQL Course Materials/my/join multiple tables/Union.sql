-- Ex -:01
select  
     order_id,
     order_date,
     'Active' as status
from orders
where order_date>='2019-01-01'

union 

select  
     order_id,
     order_date,
     'Archived' as status
from orders
where order_date<'2019-01-01'

-- Ex -:02  
select first_name
from customers 
union 
select name
from shippers
-- we get all customers and shippers in one column--

-- use no. column must be equal
select first_name,last_name
from customers
union 
select name
from shippres
-- this give error as 1st part col=2 but 2nd part col = 1
select name
from shippers
union 
select first_name
from customers 
-- calling order = elementsin line--
-- in this 1->ship names 2->customer names

-- Exercise --
select 
	customer_id,
    first_name,
    points,
    'Bronze' as type
from customers
    where points<2000
    union 
select 
	customer_id,
    first_name,
    points,
    'Silver' as type
from customers
    where 2000<points and points<3000
    union
select 
	customer_id,
    first_name,
    points,
    'Gold' 
as type
from customers
    where points>3000
order by first_name




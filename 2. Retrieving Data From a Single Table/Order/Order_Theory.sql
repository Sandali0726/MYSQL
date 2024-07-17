-- EX-:01
-- select *
-- from customers
-- order by first_name  -- Ascending order
-- order by first_name  desc -- descending order
-- order by state,first_name  -- Ascending order

-- EX-:02   -- select different columns and use unselected one to sort data 
-- SELECT  first_name , last_name
-- from customers
-- order by birth_date

-- EX-:03
select birth_date,last_name,10 as points
from customers
-- order by points, first_name
order by 1,2   -- 1=1st selected one , 2= 2nd selected one



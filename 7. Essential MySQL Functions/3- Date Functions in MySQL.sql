select now(), curdate(),current_time()
select year(now())
select month(now())
select date(now())
select day(now())
select hour(now())
select minute(now())
select second(now())
select dayname(now())
select monthname(now())
select extract(year from now())
select extract(month from now())

select *
from orders
where year(order_date) = year(now())
select *
from customers
-- where 1000<=points <=3000
-- where points between 1000 and 3000
where birth_date between '1990-01-01' and '2000-01-01'
select *
from customers
-- where last_name like 'b%'  -- "b" at the begining 
-- where last_name like '%b%'   -- "b" at anywhere
 -- where last_name like '%y'
 -- where last_name like '_____y'  -- "y" at after 5 letters  "_" = letters before the given letter
 -- where last_name like 'b____y'
 
-- % any number of charactres 
-- _ single character

-- EXERCISE --
-- where address like '%TRAIL' OR '%AVENUE'
-- WHERE  phone like '%9'
WHERE  phone not like '%9'


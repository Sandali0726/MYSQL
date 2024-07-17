select *
from customers
-- where last_name like '%field%'
-- where  last_name REGEXP 'field' -- field at any where 
-- where  last_name REGEXP 'field$'   -- field at end
-- where  last_name REGEXP '^field'       -- field at begining
-- where  last_name REGEXP 'field|mac|rose'
-- where  last_name REGEXP '^field|mac|rose'
-- where  last_name REGEXP '[gim]e'   -- before "e" there must be "i" or "m" or "g"
-- where  last_name REGEXP 'e[fmq]'      -- after "e" there must be "f" or "m" or "q"
-- where  last_name REGEXP '[a-h]e'    -- before "e" there must be letters between a and h
-- ^ begining 
-- $ end
-- | logical or
-- [abcd]
-- [a-f]

-- where first_name regexp 'elka|ambur' 
-- where last_name regexp 'ey$|on' 
 -- where last_name regexp '^my|se'
 where last_name regexp 'b[ru]'  


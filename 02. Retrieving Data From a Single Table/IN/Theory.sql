select *
from customers
-- where state = 'VA' or 'GA' or 'FL'  --  we can't use this
-- where state = 'VA' or state = 'GA' or state = 'FL' 
-- where state in ('VA' ,'GA','FL')
where state NOT in ('VA' ,'GA','FL')
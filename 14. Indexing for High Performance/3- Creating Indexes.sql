select customer_id from customers where state = 'CA'
explain select customer_id from customers where state = 'CA'
create index idx_state on customers(state);
select count(*) from customers

-- write a query to find customers  with more than 1000 points.
create index idx_points on customers(points);
select customer_id from customers where points>1000

create index idx_lastname on customers (last_name(20))

select 
     count(distinct left(last_name,1)),
     count(distinct left(last_name,5)),
     count(distinct left(last_name,10))
from customers;

-- 6- Full-text Indexes -- 

create fulltext index idx_tittle_body on posts (title,body);
select*,match(title,body) against ('react redux')
from posts
-- where match(title,body) against ('react redux');
-- where match(title,body) against ('react -redux' in boolean mode);  -- select posts without redux
-- where match(title,body) against ('react -redux+form' in boolean mode); -- select posts must have form
where match(title,body) against ('"handling a form"' in boolean mode); -- select a exact word post


-- 7- Composite Indexes
create index idx_state_points on customers(state,points);
explain select customer_id from customers
where state = 'CA' and points>1000;

show indexes in customers;
drop index idx_points on customers;

-- 8- Order of Columns in Composite Indexes
select customer_id 
from customers
where state = 'CA' and last_name like 'A%';
select 
     count(distinct state),
     count(distinct last_name)
from customers;

explain select customer_id 
from customers
where state = 'CA' and last_name like 'A%';
select 
     count(distinct state),
     count(distinct last_name)
from customers;


explain select customer_id 
from customers
where state = 'CA' and last_name like 'A%';

create index idx_lastname_state on customers (last_name,state);
create index idx_state_lastname on customers
(state,last_name);


DROP INDEX idx_state_lastname on customers;
DROP INDEX idx_lastname_state on customers;


explain select customer_id 
from customers
use index (idx_state_lastname)
where state like 'A%' and last_name like 'A%';
use index (idx_lastname_state)
where state like 'A%' and last_name like 'A%';

-- 9- When Indexes are Ignored 
explain select customer_id from customers
where state = 'CA' or points>1000;

-- break in to 2 subgroups
create index  idx_points on customers (points);
explain 
	select customer_id from customers
    where state = 'CA'
    union 
    select customer_id from customers
    where points > 1000;
    
    explain select customer_id from customers
    -- where points+10 > 2010;  -- scan 1010 (all) raws
    where points > 2000;  -- scan only 3 raws

show index in customers;

explain select customer_id from customers
order by state;
-- explain select customer_id from customers
-- order by first_name;
show status like 'last_query_cost';

explain select customer_id from customers
order by state , points desc;
-- order by state desc, points desc;  
show status like 'last_query_cost';

-- when make index , primary key automatically adding to it.
drop index idx_lastname_state on customers;



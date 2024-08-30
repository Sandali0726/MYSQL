select *
from products 
where unit_price>(select unit_price
from products
where product_id=3)

-- EXERCISE --
select *
from employees
where salary>(select avg(salary) from employees)

-- select employee_id,salary
-- from employees
-- where salary=sum(salary)/count(employee_id))

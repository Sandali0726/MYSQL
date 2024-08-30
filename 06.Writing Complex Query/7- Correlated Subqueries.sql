-- for each employee
-- calculate the average salary for employee.office
-- return the employee if salary > avg
select *
from employees e
where salary> (
select avg(salary)
from employees
where office_id=e.office_id
)

-- EXERCISE--
-- get invoices that are larger than the client's average invoice amount 
select *
from invoices i
where invoice_total> (
select avg(invoice_total)
from invoices
where client_id=i.client_id
)

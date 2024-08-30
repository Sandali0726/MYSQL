select round(5.23456,2)
select truncate(5.23956,2)
select ceiling(5.23456)  -- return the number greater than or equal to this number
select floor(5.23456)
select abs(-5.23456)
select rand()
select length('asdfgh')
select upper('asdfgh')
select lower('aAAdfgh')
select ltrim('          asdfgh')
select rtrim('asdfgh            ')
select trim('            asdfgh            ')
select left('qwertyui',3)
select right('qwertyui',3)
select substring('qwertyui',3,7)
select locate ('n','asdnddnfgn')
select locate ('q','asdnddnfgn')
select locate ('nd','asdnddnfgn')
select replace ('asdnddnfgn','n','g')
select concat('sandali','sath')

select concat(first_name,'  ',last_name) as full_name 
from customers

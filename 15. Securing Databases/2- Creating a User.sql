create user peter@127.0.0.1  -- user can only connect to this ip address computer
create user john@'%codewithmosh.com' -- user can  connect any computer in this ip address domain
create user john -- no any  restricted 
create user john  identified by '1234'
drop user john;
drop user peter
select * from mysql.user; 
set password for john = '1234';
set password  = '1234'; -- change currently logging user password

-- 1- web/desktop application
drop user john;
create user peter identified by '1234';
grant select,insert,update,delete,execute
on store.*
to peter;

-- 2- admin 
grant all 
on  *.* -- all tables in all databases
to peter; 

show grants for peter;


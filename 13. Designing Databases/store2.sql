create database if not exists store2;
drop table if exists orders;
drop table if exists customers;
create table if not exists customers
(
	customer_id int primary key auto_increment,
    first_name  varchar(50) not null,
    -- first_name  varchar(50) character set latin1 not null,
    points      int not null default 0,
    email       varchar(255) not null unique
);

alter table customers -- make changes to the exiting table
	add last_name varchar(50) not null after first_name,
    add city varchar(50) not null,
    modify column first_name varchar(55) default '',
    drop points;  -- column keyword is optional 
    
create table orders
(
	order_id int primary key,
    customer_id int not null,
    foreign key fk_orders_customers(customer_id)
		references customers(customer_id)
			on update cascade
            on delete no action
);

-- when we execute -->drop table if exists customers; 
-- that give error as order table depend on customer table. 
-- so we first have to delete order table and next delete customer table

alter table orders
	-- add primary key(order_id),
    -- drop primary key,
    -- drop foreign key fk_orders_customers,
    add foreign key fk_orders_customers(customer_id)
		references customers (customer_id)
		on update cascade
        on delete no action;
        
show charset
    
create database db_name
	character set latin1
    
show engines

alter table customers
engine = innodb
-- ------------------------------------
drop procedure if exists get_clients_by_state;
delimiter $$
create procedure get_clients_by_state
(
     state char(2)
)	
begin 
	select * from clients c
    where c.state=state;
end $$
delimiter ;
call get_clients_by_state('CA')
call get_clients_by_state()

-- -------------------------------------------------------------------------------------------------
-- write a stored procedure to return invoices for a given client 
-- get_invoices_by_client

drop procedure if exists get_invoices_by_client;
delimiter $$
create procedure get_invoices_by_client
(
     client_id int(1)
)
	
begin 
	select * from invoices i
    where i.client_id=client_id;
end $$
delimiter ;
-- --------------------------------------------------------------------------------------------------------

drop procedure if exists get_clients_by_state;
delimiter $$
create procedure get_clients_by_state
(
     state char(2)
)	
begin 
	if state is null then
		set state = 'CA';
	end if;
    
	select * from clients c
    where c.state=state;
end $$
delimiter ;
call invoicing.get_clients_by_state(NULL);
-- --------------------------------------------------------------------

drop procedure if exists get_clients_by_state;
delimiter $$
create procedure get_clients_by_state
(
     state char(2)
)	
begin 
	if state is null then
		select * from clients;
	eLSE
		select * from clients c
		where c.state=state;
	end if;
end $$
delimiter ;
call invoicing.get_clients_by_state('CA');
-- ----------------------------------------------------------------

drop procedure if exists get_clients_by_state;
delimiter $$
create procedure get_clients_by_state
(
     state char(2)
)	
begin 
	select * from clients c
	where c.state=IFNULL(state,c.state);
end $$
delimiter ;
call invoicing.get_clients_by_state('CA');


-- write a stored procedure called get_payments with two parameters
-- client_id => int
-- payment_method_id => tinyint

drop procedure if exists get_payments;
delimiter $$
create procedure get_payments
(
     client_id int,
     payment_method_id tinyint
)	
begin 
		select * from clients c
        join payment p using(client_id)
        join payment_method pm using(p.payment_id=pm.payment_method_id)
		where c.client_id=client_id ;
	end if;
end $$
delimiter ;
call invoicing.get_clients_by_state('CA');

create view faculty as
select client_id,name,address
from clients


call get_payments(NULL,NULL)
call get_payments(5,NULL)
























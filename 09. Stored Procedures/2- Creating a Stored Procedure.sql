delimiter $$
create procedure get_client()
begin 
	select * from clients;
end$$
delimiter ;

call get_client()  

-- create a store procedure called
-- get_invoices_with_balance
-- to return all the invoices with a balance>0

delimiter $$
create procedure get_invoices_with_balance()
begin 
	select * from invoices where (invoice_total-payment_total)>0;
end$$
delimiter ;

call get_invoices_with_balance()  

delimiter $$
create procedure get_invoices_with_balan()
begin 
	select * 
    from invoices_with_balance 
    where balance >0;
end$$
delimiter ;
call get_invoices_with_balan()  
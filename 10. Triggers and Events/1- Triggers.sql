delimiter $$
drop trigger if exists payment_after_insert;
create trigger payment_after_insert
	after insert on payments
    for each row
begin
	update invoices
    set payment_total = payment_total + new.amount
    where invoice_id = new.invoice_id;
    
end $$

delimiter ;

insert into payments 
values(default,5,3,'2019-01-01',10,1)

-- create a trigger that gets fired when we delete a payment.
delimiter $$
drop trigger if exists payment_after_delete;
create trigger payment_after_delete
	after delete on payments
    for each row
begin
	update invoices
    set payment_total = 0
    where invoice_id = old.invoice_id;
    insert into payments_audit
    values (old.client_id,old.date,old.amount,'delete', now());
    
end $$

delimiter ;

delete 
from payments
where payment_id=3

show triggers
show triggers like 'payments%'

-- table_after_insert

-- dropping triggers
drop trigger if exists payment_after_insert;

USE invoicing; 

CREATE TABLE payments_audit
(
	client_id 		INT 			NOT NULL, 
    date 			DATE 			NOT NULL,
    amount 			DECIMAL(9, 2) 	NOT NULL,
    action_type 	VARCHAR(50) 	NOT NULL,
    action_date 	DATETIME 		NOT NULL
)

delimiter $$
-- drop trigger if exists payment_after_insert;
create trigger payment_after_insert
	after insert on payments
    for each row
begin
	update invoices
    set payment_total = payment_total + new.amount
    where invoice_id = new.invoice_id;
    insert into payments_audit
    values (new.client_id,new.date,new.amount,'Insert', now());
end $$

delimiter ;

insert into payments
values(default,5,3,'2019-01-01',10,1)

delete from payments
where payment_id = 12

























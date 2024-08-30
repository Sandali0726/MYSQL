insert into orders (customer_id,order_date,status)
values(1,'2002-07-26',2);

insert into order_items
values
	(last_insert_id(),1,1,2.3),
    (last_insert_id(),2,1,2.3)


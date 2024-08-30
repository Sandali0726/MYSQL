select 
	invoice_id,
    invoice_total,
    (select avg(invoice_total)
			from invoices) as invoice_average,
	invoice_total-(select invoice_average) as difference
    from invoices
    
select 
	 distinct client_id,
    c.name,
    (select sum(invoice_total) from invoices i where c.client_id=client_id)as total_sales,
    (select avg(invoice_total)
			from invoices) as average,
	(select total_sales -  average) as difference
    from clients c 
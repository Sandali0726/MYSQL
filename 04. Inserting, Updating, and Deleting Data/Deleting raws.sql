delete from invoices
where client_id in (select client_id
 from clients
where name='Myworks')
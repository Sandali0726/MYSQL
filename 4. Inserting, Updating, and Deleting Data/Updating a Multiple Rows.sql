update invoices 
-- set payment_total = default, payment_date = NULL
set 
    payment_total = invoice_total,
    payment_date = due_date
where client_id in (2,5) -- this is not given a range it is the id of rows which we want to update 

-- Exercise ---
-- Write a SQL statement to give any customers born before 1990 50 extra points
SET SQL_SAFE_UPDATES = 0;

UPDATE customers
SET points = points + 50
WHERE birth_date < '1990-01-01';

SET SQL_SAFE_UPDATES = 1;

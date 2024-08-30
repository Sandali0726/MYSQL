-- 01
USE sql_store;
-- SELECT 1,2
SELECT *
 FROM customers            -- FROM ->  WHERE ->ORDER this is the order we have to execute
-- WHERE customer_id = 1
ORDER BY first_name

-- 02
SELECT first_name,
        last_name,
        points,
        points/10 AS 'discount factor'
FROM customers

-- 03
SELECT DISTINCT state 
FROM customers
SELECT *
FROM orders
-- WHERE points > 3000
-- WHERE state = 'VA'  -- va is also ok UPPER lower is not matter
-- WHERE state != 'VA'  -- WHERE state <> 'VA' alsogive same result
-- WHERE birth_date > '1990-01-01'
WHERE order_date >='2018-01-01'


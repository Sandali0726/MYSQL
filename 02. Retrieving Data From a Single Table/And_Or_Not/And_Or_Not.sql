SELECT *
FROM customers
-- WHERE birth_date > '1990-01-01' and points > 1000
-- WHERE birth_date > '1990-01-01' or points > 1000
-- and or not 
WHERE birth_date > '1990-01-01' or
	  (points > 1000 and state ='VA')
      
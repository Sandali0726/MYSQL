SELECT first_name,
        last_name,
        points,
        points/10 AS 'discount factor'
FROM customers
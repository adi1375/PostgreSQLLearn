CREATE FUNCTION name_search(f_name TEXT, l_name TEXT)
RETURNS NUMERIC
LANGUAGE plpgsql
AS
$$
DECLARE
customer_total_amount NUMERIC;
BEGIN
SELECT SUM(amount)
INTO customer_total_amount
FROM payment p
INNER JOIN customer c
ON c.customer_id=p.customer_id
WHERE (c.first_name = f_name AND c.last_name = l_name);
RETURN customer_total_amount;
END;
$$

SELECT name_search('AMY', 'LOPEZ');

SELECT 
first_name,
last_name,
name_search(first_name,last_name)
FROM customer;
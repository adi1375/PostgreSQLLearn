--challenge create table as
CREATE TABLE customer_spendings
AS
SELECT
first_name ||' '|| last_name AS full_name,
SUM(amount) AS total_amount
FROM customer cu
LEFT JOIN payment p
ON cu.customer_id = p.customer_id
GROUP BY first_name ||' '|| last_name;

SELECT * FROM customer_spendings;
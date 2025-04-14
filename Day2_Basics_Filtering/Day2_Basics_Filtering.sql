-- SELECT
-- COUNT(*)
-- FROM payment
-- WHERE amount = 0.00

-- challenge 1
SELECT
COUNT(*)
FROM payment
WHERE customer_id = 100;

-- challenge 2
SELECT
first_name,
last_name
FROM customer
WHERE first_name = 'ERICA';

-- challenge 3
SELECT
COUNT(*)
FROM rental
WHERE return_date is null;

-- challenge 4
SELECT 
payment_id,
amount
FROM payment
WHERE amount <= 2;

-- challenge 5
SELECT
*
FROM payment
WHERE
(customer_id = 322 OR customer_id = 346 OR customer_id = 354)
AND (amount < 2 OR amount > 10)
ORDER BY customer_id ASC, amount DESC;

-- challenge 6
SELECT
COUNT(*)
FROM payment
WHERE payment_date BETWEEN '2020-01-26' AND '2020-01-27 23:59'
AND amount BETWEEN 1.99 AND 3.99;

-- challenge 7
SELECT
*
FROM payment
WHERE customer_id IN (12,25,67,93,124,234)
AND amount IN (4.99,7.99,9.99)
AND payment_date < '2020-02-01';

-- challenge 8
SELECT
COUNT(*)
FROM film
WHERE description LIKE '%Documentary%';

-- challenge 9
SELECT
COUNT(*)
FROM customer
WHERE first_name LIKE '___'
AND (last_name LIKE '%X' OR last_name LIKE '%Y');

-- challenge 10
SELECT
COUNT(*) AS no_of_movies
FROM film
WHERE description LIKE '%Saga%'
AND (title LIKE 'A%' OR title LIKE '%R');

-- challenge 11
SELECT
*
FROM customer
WHERE first_name like '_A%ER%'
ORDER BY last_name DESC;

-- challenge 12
SELECT
COUNT(*) AS no_of_payments
FROM payment
WHERE (amount = 0
OR amount BETWEEN 3.99 AND 7.99)
AND payment_date BETWEEN '2020-05-01' AND '2020-05-02 23:59'
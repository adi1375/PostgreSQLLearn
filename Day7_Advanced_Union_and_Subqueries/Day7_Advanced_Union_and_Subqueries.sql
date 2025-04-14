-- challenge 1
SELECT
*
FROM film
WHERE length > (SELECT AVG(length) FROM film);

-- challenge 2
SELECT
film_id,
title
FROM film
WHERE film_id IN (SELECT film_id
FROM inventory
WHERE store_id = 2
GROUP by film_id
HAVING COUNT(*) > 3);

-- challenge 2 alternate
SELECT
f.film_id,
f.title
FROM film f
LEFT JOIN inventory i
ON f.film_id = i.film_id AND i.store_id = 2
GROUP BY f.film_id, f.title
HAVING COUNT(i.film_id)> 3
ORDER BY f.title;

-- challenge 3
SELECT
first_name,
last_name
FROM customer
WHERE customer_id IN (SELECT customer_id
FROM payment
WHERE DATE(payment_date) = '2020-01-25');

-- challenge 4
SELECT
first_name,
email
FROM customer
WHERE customer_id IN (SELECT customer_id FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 30);

-- challenge 5
SELECT
first_name,
last_name
FROM customer c
INNER JOIN address ad
ON c.address_id = ad.address_id AND district = 'California'
WHERE customer_id IN (SELECT customer_id FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 100)
ORDER BY first_name;

-- challenge 5 alternate
SELECT
first_name,
last_name
FROM customer
WHERE customer_id IN (SELECT customer_id FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 100)
AND customer_id IN (SELECT customer_id
FROM customer c
INNER JOIN address ad
ON c.address_id = ad.address_id AND district = 'California');

-- challenge 6
SELECT ROUND(AVG(total_amount_perday),2) FROM
(SELECT SUM(amount) as total_amount_perday,
DATE(payment_date)
FROM payment
GROUP BY DATE(payment_date));

-- challenge 7
SELECT 
*, (SELECT MAX(amount) FROM payment) - amount as difference
FROM payment;

-- challenge 8
SELECT
title,
film_id,
replacement_cost,
rating
FROM film f1
WHERE replacement_cost = (SELECT MIN(replacement_cost) 
FROM film f2 WHERE f1.rating = f2.rating)
ORDER by rating;

-- challege 9
SELECT
title,
film_id,
length,
rating
FROM film f1
WHERE length = (SELECT MAX(length) 
FROM film f2 WHERE f1.rating = f2.rating)
ORDER by rating;

-- challenge 10
SELECT
*
,(SELECT SUM(amount) FROM payment p2 WHERE p1.customer_id = p2.customer_id)
,(SELECT COUNT(amount) FROM payment p3 WHERE p1.customer_id = p3.customer_id)
FROM payment p1
ORDER BY customer_id;

-- challenge 11
SELECT
title,
replacement_cost,
rating,
(SELECT AVG(replacement_cost) FROM film f3 WHERE f1.rating = f3.rating)
FROM film f1
WHERE replacement_cost = (SELECT MAX(replacement_cost) 
FROM film f2 WHERE f1.rating = f2.rating)
ORDER by rating;

-- challenge 12
SELECT
first_name,
-- last_name
amount,
payment_id
FROM customer c
INNER JOIN payment p1
ON c.customer_id = p1.customer_id
WHERE amount = (SELECT MAX(amount) FROM payment p2 WHERE p1.customer_id = p2.customer_id);
-- AND first_name = 'LESLIE';

-- challenge 13
SELECT
first_name,
-- last_name,
MAX(amount)
FROM customer c
INNER JOIN payment p1
ON c.customer_id = p1.customer_id
-- WHERE first_name = 'LESLIE'
GROUP BY first_name;
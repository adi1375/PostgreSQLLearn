SELECT
*,
SUM(amount) OVER (PARTITION BY customer_id)
FROM payment;

SELECT
*,
COUNT(amount) OVER (PARTITION BY customer_id,staff_id)
FROM payment
ORDER BY payment_id;

SELECT *,
SUM(amount) OVER (PARTITION BY customer_id 
ORDER BY payment_date, payment_id)
FROM payment;

SELECT
f.title,
c.name AS category,
f.length,
RANK() OVER(ORDER BY f.length DESC)
FROM film f
LEFT JOIN film_category fc
ON fc.film_id = f.film_id
LEFT JOIN category c 
ON c.category_id = fc.category_id;

SELECT
f.title,
c.name AS category,
f.length,
DENSE_RANK() OVER(PARTITION BY c.name ORDER BY f.length DESC)
FROM film f
LEFT JOIN film_category fc
ON fc.film_id = f.film_id
LEFT JOIN category c 
ON c.category_id = fc.category_id;

SELECT 
*
FROM(
SELECT
f.title,
c.name AS category,
f.length,
DENSE_RANK() OVER(PARTITION BY c.name ORDER BY f.length DESC) as rank
FROM film f
LEFT JOIN film_category fc
ON fc.film_id = f.film_id
LEFT JOIN category c 
ON c.category_id = fc.category_id
)
WHERE rank = 1;

SELECT * FROM
(SELECT 
name,
country,
COUNT(*),
FIRST_VALUE(COUNT(*)) OVER(PARTITION BY country ORDER BY COUNT(*) ASC),
COUNT(*)-FIRST_VALUE(COUNT(*)) OVER(PARTITION BY country ORDER BY COUNT(*) ASC)
FROM customer_list cl
LEFT JOIN payment p
ON cl.id=p.customer_id
GROUP BY name,country);

SELECT * FROM
(SELECT 
name,
country,
COUNT(*),
LEAD(COUNT(*)) OVER(PARTITION BY country ORDER BY COUNT(*) ASC) as rank,
LEAD(COUNT(*)) OVER(PARTITION BY country ORDER BY COUNT(*) ASC) - COUNT(*)
FROM customer_list cl
LEFT JOIN payment p
ON cl.id=p.customer_id
GROUP BY name,country);

SELECT * FROM
(SELECT 
name,
country,
COUNT(*),
LAG(COUNT(*)) OVER(PARTITION BY country ORDER BY COUNT(*) ASC) as rank,
LAG(COUNT(*)) OVER(PARTITION BY country ORDER BY COUNT(*) ASC) - COUNT(*)
FROM customer_list cl
LEFT JOIN payment p
ON cl.id=p.customer_id
GROUP BY name,country);


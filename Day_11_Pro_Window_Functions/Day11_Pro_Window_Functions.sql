-- challenge 1
SELECT
f.film_id,
f.title,
f.length,
c.name AS category,
ROUND(AVG(length) OVER(PARTITION BY c.name),2) AS avg_length_per_category
FROM film f
LEFT JOIN film_category fc
ON fc.film_id = f.film_id
LEFT JOIN category c 
ON c.category_id = fc.category_id
ORDER BY f.film_id;

-- challenge 2
SELECT
*,
COUNT(amount) OVER(PARTITION BY customer_id,amount) AS no_paymenmts_with_that_amount
FROM payment
ORDER BY payment_id;

-- challenge 3
SELECT
flight_id,
departure_airport,
SUM(actual_arrival - scheduled_arrival) OVER(ORDER BY flight_id, departure_airport)
FROM flights;

-- challenge 4
SELECT
flight_id,
departure_airport,
SUM(actual_arrival - scheduled_arrival) OVER(PARTITION BY departure_airport
ORDER BY flight_id, departure_airport)
FROM flights;

-- challenge 5
SELECT * FROM
(SELECT 
name,
country,
COUNT(*),
DENSE_RANK() OVER(PARTITION BY country ORDER BY COUNT(*) DESC) as rank
FROM customer_list cl
LEFT JOIN payment p
ON cl.id=p.customer_id
GROUP BY name,country)
WHERE rank < 4;

-- challenge 6
SELECT
SUM(amount),
DATE(payment_date) as day,
LAG(SUM(amount)) OVER(ORDER BY DATE(payment_date)) AS previous_day,
SUM(amount) - LAG(SUM(amount)) OVER(ORDER BY DATE(payment_date)) AS difference,
ROUND((SUM(amount) - LAG(SUM(amount)) OVER(ORDER BY DATE(payment_date)))/LAG(SUM(amount)) OVER(ORDER BY DATE(payment_date)) * 100,2) AS percentage_growth
FROM payment
GROUP BY DATE(payment_date);

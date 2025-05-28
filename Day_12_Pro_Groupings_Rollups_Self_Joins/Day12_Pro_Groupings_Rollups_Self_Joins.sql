-- challenge 1
SELECT
first_name,
last_name,
staff_id,
SUM(amount)
FROM customer c
LEFT JOIN payment p
ON c.customer_id=p.customer_id
GROUP BY GROUPING SETS((first_name,last_name),(first_name,last_name,staff_id))
ORDER BY first_name,last_name;

-- challenge 2
SELECT
first_name,
last_name,
staff_id,
SUM(amount),
ROUND(SUM(amount)/FIRST_VALUE(SUM(amount)) OVER(PARTITION BY first_name,last_name ORDER BY SUM(amount) DESC)*100,2) AS percentage
FROM customer c
LEFT JOIN payment p
ON c.customer_id=p.customer_id
GROUP BY GROUPING SETS((first_name,last_name),(first_name,last_name,staff_id));

-- challenge 3
SELECT
'Q'||TO_CHAR(book_date,'Q') as quarter,
EXTRACT(month from book_date) as month,
TO_CHAR(book_date,'W') as week_in_month,
DATE(book_date) as day,
SUM(total_amount) as booking_amount
FROM bookings
GROUP BY 
ROLLUP('Q'||TO_CHAR(book_date,'Q'),
EXTRACT(month from book_date),
TO_CHAR(book_date,'W'),
DATE(book_date))
ORDER BY 1,2,3,4;

-- challenge 4
SELECT
p.customer_id,
DATE(p.payment_date),
f.title,
SUM(amount) as total
FROM payment p
INNER JOIN rental r
ON r.rental_id = p.rental_id
INNER JOIN inventory inv
ON r.inventory_id = inv.inventory_id
INNER JOIN film f
ON inv.film_id = f.film_id
GROUP BY
CUBE(p.customer_id,
DATE(p.payment_date),
f.title
)
ORDER BY 1,2,3;

-- challenge 5
SELECT
f1.title,
f2.title,
f1.length
FROM film f1
LEFT JOIN film f2
ON f2.length = f1.length
WHERE f1.title != f2.title
ORDER BY f1.length DESC

-- challenge 6
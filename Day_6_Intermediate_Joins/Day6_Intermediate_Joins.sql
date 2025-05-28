-- challenge 1
SELECT 
s.fare_conditions AS "Fare Conditions",
COUNT(*)
FROM seats AS s
INNER JOIN boarding_passes AS b 
ON s.seat_no = b.seat_no
INNER JOIN flights as f
ON s.aircraft_code = f.aircraft_code AND b.flight_id = f.flight_id
GROUP BY s.fare_conditions
ORDER BY COUNT(*) DESC;

-- challenge 2
SELECT * FROM boarding_passes bp
FULL OUTER JOIN tickets t
ON bp.ticket_no = t.ticket_no
WHERE t.ticket_no is null;

-- challenge 3
SELECT s.seat_no,COUNT(*) FROM seats s
LEFT JOIN boarding_passes bp
ON s.seat_no = bp.seat_no
GROUP BY s.seat_no
ORDER BY COUNT(*) DESC;

-- challenge 4
SELECT RIGHT(s.seat_no,1),COUNT(*) FROM seats s
LEFT JOIN boarding_passes bp
ON s.seat_no = bp.seat_no
GROUP BY RIGHT(s.seat_no,1)
ORDER BY COUNT(*) DESC;

-- challenge 5
SELECT first_name,last_name, phone, district
FROM customer c
LEFT JOIN address a
ON c.address_id = a.address_id
WHERE district = 'Texas';

-- challenge 6
SELECT address
FROM customer c
RIGHT JOIN address a
ON c.address_id = a.address_id
WHERE customer_id is null;

-- challenge 7
SELECT
seat_no,
ROUND(AVG(amount),2)
FROM boarding_passes b
LEFT JOIN ticket_flights t
ON b.ticket_no = t.ticket_no
AND b.flight_id = t.flight_id
GROUP BY seat_no
ORDER BY 2 DESC;

-- challenge 8
SELECT
first_name,
last_name,
email,
country
FROM customer cu
INNER JOIN address a ON cu.address_id = a.address_id
INNER JOIN city ci ON a.city_id = ci.city_id
INNER JOIN country co ON ci.country_id = co.country_id
WHERE country = 'Brazil';

-- challenge 9
SELECT passenger_name,
SUM(total_amount) 
FROM tickets t
INNER JOIN bookings b
ON t.book_ref = b.book_ref
GROUP BY passenger_name
ORDER BY SUM(total_amount) DESC;

-- challenge 10
SELECT passenger_name,
fare_conditions,
COUNT(*)
FROM tickets t
INNER JOIN ticket_flights tf
ON t.ticket_no = tf.ticket_no
WHERE passenger_name = 'ALEKSANDR IVANOV'
GROUP BY passenger_name,fare_conditions;

-- challenge 11
SELECT 
first_name,
last_name,
title,
COUNT(*)
FROM customer cu
INNER JOIN rental re
ON cu.customer_id = re.customer_id
INNER JOIN inventory inv
ON inv.inventory_id=re.inventory_id
INNER JOIN film fi
ON fi.film_id = inv.film_id
WHERE first_name='GEORGE' and last_name='LINTON'
GROUP BY title, first_name, last_name
ORDER BY 4 DESC;
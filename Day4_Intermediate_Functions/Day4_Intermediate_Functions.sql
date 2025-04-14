-- challenge 1
SELECT
LOWER(first_name) AS first_name_lower,
LOWER(last_name) AS last_name_lower,
LOWER(email) as email_lower
FROM customer
WHERE LENGTH(first_name) > 10 OR LENGTH(last_name) > 10;

-- challenge 2
SELECT
RIGHT(email,5),
LEFT(RIGHT(email,4),1)
FROM customer;

-- challenge 3
SELECT
LEFT(email,1) || '***@sakilacustomer.org' AS anonymized_email
FROM customer;

-- challenge 4
SELECT
last_name||','||LEFT(email,POSITION('.' IN email)-1) as full_name
FROM customer;

-- challenge 5
SELECT
LEFT(email,1)
||'***'
||SUBSTRING(email from POSITION ('.' IN email) for 2)
||'***'
||SUBSTRING(email from POSITION('@' IN email)) as anonymized_email
FROM customer;

-- challenge 6
SELECT
'***'
||RIGHT(LEFT(email,POSITION('.' IN email)-1),1)
||SUBSTRING(email from POSITION ('.' IN email) for 2)
||'***'
||SUBSTRING(email from POSITION('@' IN email)) AS anonymized_email
FROM customer;

-- challenge 6 alternate
SELECT
'***'
||SUBSTRING(email from POSITION ('.' IN email)-1 for 3)
||'***'
||SUBSTRING(email from POSITION('@' IN email)) AS anonymized_email
FROM customer;

-- challenge 7
SELECT
EXTRACT(month from payment_date) AS "month",
SUM(amount) AS total_payment_amount
FROM payment
GROUP BY "month"
ORDER BY total_payment_amount DESC;

-- challenge 8
SELECT
EXTRACT(dow from payment_date) AS day_of_week,
SUM(amount) AS total_payment_amount
FROM payment
GROUP BY day_of_week
ORDER BY total_payment_amount DESC;

-- challenge 9
SELECT
EXTRACT(week from payment_date) AS "week",
customer_id,
SUM(amount) AS total_payment_amount
FROM payment
GROUP BY "week", customer_id
ORDER BY total_payment_amount DESC;

-- challenge 10
SELECT
SUM(amount) AS total_amount,
TO_CHAR(payment_date, 'Dy, DD/MM/YYYY') as "day"
FROM payment
GROUP BY "day"
ORDER BY total_amount;

-- challenge 11
SELECT
SUM(amount) AS total_amount,
TO_CHAR(payment_date, 'Mon, YYYY') as "mon_year"
FROM payment
GROUP BY "mon_year"
ORDER BY total_amount;

-- challenge 12
SELECT
SUM(amount) AS total_amount,
TO_CHAR(payment_date, 'Dy, HH:MI') as "day_time"
FROM payment
GROUP BY "day_time"
ORDER BY total_amount DESC;

-- challenge 13
SELECT
customer_id,
return_date-rental_date AS rental_duration
FROM rental
WHERE customer_id = 35;

-- challenge 14
SELECT
customer_id,
AVG(return_date-rental_date) AS avg_rental_duration
FROM rental
GROUP BY customer_id
ORDER BY avg_rental_duration DESC;
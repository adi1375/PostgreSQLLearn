-- SELECT DISTINCT
-- first_name,
-- last_name,
-- email
-- FROM customer
-- ORDER BY last_name DESC, first_name DESC

-- SELECT DISTINCT
-- amount
-- FROM payment
-- ORDER BY amount DESC

-- challenge 1
SELECT DISTINCT
district
FROM address

-- challenge 2
SELECT
rental_date
FROM rental
ORDER BY rental_date DESC
LIMIT 1

-- challenge 3
SELECT
COUNT(title)
FROM film

-- challenge 4
SELECT
COUNT(DISTINCT last_name)
FROM customer
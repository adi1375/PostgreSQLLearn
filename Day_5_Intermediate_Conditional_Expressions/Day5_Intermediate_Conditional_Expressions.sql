-- challenge 1
SELECT
film_id,
ROUND((rental_rate/replacement_cost)*100,2) as percentage
FROM film
WHERE ROUND((rental_rate/replacement_cost)*100,2) < 4
ORDER BY percentage ASC;

-- challenge 2
SELECT
COUNT(*) AS no_of_tickets,
CASE
WHEN total_amount < 20000 THEN 'Low price ticket'
WHEN total_amount BETWEEN 20000 AND 150000-1 THEN 'Mid price ticket'
ELSE 'High price ticket'
END AS ticket_price
FROM bookings
GROUP BY ticket_price;

-- challenge 3
SELECT
COUNT(*) AS no_of_flights,
CASE
WHEN EXTRACT(month from scheduled_departure) IN ('12','1','2') THEN 'Winter'
WHEN EXTRACT(month from scheduled_departure) <=5 THEN 'Spring'
WHEN EXTRACT(month from scheduled_departure) <=8 THEN 'Summer'
ELSE 'Fall'
END AS season
FROM flights
GROUP BY season;

-- challenge 3 alternate
SELECT
COUNT(*) AS no_of_flights,
CASE
WHEN EXTRACT(month from scheduled_departure) IN ('12','1','2') THEN 'Winter'
WHEN EXTRACT(month from scheduled_departure) <=5 THEN 'Spring'
WHEN TO_CHAR(scheduled_departure,'Mon') IN ('Jun','Jul','Aug') THEN 'Summeru'
ELSE 'Fall'
END AS season
FROM flights
GROUP BY season;

-- challenge 4
SELECT
title AS film_title,
CASE
WHEN (rating = 'PG' OR rating = 'PG-13' OR length > 210) THEN 'Great Rating or long(tier 1)'
WHEN (description LIKE '%Drama%' AND length > 90) THEN 'Long Drama(tier 2)'
WHEN (description LIKE '%Drama%' AND length < 90) THEN 'Short Drama(tier 3)'
WHEN rental_rate < 1 THEN 'Very Cheap(tier 4)'
END as tier_list
FROM film
WHERE CASE
WHEN (rating = 'PG' OR rating = 'PG-13' OR length > 210) THEN 'Great Rating or long(tier 1)'
WHEN (description LIKE '%Drama%' AND length > 90) THEN 'Long Drama(tier 2)'
WHEN (description LIKE '%Drama%' AND length < 90) THEN 'Short Drama(tier 3)'
WHEN rental_rate < 1 THEN 'Very Cheap(tier 4)'
END is not null
GROUP BY film_title, tier_list
ORDER BY film_title;

-- challenge 5
SELECT
SUM(CASE WHEN rating = 'G' THEN 1 ELSE 0 END) AS "G",
SUM(CASE WHEN rating = 'R' THEN 1 ELSE 0 END) AS "R",
SUM(CASE WHEN rating = 'NC-17' THEN 1 ELSE 0 END) AS "NC-17",
SUM(CASE WHEN rating = 'PG-13' THEN 1 ELSE 0 END) AS "PG-13",
SUM(CASE WHEN rating = 'PG' THEN 1 ELSE 0 END) AS "PG"
FROM film;

-- challenge 6
SELECT
rental_date,
COALESCE(CAST(return_date AS VARCHAR),'Not Returned') AS return_date
FROM rental
ORDER BY rental_date DESC;

-- challenge 7
SELECT
flight_no,
CAST(REPLACE(flight_no, 'PG','') AS int)
FROM flights;
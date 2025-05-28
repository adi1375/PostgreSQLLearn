-- challenge 1
SELECT
MIN(replacement_cost),
MAX(replacement_cost),
ROUND(AVG(replacement_cost),2) AS average,
SUM(replacement_cost)
FROM film;

-- challenge 2
SELECT
staff_id,
COUNT(amount) AS no_of_payments,
SUM(amount) AS overall_payment
FROM payment
WHERE amount != 0
GROUP BY staff_id;

-- challenge 3
SELECT
DATE(payment_date),
staff_id,
SUM(amount),
COUNT(*)
FROM payment
WHERE amount !=0
GROUP BY DATE(payment_date), staff_id
ORDER By COUNT(*) DESC;

-- challenge 4
SELECT
customer_id,
DATE(payment_date),
ROUND(AVG(amount),2) AS avg_amount,
COUNT(customer_id)
FROM payment
WHERE DATE(payment_date) IN ('2020-04-28','2020-04-29','2020-04-30')
GROUP BY customer_id, DATE(payment_date)
HAVING COUNT(customer_id) > 1
ORDER BY avg_amount DESC
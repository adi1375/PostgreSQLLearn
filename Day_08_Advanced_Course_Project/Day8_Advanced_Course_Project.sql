-- challenge 1
SELECT DISTINCT
replacement_cost
FROM film
ORDER BY replacement_cost;

-- challenge 2
SELECT
COUNT(replacement_cost) as replacment_costs,
CASE
WHEN replacement_cost BETWEEN 9.99 AND 19.99 THEN 'low'
WHEN replacement_cost BETWEEN 20.00 AND 24.99 THEN 'medium'
WHEN replacement_cost BETWEEN 25.00 AND 29.99 THEN 'high'
END as cost_group
FROM film
GROUP BY cost_group;

-- challenge 3
SELECT
f.title,
f.length,
c.name as category 
FROM film f
INNER JOIN film_category fc
ON f.film_id = fc.film_id
INNER JOIN category c
ON fc.category_id = c.category_id
WHERE c.name IN ('Drama','Sports')
ORDER BY f.length DESC;

-- challen ge 4
SELECT
c.name as category,
COUNT(f.title) as no_of_films
FROM film f
INNER JOIN film_category fc
ON f.film_id = fc.film_id
INNER JOIN category c
ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY no_of_films DESC;

-- challenge 5
SELECT
a.first_name,
a.last_name,
COUNT(f.title) as no_of_movies
FROM film f
INNER JOIN film_actor fa
ON f.film_id = fa.film_id
INNER JOIN actor a
ON fa.actor_id = a.actor_id
GROUP BY a.first_name, a.last_name
ORDER BY no_of_movies DESC;

-- challenge 6
SELECT
address
FROM address a
LEFT JOIN customer c
ON a.address_id = c.address_id WHERE c.customer_id is null;

-- challenge 7
SELECT
ci.city,
SUM(amount) as sales_amount
FROM payment p
INNER JOIN customer c
ON p.customer_id = c.customer_id
INNER JOIN address a
ON c.address_id = a.address_id
INNER JOIN city ci
ON a.city_id = ci.city_id
GROUP BY ci.city
ORDER BY sales_amount DESC;

-- challenge 8
SELECT
co.country || ',' || ci.city as "country,city",
SUM(amount) as sales_amount
FROM payment p
INNER JOIN customer c
ON p.customer_id = c.customer_id
INNER JOIN address a
ON c.address_id = a.address_id
INNER JOIN city ci
ON a.city_id = ci.city_id
INNER JOIN country co
ON ci.country_id = co.country_id
GROUP BY "country,city"
ORDER BY sales_amount;

-- challenge 9
SELECT
staff_id,
ROUND(AVG(sales),2) as avg_revenue_per_customer
FROM
(SELECT
staff_id,
customer_id,
SUM(amount) as sales
FROM payment
GROUP BY staff_id, customer_id)
GROUP BY staff_id;

-- challenge 10
SELECT
ROUND(AVG(sunday_revenue),2)
FROM
(SELECT
SUM(amount) as sunday_revenue, DATE(payment_date)
FROM payment
WHERE EXTRACT(dow from payment_date) = 0
GROUP BY DATE(payment_date));

-- challenge 11
SELECT 
title,
length,
replacement_cost
FROM film f1
WHERE length > (SELECT AVG(length) FROM film f2 WHERE f1.replacement_cost = f2.replacement_cost)
ORDER BY length;

-- challenge 12
SELECT
district,
ROUND(AVG(total_per_customer),2) as total_per_district
FROM
(SELECT
district,
p.customer_id,
SUM(amount) as total_per_customer
FROM payment p
INNER JOIN customer c
ON p.customer_id = c.customer_id
INNER JOIN address ad
ON c.address_id = ad.address_id
GROUP BY p.customer_id,district)
GROUP BY district
ORDER BY total_per_district DESC;


-- challenge 13
SELECT 
p1.payment_id,
p1.amount,
c1.name,
(SELECT SUM(amount) as total_revenue_per_category FROM payment p1 
INNER JOIN rental re
ON p1.rental_id = re.rental_id
INNER JOIN inventory inv
ON inv.inventory_id=re.inventory_id
INNER JOIN film fi
ON fi.film_id = inv.film_id
INNER JOIN film_category fc
ON fi.film_id = fc.film_id
INNER JOIN category c2
ON fc.category_id = c1.category_id
WHERE c1.name = c2.name)
FROM payment p1
INNER JOIN rental re
ON p1.rental_id = re.rental_id
INNER JOIN inventory inv
ON inv.inventory_id=re.inventory_id
INNER JOIN film fi
ON fi.film_id = inv.film_id
INNER JOIN film_category fc
ON fi.film_id = fc.film_id
INNER JOIN category c1
ON fc.category_id = c1.category_id
ORDER BY c1.name, p1.payment_id;

-- challenge 14
SELECT 
fi.title,
c1.name,
SUM(amount) as total_overall_revenue 
FROM payment p1 
INNER JOIN rental re
ON p1.rental_id = re.rental_id
INNER JOIN inventory inv
ON inv.inventory_id=re.inventory_id
INNER JOIN film fi
ON fi.film_id = inv.film_id
INNER JOIN film_category fc
ON fi.film_id = fc.film_id
INNER JOIN category c1
ON fc.category_id = c1.category_id
GROUP BY c1.name, fi.title
HAVING SUM(AMOUNT) = (SELECT MAX(total)
FROM (SELECT 
fi.title,
c2.name,
SUM(amount) as total
FROM payment p1 
INNER JOIN rental re
ON p1.rental_id = re.rental_id
INNER JOIN inventory inv
ON inv.inventory_id=re.inventory_id
INNER JOIN film fi
ON fi.film_id = inv.film_id
INNER JOIN film_category fc
ON fi.film_id = fc.film_id
INNER JOIN category c2
ON fc.category_id = c2.category_id
GROUP BY c2.name, fi.title) as subquery
WHERE c1.name = subquery.name)
ORDER BY c1.name
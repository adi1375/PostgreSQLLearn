-- general syntax

WITH cte_name AS(
	--CTE query
	SELECT column1, column2, ...
	FROM table_name
	WHERE condition
)
SELECT column1, column2, ...
FROM cte_name
WHERE condition;

-- challenge 1
WITH customer_totals AS (
SELECT c.customer_id, c.first_name, c.last_name,
COUNT(r.rental_id) AS rental_count,
SUM(p.amount) AS total_amount
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN payment p ON c.customer_id = p.customer_id AND p.rental_id = r.rental_id
GROUP BY c.customer_id, c.first_name, c.last_name
)
SELECT customer_id, first_name, last_name, rental_count, total_amount
FROM customer_totals
WHERE rental_count > (SELECT AVG(rental_count) FROM customer_totals);


-- challenge 2
WITH customer_totals AS (
	SELECT c.customer_id, 
	c.first_name, 
	c.last_name,
	COUNT(r.rental_id) AS rental_count,
	SUM(p.amount) AS total_amount
	FROM customer c
	JOIN rental r ON c.customer_id = r.customer_id
	JOIN payment p ON c.customer_id = p.customer_id AND p.rental_id = r.rental_id
	GROUP BY c.customer_id, c.first_name, c.last_name
),
average_rental_count AS (
    SELECT AVG(rental_count) AS avg_rental_count
    FROM customer_totals
),
high_rental_customer AS (
	SELECT customer_id, first_name, last_name, rental_count, total_amount
	FROM customer_totals ct
	JOIN average_rental_count arc ON ct.rental_count > arc.avg_rental_count
)
SELECT hrc.customer_id, 
hrc.first_name, 
hrc.last_name, 
hrc.rental_count, 
hrc.total_amount, 
f.film_id, 
f.title
FROM high_rental_customer hrc
JOIN rental r ON hrc.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
ORDER BY hrc.customer_id;

-- challenge 2 alternate
WITH customer_totals AS (
	SELECT c.customer_id, c.first_name, c.last_name,
	COUNT(r.rental_id) AS rental_count,
	SUM(p.amount) AS total_amount
	FROM customer c
	JOIN rental r ON c.customer_id = r.customer_id
	JOIN payment p ON c.customer_id = p.customer_id AND p.rental_id = r.rental_id
	GROUP BY c.customer_id, c.first_name, c.last_name
),
high_rental_customer AS (
	SELECT customer_id, first_name, last_name, rental_count, total_amount
	FROM customer_totals
	WHERE rental_count > (SELECT AVG(rental_count) FROM customer_totals)
)
SELECT hrc.customer_id, 
hrc.first_name, 
hrc.last_name, 
hrc.rental_count, 
hrc.total_amount, 
f.film_id, 
f.title
FROM high_rental_customer hrc
JOIN rental r ON hrc.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
ORDER BY hrc.customer_id;

-- challenge 2 alternate
WITH customer_totals AS (
	SELECT c.customer_id, c.first_name, c.last_name,
	COUNT(r.rental_id) AS rental_count,
	SUM(p.amount) AS total_amount
	FROM customer c
	JOIN rental r ON c.customer_id = r.customer_id
	JOIN payment p ON c.customer_id = p.customer_id AND p.rental_id = r.rental_id
GROUP BY c.customer_id, c.first_name, c.last_name
)
SELECT ct.customer_id, ct.first_name, ct.last_name, ct.rental_count, ct.total_amount, 
f.film_id, 
f.title 
FROM customer_totals ct
JOIN rental r ON ct.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE rental_count > (SELECT AVG(rental_count) FROM customer_totals)
ORDER BY ct.customer_id;

-- challenge 3
CREATE TABLE IF NOT EXISTS employee_2 (
    employee_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    manager_id INTEGER REFERENCES employee_2(employee_id)
);
 
-- Insert sample data to establish an employee hierarchy
INSERT INTO employee_2 (employee_id, name, manager_id) VALUES
(1, 'Alice', NULL),       -- Alice is the CEO, no manager
(2, 'Bob', 1),            -- Bob reports to Alice
(3, 'Charlie', 1),        -- Charlie reports to Alice
(4, 'David', 2),          -- David reports to Bob
(5, 'Eve', 2),            -- Eve reports to Bob
(6, 'Frank', 3);          -- Frank reports to Charlie

WITH RECURSIVE subordinate AS(
	SELECT e.employee_id, e.name, e.manager_id, 1 AS level
	FROM employee_2 e
	WHERE employee_id = 1

	UNION ALL

	SELECT e.employee_id, e.name, e.manager_id, s.level+1
	FROM employee_2 e
	JOIN subordinate s ON e.manager_id = s.employee_id
)
SELECT employee_id, name, manager_id
FROM subordinate;

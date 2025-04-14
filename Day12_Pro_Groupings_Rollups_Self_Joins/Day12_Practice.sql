SELECT
TO_CHAR(payment_date,'Month') as month,
staff_id,
SUM(amount)
FROM payment
GROUP BY GROUPING SETS((staff_id), (month), (staff_id,month))
ORDER BY 1,2;

SELECT 
'Q'||TO_CHAR(payment_date,'Q') AS quarter,
EXTRACT(month from payment_date) AS month,
DATE(payment_date),
SUM(amount)
FROM payment
GROUP BY
ROLLUP('Q'||TO_CHAR(payment_date,'Q'),
EXTRACT(month from payment_date),
DATE(payment_date))
ORDER BY 1,2,3;

SELECT
customer_id,
staff_id,
DATE(payment_date),
SUM(amount)
FROM payment
GROUP BY
CUBE(customer_id,staff_id,DATE(payment_date))
ORDER BY 1,2,3;

-- self join
CREATE TABLE employee (
	employee_id INT,
	name VARCHAR (50),
	manager_id INT
);

INSERT INTO employee 
VALUES
	(1, 'Liam Smith', NULL),
	(2, 'Oliver Brown', 1),
	(3, 'Elijah Jones', 1),
	(4, 'William Miller', 1),
	(5, 'James Davis', 2),
	(6, 'Olivia Hernandez', 2),
	(7, 'Emma Lopez', 2),
	(8, 'Sophia Andersen', 2),
	(9, 'Mia Lee', 3),
	(10, 'Ava Robinson', 3);

SELECT * FROM employee;

SELECT
emp.employee_id,
emp.name as employee,
mng.name as manager,
mng2.name as manager_of_manager
FROM employee emp
LEFT JOIN employee mng
ON emp.manager_id = mng.employee_id
LEFT JOIN employee mng2
ON mng.manager_id = mng2.employee_id;

-- cross join
SELECT * FROM staff;

SELECT * FROM store;

SELECT
staff_id,
store.store_id,
last_name,
store.store_id*staff_id
FROM staff
CROSS JOIN store;

-- natural join
SELECT
first_name,
last_name,
SUM(amount)
FROM payment
NATURAL INNER JOIN customer
GROUP BY first_name,last_name
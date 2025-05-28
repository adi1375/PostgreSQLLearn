-- TASK 11

-- TASK 11.1
SELECT
first_name,
position_title,
salary
FROM employees e1
WHERE salary = (SELECT MAX(salary)
				FROM employees e2
				WHERE e1.position_title = e2.position_title);

-- What is the top earner with the position_title SQL Analyst?
-- Answer: 10085.90

-- TASK 11.2
SELECT
first_name,
position_title,
salary,
(SELECT ROUND(AVG(salary),2) AS avg_in_position FROM employees e3 
WHERE e1.position_title = e3.position_title) AS avg_sal 
FROM employees e1
WHERE salary = (SELECT MAX(salary)
				FROM employees e2
				WHERE e1.position_title = e2.position_title);

-- TASK 11.3
SELECT
first_name,
position_title,
salary,
(SELECT ROUND(AVG(salary),2) AS avg_in_position FROM employees e3 
WHERE e1.position_title = e3.position_title)
FROM employees e1
WHERE salary = (SELECT MAX(salary)
				FROM employees e2
				WHERE e1.position_title = e2.position_title)
AND e1.salary != (SELECT ROUND(AVG(salary),2) AS avg_in_position FROM employees e3
				WHERE e1.position_title = e3.position_title);


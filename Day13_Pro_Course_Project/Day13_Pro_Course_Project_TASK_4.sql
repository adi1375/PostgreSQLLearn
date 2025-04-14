-- TASK 4

-- TASK 4.1
SELECT * FROM employees
WHERE first_name = 'Jack';

UPDATE employees
SET position_title = 'Senior SQL Analyst'
WHERE emp_id = 25;

UPDATE employees
SET salary = 7200
WHERE emp_id = 25;

-- TEST
SELECT * FROM employees
WHERE emp_id = 25;

-- TASK 4.2
SELECT * FROM employees
WHERE position_title = 'Customer Support';

UPDATE employees
SET position_title = 'Customer Specialist'
WHERE position_title = 'Customer Support';

-- TEST
SELECT * FROM employees
WHERE position_title = 'Customer Specialist';

-- TASK 4.3
SELECT * FROM employees
WHERE position_title LIKE '%SQL Analyst';

UPDATE employees
SET salary = salary*1.06
WHERE position_title LIKE '%SQL Analyst';

-- TEST
SELECT * FROM employees
WHERE position_title LIKE '%SQL Analyst';

-- TASK 4.4
SELECT ROUND(AVG(salary),2) AS avg_salary_sql_analyst
FROM employees
WHERE position_title = 'SQL Analyst';

-- What is the average salary of a SQL Analyst in the company (excluding Senior SQL Analyst)? 
-- Answer: 8834.75
-- TASK 8

-- TASK 8.1
SELECT
emp_id,
first_name,
last_name,
position_title,
salary,
ROUND(AVG(salary) OVER (PARTITION BY position_title),2) AS avg_position_sal
FROM employees
ORDER BY emp_id;

-- TASK 8.2
SELECT
COUNT(*)
FROM
(SELECT
salary,
ROUND(AVG(salary) OVER (PARTITION BY position_title),2) AS avg_position_sal
FROM employees) AS sub
WHERE sub.salary < sub.avg_position_sal;

-- How many people earn less than there avg_position_salary?
-- Answer: 9
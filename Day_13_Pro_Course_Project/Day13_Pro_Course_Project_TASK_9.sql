-- TASK 9

SELECT
emp_id,
salary,
start_date,
SUM(salary) OVER(ORDER BY start_date) AS running_total_of_salary
FROM employees;

-- What was the total salary after 2018-12-31?
-- Answer: 180202.70

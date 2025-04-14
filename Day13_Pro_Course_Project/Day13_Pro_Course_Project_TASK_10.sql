-- TASK 10

SELECT
emp_id,
salary,
start_date,
SUM(salary) OVER(ORDER BY start_date)
FROM (
SELECT 
emp_id,
salary,
start_date
FROM employees
UNION 
SELECT 
emp_id,
-salary,
end_date
FROM v_employees_info
WHERE is_active ='False'
ORDER BY start_date);

-- What was the total salary after 2018-12-31?
-- Answer: 166802.84

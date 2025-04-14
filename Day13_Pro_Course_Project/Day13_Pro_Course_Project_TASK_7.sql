-- TASK 7

SELECT
d.division,
ROUND(AVG(e.salary),2)
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.division;

-- What is the average salary in the Sales department?
-- Answer: 6107.41
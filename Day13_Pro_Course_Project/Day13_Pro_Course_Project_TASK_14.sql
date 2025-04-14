-- TASK 14

SELECT
*
FROM
(SELECT
e.emp_id,
e.position_title,
d.department,
e.salary,
DENSE_RANK() OVER(PARTITION BY d.department ORDER BY e.salary DESC) AS rank
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id)
WHERE rank = 1;

-- Which employee (emp_id) is the top earner in the department Finance?
-- Answer: 8
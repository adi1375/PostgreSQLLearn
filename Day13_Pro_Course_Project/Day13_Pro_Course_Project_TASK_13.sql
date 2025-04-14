-- TASK 13

SELECT
e.emp_id,
e.position_title,
d.department,
e.salary,
DENSE_RANK() OVER(PARTITION BY d.department ORDER BY e.salary DESC)
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;

-- Which employee (emp_id) is in rank 7 in the department Analytics?
-- Answer: 26
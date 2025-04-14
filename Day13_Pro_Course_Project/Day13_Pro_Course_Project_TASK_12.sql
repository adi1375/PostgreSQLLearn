-- TASK 12

SELECT
d.division,
d.department,
e.position_title,
SUM(e.salary) AS sum_of_salary,
COUNT(*) AS number_of_employees,
ROUND(AVG(e.salary),2) AS avg_salary
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
GROUP BY
ROLLUP(d.division,
d.department,
e.position_title)
ORDER BY d.division;
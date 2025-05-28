-- TASK 5

-- TASK 5.1
SELECT
e1.*,
e2.first_name||' '||e2.last_name AS manager,
CASE
WHEN e1.end_date IS NOT NULL THEN 'False'
ELSE 'True'
END AS is_active
FROM employees e1
LEFT JOIN employees e2
ON e1.manager_id = e2.emp_id
ORDER BY emp_id;

-- TASK 5.2
CREATE VIEW v_employees_info
AS
SELECT
e1.*,
e2.first_name||' '||e2.last_name AS manager,
CASE
WHEN e1.end_date IS NOT NULL THEN 'False'
ELSE 'True'
END AS is_active
FROM employees e1
LEFT JOIN employees e2
ON e1.manager_id = e2.emp_id
ORDER BY emp_id;

-- TEST
SELECT * FROM v_employees_info;

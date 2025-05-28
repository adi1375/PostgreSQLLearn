-- TASK 6

SELECT
position_title,
ROUND(AVG(salary),2) AS avg_salary_per_position
FROM employees
GROUP BY position_title;

-- What is the average salary for a Software Engineer in the company?
-- Answer: 6028
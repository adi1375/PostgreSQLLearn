-- TASK 2

ALTER TABLE employees
ALTER COLUMN department_id SET NOT NULL,
ALTER COLUMN start_date SET DEFAULT CURRENT_DATE,
ADD COLUMN end_date DATE,
ADD CONSTRAINT birth_check CHECK(birth_date < CURRENT_DATE);

-- TEST
SELECT * FROM employees;

ALTER TABLE employees
RENAME COLUMN job_position TO position_title;

-- TEST
SELECT * FROM employees;

-- TASK 1

-- TASK 1.1
CREATE TABLE employees (
emp_id SERIAL PRIMARY KEY,
first_name TEXT NOT NULL,
last_name TEXT NOT NULL,
job_position TEXT NOT NULL,
salary NUMERIC(8,2),
start_date DATE NOT NULL,
birth_date DATE NOT NULL,
store_id INT,
department_id INT,
manager_id INT
);

-- TEST
SELECT * FROM employees;

-- TASK 1.2
CREATE TABLE departments (
department_id SERIAL PRIMARY KEY,
department TEXT NOT NULL,
division TEXT NOT NULL
);

-- TEST
SELECT * FROM departments;



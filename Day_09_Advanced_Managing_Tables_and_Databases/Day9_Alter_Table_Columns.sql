CREATE TABLE director(
director_id SERIAL PRIMARY KEY,
director_account_name VARCHAR(20) UNIQUE,
first_name VARCHAR(50),
last_name VARCHAR(50) DEFAULT 'Not specified',
date_of_birth DATE,
address_id INT REFERENCES address(address_id)
);

SELECT * FROM director;

ALTER TABLE director
ALTER COLUMN director_account_name TYPE VARCHAR(30),
ALTER COLUMN last_name DROP DEFAULT,
ALTER COLUMN last_name SET NOT NULL,
ADD COLUMN IF NOT EXISTS email VARCHAR(40);

SELECT * FROM director;

ALTER TABLE director
RENAME COLUMN director_account_name TO account_name;

SELECT * FROM director;

ALTER TABLE director
RENAME TO directors;

SELECT * FROM directors;
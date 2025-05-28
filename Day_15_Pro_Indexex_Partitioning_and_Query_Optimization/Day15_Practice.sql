-- users and privileges
CREATE USER sarah
WITH PASSWORD 'sarah1234';

-- role =  user + login
CREATE ROLE  alex
WITH LOGIN PASSWORD 'alex1234';

-- practice

-- Create users

CREATE USER ria
WITH PASSWORD 'ria123';


CREATE USER mike
WITH PASSWORD 'mike123';


-- Create roles
CREATE ROLE read_only;
CREATE ROLE read_update;


-- Grant usage (already granted)
GRANT USAGE
ON SCHEMA public
TO read_only;

-- Grant SELECT on tables
GRANT SELECT
ON ALL TABLES IN SCHEMA public
TO read_only;

GRANT read_only
TO mike;

-- Assign read_only to read_update role
GRANT read_only
TO read_update;

-- Grant all privileges on all tables in public to role
GRANT ALL
ON ALL TABLES IN SCHEMA public
TO read_update;


-- Revoke some privileges
REVOKE DELETE, INSERT
ON ALL TABLES IN SCHEMA public
FROM read_update;

-- Assign role to users
GRANT read_update
TO ria;


-- DROP roles
DROP ROLE mike;

DROP ROLE read_update;



-- Removing dependancies
DROP OWNED BY read_update;
DROP ROLE read_update;


-- indexes
SELECT * FROM payment;

SELECT (SELECT AVG(amount) FROM payment p2 WHERE p2.rental_id = p1.rental_id)
FROM payment p1;

CREATE INDEX index_rental_id_payment
ON payment
(rental_id);

DROP INDEX index_rental_id_payment;

SELECT rental_id FROM payment
WHERE rental_id BETWEEN 1 AND 22;

SELECT * FROM payment
LEFT JOIN customer
ON customer.customer_id = payment.customer_id
WHERE payment.customer_id BETWEEN 4 AND 50
ORDER BY 1
LIMIT 100;

-- challenge managing views
CREATE VIEW v_customer_info
AS
SELECT cu.customer_id,
cu.first_name || ' ' || cu.last_name AS name,
a.address,
a.postal_code,
a.phone,
city.city,
country.country
FROM customer cu
JOIN address a ON cu.address_id = a.address_id
JOIN city ON a.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
ORDER BY customer_id;

SELECT * FROM v_customer_info;

ALTER VIEW v_customer_info
RENAME TO v_customer_information;

SELECT * FROM v_customer_information;

ALTER VIEW v_customer_information
RENAME COLUMN customer_id TO c_id;

SELECT * FROM v_customer_information;

CREATE OR REPLACE VIEW v_customer_information
AS
SELECT cu.customer_id as c_id,
cu.first_name || ' ' || cu.last_name AS name,
a.address,
a.postal_code,
a.phone,
city.city,
country.country,
LEFT(cu.first_name,1) || '.' || LEFT(cu.last_name,1) AS initials
FROM customer cu
JOIN address a ON cu.address_id = a.address_id
JOIN city ON a.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
ORDER BY customer_id;

SELECT * FROM v_customer_information;
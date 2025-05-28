-- user defined function
CREATE FUNCTION count_rr (min_r decimal(4,2), max_r decimal(4,2))
RETURNS INT
LANGUAGE plpgsql
AS
$$
DECLARE
movie_count INT;
BEGIN
SELECT COUNT(*)
INTO movie_count
FROM film
WHERE rental_rate BETWEEN min_r AND max_r;
RETURN movie_count;
END;
$$

SELECT count_rr(0,6)


SELECT SUM(amount) FROM payment p
LEFT JOIN customer c
ON c.customer_id=p.customer_id
WHERE (first_name = 'AMY' AND last_name = 'LOPEZ') 

-- transactions
CREATE TABLE acc_balance (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
    amount DEC(9,2) NOT NULL    
);

INSERT INTO acc_balance
VALUES 
(1,'Tim','Brown',2500),
(2,'Sandra','Miller',1600)

SELECT * FROM acc_balance;

BEGIN;
UPDATE acc_balance
SET amount = amount-100
WHERE id = 1;
UPDATE acc_balance
SET amount = amount+100
WHERE id = 2;
COMMIT;

-- rollback
SELECT * FROM acc_balance;

BEGIN;
UPDATE acc_balance
SET amount = amount-100
WHERE id = 1;
UPDATE acc_balance
SET amount = amount+100
WHERE id = 2;
SAVEPOINT s1;
DELETE FROM acc_balance
WHERE id = 1;
ROLLBACK TO SAVEPOINT s1;
COMMIT;

-- stored procedures
SELECT * FROM acc_balance;

CREATE OR REPLACE PROCEDURE sp_transfer 
(transfer_amount INT, sender INT, recipient INT)
LANGUAGE plpgsql
AS
$$
BEGIN
-- add balance
UPDATE acc_balance
SET amount = amount + transfer_amount
WHERE id = recipient;
-- subtract balance
UPDATE acc_balance
SET amount = amount - transfer_amount
WHERE id = sender;
COMMIT;
END;
$$

CALL sp_transfer (400,2,1)

SELECT * FROM acc_balance;


-- for copy purpose
BEGIN;
UPDATE employees
SET position_title = 'Head Of Sales'
WHERE emp_id = 2;
UPDATE employees
SET position_title = 'Head Of BI'
WHERE emp_id = 3;
UPDATE employees
SET salary = 12587.00
WHERE emp_id = 2;
UPDATE employees
SET salary = 14614.00
WHERE emp_id = 3;
COMMIT;

SELECT * from employees
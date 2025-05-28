--challenge delete
SELECT * FROM payment
WHERE payment_id IN (17064,17067);

DELETE FROM payment
WHERE payment_id IN (17064,17067)
RETURNING *;
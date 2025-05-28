-- materialized view practice
CREATE MATERIALIZED VIEW mv_films_category
AS
SELECT
f.title
,f.length
,c.name
FROM film f
INNER JOIN film_category fc
ON fc.film_id = f.film_id
INNER JOIN category c
ON c.category_id = fc.category_id
WHERE c.name IN ('Action','Comedy')
ORDER BY f.length DESC;

SELECT * FROM mv_films_category;

-- Saturn name old value length = 182
UPDATE film
SET length = 192
WHERE title = 'SATURN NAME'; 

SELECT * FROM mv_films_category;

REFRESH MATERIALIZED VIEW mv_films_category;

SELECT * FROM mv_films_category;
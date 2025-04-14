-- challenge view
CREATE VIEW films_category
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

SELECT * FROM films_category;
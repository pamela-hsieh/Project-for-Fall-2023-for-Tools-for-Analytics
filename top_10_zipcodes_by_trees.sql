
SELECT zipcode, COUNT(id)
FROM  trees
GROUP BY zipcode
ORDER BY COUNT(id) DESC
LIMIT 10


WITH TreeCounts AS (
    SELECT zipcodes.zipcode, trees.id
    FROM zipcodes
    LEFT JOIN trees ON ST_Within(trees.geometry, zipcodes.geometry)
)

SELECT zipcode, COUNT(DISTINCT id) AS tree_count
FROM TreeCounts
GROUP BY zipcode
ORDER BY tree_count DESC
LIMIT 10;

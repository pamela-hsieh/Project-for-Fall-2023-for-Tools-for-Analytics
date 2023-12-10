
SELECT zillow_datas.zipcode, TO_CHAR(AVG(zillow_datas.rent), 'FM9,999,999.00') AS average_rent
FROM zillow_datas
JOIN (
    SELECT trees.zipcode, COUNT(trees.id) AS tree_count
    FROM trees
    GROUP BY trees.zipcode
    ORDER BY COUNT(trees.id) DESC
    LIMIT 10
) AS top_trees_zipcodes ON zillow_datas.zipcode = top_trees_zipcodes.zipcode
WHERE zillow_datas.date >= '2023-08-01' AND zillow_datas.date < '2023-09-01'
GROUP BY zillow_datas.zipcode, top_trees_zipcodes.tree_count
ORDER BY top_trees_zipcodes.tree_count DESC

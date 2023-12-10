
WITH Rentranking AS (
    SELECT
        zipcode,
        AVG(rent) AS average_rent,
        ROW_NUMBER() OVER (ORDER BY AVG(rent) ASC) AS low_rank,
        ROW_NUMBER() OVER (ORDER BY AVG(rent) DESC) AS high_rank
    FROM
        zillow_datas
    WHERE
        date = '2023-01-31'
    GROUP BY zipcode
),
top5rent AS (
    SELECT zipcode, average_rent
    FROM Rentranking
    WHERE low_rank <= 5 OR high_rank <= 5
),
complaint AS (
    SELECT zipcode, COUNT(*) as complaint_count
    FROM nyc311s
    WHERE created_date >= TIMESTAMP '2023-01-01 00:00:00'
    AND created_date < TIMESTAMP '2023-01-31 23:59:59'
    GROUP BY zipcode
),
tree AS (
    SELECT zipcode, COUNT(*) as tree_count
    FROM trees
    GROUP BY zipcode
)
SELECT 
    top5rent.zipcode, 
    TO_CHAR(top5rent.average_rent, 'FM9,999,999.00') AS rent, 
    COALESCE(complaint.complaint_count, 0) as complaint_count, 
    COALESCE(tree.tree_count, 0) as tree_count
FROM 
    top5rent
LEFT JOIN 
    complaint ON top5rent.zipcode = complaint.zipcode
LEFT JOIN 
    tree ON top5rent.zipcode = tree.zipcode
ORDER BY top5rent.average_rent DESC;

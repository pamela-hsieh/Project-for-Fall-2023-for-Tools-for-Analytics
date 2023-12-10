
SELECT trees.id, trees.spc_common, trees.health, trees.status, ST_AsText(trees.geometry)
FROM trees
WHERE ST_Distance(trees.geometry, ST_SetSRID(ST_MakePoint(-73.96253174434912, 40.80737875669467), 4326)) <= :pointfive

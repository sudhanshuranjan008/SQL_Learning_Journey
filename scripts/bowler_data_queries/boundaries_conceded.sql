-- ------------------------------------------------------
-- File: boundaries_conceded.sql
-- Date: 2024-11-23
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Step 1: Query to calculate the total boundaries conceded by each bowler.
--         The results are grouped by the 'bowler' column.
--         The HAVING clause ensures that bowlers who have conceded atleast 1 boundary are included.
--         The results are sorted in descending order of total_boundaries conceded.

USE IPL2021_2023;

SELECT Bowler,
       SUM(_4s+_6s) AS total_boundaries
FROM bowlsummary
GROUP BY Bowler
HAVING SUM(_4s+_6s)>0
ORDER BY total_boundaries DESC;
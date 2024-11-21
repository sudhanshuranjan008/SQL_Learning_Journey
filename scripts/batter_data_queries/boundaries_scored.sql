-- ------------------------------------------------------
-- File: boundaries_scored.sql
-- Date: 2024-11-21
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Step 1: Query to calculate the total number of boundaries scored by each batter.
--         Groups results by the 'Batter' column(batter's name) and sorts in descending order by the total number of '_4s + _6s' hit.

USE IPL2021_2023;

SELECT batter,
       SUM(_4s + _6s) AS Boundaries
FROM batsummary
GROUP BY batter
ORDER BY Boundaries DESC;
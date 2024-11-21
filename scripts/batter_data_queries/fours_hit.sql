-- ------------------------------------------------------
-- File: fours_hit.sql
-- Date: 2024-11-21
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Step 1: Query to calculate the total number of fours hit by each batter.
--         Groups results by the 'Batter' column(batter's name) and sorts in descending order by the total number of fours hit.

USE IPL2021_2023;

SELECT batter,
       SUM(_4s) AS Fours_Hit
FROM batsummary
GROUP BY batter
ORDER BY Fours_Hit DESC;
-- ------------------------------------------------------
-- File: half_century_count.sql
-- Date: 2024-11-22
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Step 1: Query to calculate the number of half-centuries(50s) scored by each batter.
--         Groups results by the 'Batter' column(batter's name) and sorts in descending order by the number of half-centuries scored.

USE IPL2021_2023;

SELECT batter,
       COUNT(runs_scored) AS No_of_HalfCenturies
FROM batsummary
WHERE Runs_Scored BETWEEN 50 AND 99                 --The BETWEEN operator is inclusive: begin and end values are included.
GROUP BY batter
ORDER BY No_of_HalfCenturies DESC;
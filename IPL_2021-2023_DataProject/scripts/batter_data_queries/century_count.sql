-- ------------------------------------------------------
-- File: century_count.sql
-- Date: 2024-11-22
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Step 1: Query to calculate the number of centuries(100s) scored by each batter.
--         Groups results by the 'Batter' column(batter's name) and sorts in descending order by the number of centuries scored.

USE IPL2021_2023;

SELECT batter,
       COUNT(runs_scored) AS No_of_Centuries
FROM batsummary
WHERE Runs_Scored>=100
GROUP BY batter
ORDER BY No_of_Centuries DESC;
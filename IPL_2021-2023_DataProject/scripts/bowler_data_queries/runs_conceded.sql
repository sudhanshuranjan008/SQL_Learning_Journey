-- ------------------------------------------------------
-- File: runs_conceded.sql
-- Date: 2024-11-23
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Step 1: Query to calculate the total runs conceded by each bowler.
--         The results are grouped by the 'bowler' column.
--         The results are sorted in descending order of runs_conceded.

USE IPL2021_2023;

SELECT bowler,
       SUM(runs_given) AS Runs_Conceeded
FROM bowlsummary
GROUP BY Bowler
ORDER BY Runs_Conceeded DESC;
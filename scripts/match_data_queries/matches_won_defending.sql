-- ------------------------------------------------------
-- File: matches_won_defending.sql
-- Date: 2024-11-21
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Step 1: Query to calculate the number of matches won by each team while defending.
-- Filters rows where 'Won_by' is 'run' (indicating a win by defending successfully).
-- Groups results by the 'winner' column and sorts in descending order by matches won while defending.

USE IPL2021_2023;

SELECT winner, COUNT(winner) AS Matches_Won_Defending 
FROM matchsummary
WHERE won_by = 'run'
GROUP BY winner
ORDER BY Matches_Won_Defending DESC;

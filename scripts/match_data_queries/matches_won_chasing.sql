-- ------------------------------------------------------
-- File: matches_won_chasing.sql
-- Date: 2024-11-21
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Step 1: Query to calculate the number of matches won by each team while chasing.
-- Filters rows where 'Won_by' is 'wicket' (indicating a win by chasing successfully).
-- Groups results by the 'winner' column and sorts in descending order by matches won while chasing.

USE IPL2021_2023;

SELECT winner, COUNT(winner) AS Matches_Won_Chasing 
FROM matchsummary
WHERE won_by = 'wicket'
GROUP BY winner
ORDER BY Matches_Won_Chasing DESC;

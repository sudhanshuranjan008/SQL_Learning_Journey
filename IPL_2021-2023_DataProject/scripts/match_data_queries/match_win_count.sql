-- ------------------------------------------------------
-- File: match_win_count.sql
-- Date: 2024-11-21
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Step 1: Query to calculate the total number of matches won by each team.
-- Groups results by the 'winner' column and sorts in descending order by the number of matches won.

USE IPL2021_2023;

SELECT winner, COUNT(winner) AS Matches_Won 
FROM matchsummary
GROUP BY winner
ORDER BY Matches_Won DESC;

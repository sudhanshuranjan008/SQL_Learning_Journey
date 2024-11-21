-- ------------------------------------------------------
-- File: matches_won_summary.sql
-- Date: 2024-11-21
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Step 1: Query to calculate the number of matches won by each team while chasing and defending.
-- Groups results by both 'winner' (team name) and 'Won_by' (mode of victory).
-- Sorts results alphabetically by the team name ('winner').

USE IPL2021_2023;

SELECT winner, won_by, COUNT(won_by) AS Matches_Won
FROM matchsummary
GROUP BY winner, won_by
ORDER BY winner;

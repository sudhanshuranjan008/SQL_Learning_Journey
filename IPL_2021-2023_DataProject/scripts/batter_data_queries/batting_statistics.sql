-- ------------------------------------------------------
-- File: batting_statistics.sql
-- Date: 2024-11-21
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Step 1: Query to calculate batting statistics for players who have faced at least 120 balls.
--         This query retrieves the following details for each batter:
--         1. Total runs scored (using SUM on the 'runs_scored' column).
--         2. Average strike rate (using AVG on the 'SR' column).
--         3. Total balls faced (using SUM on the 'balls_faced' column).
--         The results are grouped by the 'batter' column.
--         The HAVING clause ensures that only players who have faced 120 or more balls are included.
--         The results are sorted in descending order of:
--         1. Total runs scored (highest scorers appear first).
--         2. Average strike rate (for players with the same total runs, the higher SR comes first).

USE IPL2021_2023;

SELECT batter, 
       SUM(runs_scored) AS Total_Runs, 
       AVG(SR) AS AVG_SR, 
       SUM(balls_faced) AS Total_Balls 
FROM batsummary
GROUP BY batter
HAVING SUM(balls_faced) >= 120
ORDER BY Total_Runs DESC, AVG_SR DESC;


-- Step 2: How the table looks when we switch the columns in ORDER BY clause?
--         Now the results are sorted in descending order of:
--         1. Average strike rate (highest SR comes first).
--         2. Total runs scored (for players with the same SR, the higher runs comes first).

SELECT batter, 
       SUM(runs_scored) AS Total_Runs, 
       AVG(SR) AS AVG_SR, 
       SUM(balls_faced) AS Total_Balls 
FROM batsummary
GROUP BY batter
HAVING SUM(balls_faced) >= 120
ORDER BY AVG_SR DESC, Total_Runs DESC;


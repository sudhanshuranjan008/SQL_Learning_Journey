-- ------------------------------------------------------
-- File: total_runs_scored.sql
-- Date: 2024-11-21
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Step 1: Query to calculate the total number of runs scored by each batter.
--         Groups results by the 'Batter' column(batter's name) and sorts in descending order by the total number of 'runs_scored'.

USE IPL2021_2023;

SELECT batter,
       sum(runs_scored) AS Total_Runs_Scored
FROM batsummary
GROUP BY batter
ORDER BY Total_Runs_Scored DESC;
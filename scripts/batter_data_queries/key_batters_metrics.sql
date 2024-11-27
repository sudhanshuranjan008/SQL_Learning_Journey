-- ------------------------------------------------------
-- File: key_batters_metrics.sql
-- Date: 2024-11-27
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Query to calculate key performance metrics for each batter in the tournament:
-- 1. Total runs scored by the batter.
-- 2. Average strike rate (AVG_SR) of the batter.
-- 3. Total number of boundaries hit by the batter (4s and 6s).
-- 4. Number of ducks (instances where batter was out with a score of 0).
-- The query includes the following steps:
-- 
-- 1. **SUM(runs_scored)**: Calculates total runs scored by each batter.
-- 2. **AVG(SR)**: Calculates the average strike rate (SR) of the batter.
-- 3. **SUM(_4s+_6s)**: Adds up the number of 4s and 6s to calculate total boundaries.
-- 4. **COUNT(CASE WHEN runs_scored = 0 AND out_or_notout = 'out' THEN 1 END)**: Counts how many times the batter was out without scoring any runs (ducks).
-- 5. **GROUP BY batter, battingteam**: Groups the results by batter and batting team.
-- 6. **HAVING SUM(balls_faced) >= 120**: Ensures only batters who faced at least 120 balls are considered.
-- 7. **ORDER BY Total_Runs DESC, AVG_SR DESC, Total_Boundaries DESC, total_ducks**: 
--    Orders the result by total runs first, then by average strike rate, total boundaries, and ducks.
-- The result will help identify top-performing batters based on multiple metrics.

USE IPL2021_2023;

SELECT Batter,
       BattingTeam,
       SUM(runs_scored) AS Total_Runs, -- Total runs scored by the batter
       AVG(SR) AS AVG_SR, -- Average strike rate of the batter
       SUM(_4s+_6s) AS Total_Boundaries, -- Total boundaries (4s + 6s)
       COUNT (
            CASE
                WHEN runs_scored=0 AND out_or_notout='out' THEN 1 -- Count number of ducks (out with 0 runs)
            END
        ) AS total_ducks
FROM batsummary
GROUP BY batter, battingteam -- Group by batter and batting team
HAVING SUM(balls_faced)>=120 -- Only consider batters who faced 120 or more balls
ORDER BY Total_Runs DESC, AVG_SR DESC, Total_Boundaries DESC, total_ducks; -- Sort by total runs, AVG_SR, Total Boundaries, and Ducks

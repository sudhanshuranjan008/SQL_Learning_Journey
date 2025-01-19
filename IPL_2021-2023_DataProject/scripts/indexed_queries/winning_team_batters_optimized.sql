-- ------------------------------------------------------
-- File: winning_team_batters_optimized.sql
-- Date: 2025-01-19
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Create an optimized index for the batsummary table:
-- 1. The index is created on the Match_ID and BattingTeam columns to improve performance for filtering and joining.
-- 2. The INCLUDE clause includes Batter, runs_scored, and SR columns to make the query more efficient by covering the SELECT clause.
-- This will avoid looking up the full table, as the index itself will contain the necessary data.

USE IPL2021_2023;

CREATE INDEX idx_batsummary_optimized
ON batsummary(Match_ID, BattingTeam)
INCLUDE (Batter, runs_scored, SR);

-- The query selects each batter's total runs (sum of runs_scored) and average strike rate (AVG_SR):
-- 1. Joins the batsummary table with the matchsummary table using the Match_ID.
-- 2. Filters results to include only those where the BattingTeam is the same as the winner in the matchsummary.
-- 3. Groups the results by batter to calculate individual statistics.
-- 4. Orders the results by total_runs (descending) and AVG_SR (descending) for tie-breaking.

SELECT Batter, 
       SUM(Runs_Scored) AS Total_Runs, 
       AVG(SR) AS AVG_SR  
FROM batsummary
JOIN matchsummary ON batsummary.Match_ID = matchsummary.Match_ID
WHERE batsummary.BattingTeam = matchsummary.winner
GROUP BY batter
ORDER BY Total_Runs DESC, AVG_SR DESC;



-- ------------------------------------------------------
-- File: winning_team_bowlers_optimized.sql
-- Date: 2025-01-19
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Create an optimized index for the bowlsummary table:
-- 1. The index is created on Match_ID and BowlingTeam to improve performance for filtering and joining.
-- 2. The INCLUDE clause includes Bowler, Maiden, Wickets, and Economy to make the query more efficient by covering the SELECT clause.
-- This will prevent SQL Server from needing to access the full table, AS the index itself contains the required data.

USE IPL2021_2023;

CREATE index idx_bowlsummary_optimized
ON bowlsummary(Match_ID, BowlingTeam)
INCLUDE (Bowler, Maiden, Wickets, Economy);

-- The query selects each bowler's total wickets, average economy rate, and total maiden overs:
-- 1. Joins the bowlsummary table with the matchsummary table on the Match_ID.
-- 2. Filters the results to include only rows where the BowlingTeam matches the winner in matchsummary.
-- 3. Groups the results by bowler to calculate individual statistics.
-- 4. Orders the results by total_wickets (descending), average economy rate (AScending), and maiden overs (descending).

SELECT Bowler,
       SUM(Wickets) AS Total_Wickets, 
       AVG(Economy) AS AVG_ECO, 
       SUM(maiden) AS Maiden_Overs 
FROM bowlsummary
JOIN matchsummary ON bowlsummary.Match_ID = matchsummary.Match_ID
WHERE BowlingTeam = Winner
GROUP BY Bowler
ORDER BY Total_Wickets DESC, AVG_ECO, Maiden_Overs DESC;

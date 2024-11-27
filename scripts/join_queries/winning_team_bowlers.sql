-- ------------------------------------------------------
-- File: winning_team_bowlers.sql
-- Date: 2024-11-27
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Query to identify the performance of bowlers who played for winning teams.
-- The query aggregates data to calculate total wickets, average economy, and total maiden overs for each bowler.
-- - Joins the `bowlsummary` and `matchsummary` tables on `Match_ID` to access match-level details.
-- - Filters only those records where the bowler's team (`BowlingTeam`) matches the winning team (`winner`) for each match.
-- - Groups the data by bowler to calculate the following metrics:
--    - Total_Wickets: The total number of wickets taken by the bowler for their winning team.
--    - AVG_ECO: The average economy rate of the bowler during their team's wins.
--    - Maiden_Overs: The total number of maiden overs bowled by the bowler for winning matches.
-- - Orders the output by total wickets in descending order, followed by average economy in ascending order, and maiden overs in descending order.

-- Columns in the output:
-- - Bowler: The name of the bowler.
-- - Total_Wickets: Total number of wickets taken.
-- - AVG_ECO: Average economy rate of the bowler.
-- - Maiden_Overs: Total maiden overs bowled.

USE IPL2021_2023;

SELECT bowler, 
       SUM(wickets) AS Total_Wickets, 
       AVG(Economy) AS AVG_ECO, 
       SUM(maiden) AS Maiden_Overs
FROM bowlsummary
JOIN matchsummary 
ON bowlsummary.Match_ID = matchsummary.Match_ID
WHERE BowlingTeam = winner
GROUP BY Bowler
ORDER BY Total_Wickets DESC, AVG_ECO, Maiden_Overs DESC;

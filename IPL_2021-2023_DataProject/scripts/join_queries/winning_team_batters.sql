-- ------------------------------------------------------
-- File: winning_team_batters.sql
-- Date: 2024-11-27
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Query to find batters who contributed the most runs and maintained the best strike rate for winning teams.
-- The query combines data from two tables: `batsummary` and `matchsummary`.
-- - Joins the `bowlsummary` and `matchsummary` tables on `Match_ID` to access match-level details.
-- - Filters only those records where the batter's team (`BattingTeam`) matches the winning team (`winner`) for each match.
-- - Aggregates total runs scored and calculates the average strike rate (AVG_SR) for each batter.
-- - Groups the results by each batter to summarize their contributions.
-- - The output is ordered by total runs scored in descending order, with ties resolved by descending average strike rate.

-- Columns in the output:
-- - Batter: The name of the batter.
-- - Total_Runs: The total number of runs scored by the batter for their winning team.
-- - AVG_SR: The average strike rate of the batter during their team's wins.

USE IPL2021_2023;

SELECT batter, 
       SUM(runs_scored) AS total_runs, 
       AVG(SR) AS AVG_SR
FROM batsummary
JOIN matchsummary 
ON batsummary.Match_ID = matchsummary.Match_ID
WHERE batsummary.BattingTeam = matchsummary.winner
GROUP BY batter
ORDER BY total_runs DESC, AVG_SR DESC;

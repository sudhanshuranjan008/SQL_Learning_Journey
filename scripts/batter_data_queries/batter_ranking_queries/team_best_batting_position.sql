-- ------------------------------------------------------
-- File: team_best_batting_position.sql
-- Date: 2024-11-25
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Query to identify the top batting position in each team based on total runs scored.
-- The query is structured in two parts:
-- 1. A subquery that:
--    - Calculates the total runs scored by each batting position for each team using `SUM(runs_scored)`.
--    - The `ROW_NUMBER()` function ranks each batting position within a team based on the total runs scored, in descending order.
--    - The `PARTITION BY battingteam` ensures rankings are calculated separately for each team.
-- 2. The outer query filters the top-ranked batting position in each team by selecting only those rows where `ranking = 1`.
--    - The final result is ordered by `Total_Runs` in descending order, showing the highest scoring batting positions first.

-- Columns in the output:
-- - BattingTeam: The team name or identifier.
-- - BatPosition: The batting position in the team.
-- - Total_Runs: The total runs scored by the batter at this position.

USE IPL2021_2023;

SELECT BattingTeam,
       BatPosition,
       Total_Runs
FROM (
	SELECT BattingTeam,
           BatPosition,
           SUM(runs_scored) AS Total_Runs,
	       ROW_NUMBER() OVER (
                PARTITION BY battingteam
                ORDER BY SUM(runs_scored) DESC
            ) AS ranking
	FROM batsummary
	GROUP BY BattingTeam, BatPosition
) AS team_bat_position
WHERE ranking = 1
ORDER BY Total_Runs DESC;

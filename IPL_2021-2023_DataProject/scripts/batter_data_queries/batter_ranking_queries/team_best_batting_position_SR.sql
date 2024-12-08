-- ------------------------------------------------------
-- File: team_best_batting_position_SR.sql
-- Date: 2024-11-25
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Query to identify the top batting position in each team based on the highest average strike rate (AVG_SR).
-- The query is structured in two parts:
-- 1. A subquery that:
--    - Calculates the average strike rate (AVG_SR) for each batting position within a team.
--    - The `ROW_NUMBER()` function is used to rank batting positions within each team based on the average strike rate (highest first).
--    - `PARTITION BY battingteam` ensures the ranking is calculated separately for each team.
--    - `HAVING SUM(balls_faced) >= 120` filters out positions where the total number of balls faced is less than 120.
-- 2. The outer query selects only the top-ranked batting position for each team (i.e., `ranking = 1`).
--    - The final result is ordered by `AVG_SR` in descending order, showing the highest average strike rate first.

-- Columns in the output:
-- - BattingTeam: The team name or identifier.
-- - BatPosition: The batting position in the team.
-- - AVG_SR: The average strike rate for that batting position.

USE IPL2021_2023;

SELECT BattingTeam,
       BatPosition,
       AVG_SR
FROM (
	SELECT BattingTeam,
           BatPosition,
           AVG(SR) AS AVG_SR,
	       ROW_NUMBER() OVER (
                PARTITION BY battingteam
                ORDER BY AVG(SR) DESC
            ) AS ranking
	FROM batsummary
	GROUP BY BattingTeam, BatPosition
	HAVING SUM(balls_faced)>=120
) AS team_bat_position_SR
WHERE ranking=1
ORDER BY AVG_SR DESC;
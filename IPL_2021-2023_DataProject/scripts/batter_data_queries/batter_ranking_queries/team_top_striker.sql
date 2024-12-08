-- ------------------------------------------------------
-- File: team_top_striker.sql
-- Date: 2024-11-24
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Query to find the batter with the highest average strike rate (AVG_SR) for each team.
-- The query is structured as follows:
-- 1. A subquery calculates the average strike rate and assigns ranks to batters within each team.
--    - The `ROW_NUMBER()` function is used to rank batters based on descending AVG_SR within each batting team.
--    - The `GROUP BY` ensures we calculate AVG_SR for each batter and batting team combination.
--    - The `HAVING` clause filters out batters who faced fewer than 120 balls.
-- 2. The main query retrieves only the top-ranked batter (rank = 1) for each batting position.
--    - Includes columns: Batting Team, Batter name, and Average Strike Rate (SR).

USE IPL2021_2023;

SELECT battingteam,
       batter, 
       AVG_SR
FROM (
	SELECT BattingTeam,
           Batter,
           AVG(SR) AS AVG_SR,
	       ROW_NUMBER() OVER (
                PARTITION BY BattingTeam
                ORDER BY AVG(SR) DESC
            ) AS ranking
	FROM batsummary
	GROUP BY BattingTeam, Batter
	HAVING SUM(balls_faced)>=120
) AS team_striker
WHERE ranking=1
ORDER BY AVG_SR desc;
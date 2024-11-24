-- ------------------------------------------------------
-- File: team_top_batters.sql
-- Date: 2024-11-24
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Query to find the top-performing batter by total runs_scored for each team.
-- The query is divided into two parts:
-- 1. A Common Table Expression (CTE) named 'teamstar' calculates rankings for batters within each team:
--    - Uses the ROW_NUMBER() function to assign a rank based on descending total runs_scored for each 'BattingTeam'.
--    - The `GROUP BY` ensures we calculate Total_Runs for each batter and batting team combination.
-- 2. The main query retrieves batters ranked #1 (highest run scorer) for each team:
--    - Includes columns: Batting Team, Batter name, and Total Runs Scored.

USE IPL2021_2023;

WITH teamstar AS (
    SELECT BattingTeam,
           Batter,
           SUM(runs_scored) AS Total_Runs,
           ROW_NUMBER() OVER(
                PARTITION BY BattingTeam
                ORDER BY SUM(runs_scored)DESC
                ) AS ranking
    FROM batsummary
    GROUP BY BattingTeam, Batter
)
SELECT BattingTeam, Batter, Total_Runs FROM teamstar
WHERE ranking=1
ORDER BY Total_Runs DESC;
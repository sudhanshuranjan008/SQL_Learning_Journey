-- ------------------------------------------------------
-- File: team_top_hitter.sql
-- Date: 2024-11-25
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Query to find the batter with the top boundary(_4s & _6s) hits for each batting team.
-- The query is structured as follows:
-- 1. A subquery calculates the total boundary hit and assigns ranks to batters within each team.
--    - The `ROW_NUMBER()` function is used to rank batters based on descending boundary count(_4s + _6s) within each batting team.
--    - The `GROUP BY` ensures we calculate boundary count for each batter and batting team combination.
-- 2. The main query retrieves only the top-ranked batter (rank = 1) for each batting position.
--    - Includes columns: Batting Team, Batter name and Total_Boundary_Hit (_4s + _6s).

USE IPL2021_2023;

SELECT battingteam,
       batter,
       Total_Boundary_Hit
FROM (
    SELECT BattingTeam,
           Batter,
           SUM(_4s+_6s) AS Total_Boundary_Hit,
           ROW_NUMBER() OVER (
                PARTITION BY battingteam
                ORDER BY SUM(_4s+_6s) DESC
            ) AS ranking
    FROM batsummary
    GROUP BY BattingTeam, Batter
) AS top_hitter
WHERE ranking=1
ORDER BY Total_Boundary_Hit DESC;
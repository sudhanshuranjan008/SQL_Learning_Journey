-- ------------------------------------------------------
-- File: team_top_bowler.sql
-- Date: 2024-11-26
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Query to find the bowler with the most wickets for each team.
-- The query is divided into:
-- 1. A subquery:
--    - Calculates the total wickets for each bowler in their respective teams.
--    - Uses `ROW_NUMBER()` to rank bowlers within each team based on total wickets in descending order.
-- 2. The outer query:
--    - Selects the top-ranked bowler (`ranking = 1`) for each team.
--    - Includes columns: Bowling Team, Bowler name and Total Wickets taken.

USE IPL2021_2023;

SELECT BowlingTeam, Bowler, Total_Wickets 
FROM (
    SELECT Bowler,
           BowlingTeam, 
           SUM(wickets) AS Total_Wickets,
           ROW_NUMBER() OVER (
                PARTITION BY BowlingTeam
                ORDER BY SUM(wickets) DESC
            ) AS ranking
    FROM bowlsummary
    GROUP BY Bowler, BowlingTeam
) AS teamstar
WHERE ranking = 1
ORDER BY Total_Wickets DESC;

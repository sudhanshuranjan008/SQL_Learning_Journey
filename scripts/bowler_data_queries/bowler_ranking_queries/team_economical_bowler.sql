-- ------------------------------------------------------
-- File: team_economical_bowler.sql
-- Date: 2024-11-26
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Query to find the bowler with the best average economy for each team (minimum 30 overs bowled).
-- The query is structured as follows:
-- 1. A Common Table Expression (CTE):
--    - Calculates the average economy for each bowler in their respective teams.
--    - Uses `ROW_NUMBER()` to rank bowlers within each team based on average economy in ascending order.
--    - The `HAVING` clause filters out bowlers who bowled fewer than 30 overs.
-- 2. The outer query:
--    - Retrieves only the top-ranked bowler (`ranking = 1`) for each team.
--    - Includes columns: Bowler name, Bowling Team and Average Economy.

USE IPL2021_2023;

WITH Economical_Bowler AS
(
    SELECT Bowler,
           BowlingTeam,
           AVG(economy) AS AVG_ECO,
           ROW_NUMBER() OVER (
                PARTITION BY BowlingTeam
                ORDER BY AVG(economy)
            ) AS ranking
    FROM bowlsummary
    GROUP BY Bowler, BowlingTeam
    HAVING SUM(overs) >= 30
)
SELECT Bowler, BowlingTeam, AVG_ECO 
FROM Economical_Bowler
WHERE ranking = 1
ORDER BY AVG_ECO;

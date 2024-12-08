-- ------------------------------------------------------
-- File: bowler_with_most_maiden.sql
-- Date: 2024-11-26
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Query to find the bowler with the most maiden overs for each team (minimum 30 overs bowled).
-- The query is structured as follows:
-- 1. A subquery:
--    - Calculates the total maiden overs (`SUM(Maiden)`) for each bowler in their respective teams.
--    - Uses `ROW_NUMBER()` to rank bowlers within each team based on maiden overs in descending order.
--    - The `HAVING` clause filters out bowlers who bowled fewer than 30 overs.
-- 2. The outer query:
--    - Retrieves only the top-ranked bowler (`ranking = 1`) for each team.
--    - Includes columns: Bowler name, Bowling Team and Maiden_Count.

USE IPL2021_2023;

SELECT Bowler, BowlingTeam, Maiden_Count 
FROM (
    SELECT Bowler,
           BowlingTeam,
           SUM(Maiden) AS Maiden_Count,
           ROW_NUMBER() OVER (
                PARTITION BY BowlingTeam
                ORDER BY SUM(Maiden) DESC
            ) AS ranking
    FROM bowlsummary
    GROUP BY Bowler, BowlingTeam
    HAVING SUM(overs) >= 30
) AS Maiden_Bowled
WHERE ranking = 1
ORDER BY Maiden_Count DESC;

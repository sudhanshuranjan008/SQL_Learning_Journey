-- ------------------------------------------------------
-- File: bowler_with_least_extras.sql
-- Date: 2024-11-26
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Query to find the bowler with the least extras given for each team (minimum 30 overs bowled).
-- The query is structured as follows:
-- 1. A subquery:
--    - Calculates the total extras (`SUM(wides + NoBalls)`) for each bowler in their respective teams.
--    - Uses `ROW_NUMBER()` to rank bowlers within each team based on extras in ascending order.
--    - The `HAVING` clause filters out bowlers who bowled fewer than 30 overs.
-- 2. The outer query:
--    - Retrieves only the top-ranked bowler (`ranking = 1`) for each team.
--    - Includes columns: Bowler name, Bowling Team and Extras_Count.

USE IPL2021_2023;

SELECT Bowler, BowlingTeam, Extras_Count 
FROM (
    SELECT Bowler,
           BowlingTeam,
           SUM(wides + NoBalls) AS Extras_Count,
           ROW_NUMBER() OVER (
                PARTITION BY BowlingTeam
                ORDER BY SUM(wides + NoBalls)
            ) AS ranking
    FROM bowlsummary
    GROUP BY Bowler, BowlingTeam
    HAVING SUM(overs) >= 30
) AS Extras_Given
WHERE ranking = 1
ORDER BY Extras_Count;

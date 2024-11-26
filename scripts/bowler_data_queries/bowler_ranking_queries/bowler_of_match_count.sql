-- ------------------------------------------------------
-- File: bowler_of_match_count.sql
-- Date: 2024-11-26
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Query to find the number of times a bowler has been the best bowler in a match
-- The query works in two steps:
-- 1. A subquery identifies the best bowler for each match:
--    - The `ROW_NUMBER()` function ranks bowlers within each match based on:
--      - Primary sorting by `Wickets` in descending order.
--      - Secondary sorting by `Economy` in ascending order to handle ties.
--    - The `PARTITION BY match_id` ensures rankings are calculated independently for each match.
-- 2. The outer query calculates how many times each bowler has been the best Bowler:
--    - WHERE clause ensures only the top-ranked Bowler (ranking = 1) is considered as the best Bowler of that match.
--    - `COUNT(Match_ID)` counts the number of matches where the Bowler was the top performer.
--    - `GROUP BY Bowler` groups the results by each Bowler.
--    - The results are sorted in descending order of the count to identify the most consistent top performers.

-- Columns in the output:
-- - Bowler: The name of the Bowler.
-- - Bowler_of_Match_Count: The number of matches where the Bowler was identified as the best performer.

USE IPL2021_2023;

SELECT Bowler, COUNT(Match_ID) AS Bowler_of_Match_Count
FROM (
    SELECT Match_ID,
           Match,
           Bowler, 
           Wickets, 
           Economy,
           ROW_NUMBER() OVER (
                PARTITION BY Match_ID
                ORDER BY Wickets DESC, Economy
            ) AS ranking
    FROM bowlsummary
) AS Bowler_of_Match
WHERE ranking = 1
GROUP BY Bowler
ORDER BY Bowler_of_Match_Count DESC;

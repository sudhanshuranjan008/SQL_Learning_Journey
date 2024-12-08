-- ------------------------------------------------------
-- File: bowler_of_match.sql
-- Date: 2024-11-26
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Query to find the best bowler match-wise based on wickets taken and economy rate.
-- The query consists of two parts:
-- 1. A Common Table Expression (CTE) calculates rankings for bowlers within each match.
--    - The `ROW_NUMBER()` function is used to rank bowlers:
--      - Primary sorting is by `Wickets` in descending order.
--      - Secondary sorting is by `Economy` (strike rate) in ascending order to break ties.
--    - The `PARTITION BY match_id` ensures rankings are calculated separately for each match.
-- 2. The outer query:
--    - Retrieves only the top-ranked bowler (`ranking = 1`) for each match.

-- Columns in the output:
-- - Match_ID: Unique identifier for the match.
-- - Match: The name or details of the match.
-- - Bowler: The name of the bowler identified as the best performer.
-- - Wickets: Total wickets taken by the bowler in the match.
-- - Economy: The bowler's Economy(Runs conceded per over) in the match.

USE IPL2021_2023;

WITH Bowler_of_Match AS
(
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
)
SELECT Match_ID, Match, Bowler, Wickets, Economy 
FROM Bowler_of_Match
WHERE ranking = 1;

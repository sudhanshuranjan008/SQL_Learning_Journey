-- ------------------------------------------------------
-- File: batter_of_match.sql
-- Date: 2024-11-25
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Query to identify the best batter in each match based on runs scored and strike rate.
-- The query works as follows:
-- 1. A Common Table Expression (CTE) calculates rankings for batters within each match.
--    - The `ROW_NUMBER()` function is used to rank batters:
--      - Primary sorting is by `Runs_Scored` in descending order.
--      - Secondary sorting is by `SR` (strike rate) in descending order to break ties.
--    - The `PARTITION BY match_id` ensures rankings are calculated separately for each match.
-- 2. The final query retrieves the top-ranked batter (ranking = 1) for each match.

-- Columns in the output:
-- - Match_ID: Unique identifier for the match.
-- - Match: The name or details of the match.
-- - Batter: The name of the batter identified as the best performer.
-- - Runs_Scored: Total runs scored by the batter in the match.
-- - SR: The batter's strike rate in the match.

USE IPL2021_2023;

WITH Batter_of_Match AS (
    SELECT Match_ID,
           Match,
           Batter,
           Runs_Scored,
           SR,
           ROW_NUMBER() OVER (
                PARTITION BY match_id
                ORDER BY Runs_Scored DESC, SR DESC
            ) AS ranking
    FROM batsummary
)
SELECT Match_ID,
       Match,
       Batter,
       Runs_Scored,
       SR
FROM Batter_of_Match
WHERE ranking = 1;

-- ------------------------------------------------------
-- File: batter_of_match_count.sql
-- Date: 2024-11-25
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Query to identify the players who have been the top batter in the most matches.
-- The query works in two steps:
-- 1. A subquery identifies the best batter for each match:
--    - The `ROW_NUMBER()` function ranks batters within each match based on:
--      - Primary sorting by `Runs_Scored` in descending order.
--      - Secondary sorting by `SR` (strike rate) in descending order to handle ties.
--    - The `PARTITION BY match_id` ensures rankings are calculated independently for each match.
-- 2. The outer query calculates how many times each batter has been the best batter:
--    - WHERE clause ensures only the top-ranked batter (ranking = 1) is considered as the best batter of that match.
--    - `COUNT(Match_ID)` counts the number of matches where the batter was the top performer.
--    - `GROUP BY batter` groups the results by each batter.
--    - The results are sorted in descending order of the count to identify the most consistent top performers.

-- Columns in the output:
-- - Batter: The name of the batter.
-- - Batter_of_Match_Count: The number of matches where the batter was identified as the best performer.

USE IPL2021_2023;

SELECT Batter,
       COUNT(Match_ID) AS Batter_of_Match_Count
FROM (
	SELECT Match_ID,
           Batter,
           Runs_Scored,
           SR,
	       ROW_NUMBER() OVER (
                PARTITION BY match_id
                ORDER BY Runs_Scored DESC, SR DESC
            ) AS ranking
	FROM batsummary
) AS Batter_of_Match
WHERE ranking=1
GROUP BY batter
ORDER BY Batter_of_Match_Count DESC;
-- ------------------------------------------------------
-- File: first_batter_all.sql
-- Date: 2024-11-28
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Query to find the lexicographically smallest batter name (Batter) for each team (BattingTeam).
-- The query is structured as follows:
-- 1. The outer query:
--    - Uses `DISTINCT` to ensure unique combinations of BattingTeam and the lexicographically smallest Batter.
--    - Filters Batter for each BattingTeam using a correlated subquery.
--    - Orders the results by Batter in ascending lexicographical order.
-- 2. The correlated subquery:
--    - Retrieves all Batter names within the same BattingTeam.
--    - Ensures the current Batter (`x.Batter`) is smaller than or equal to all other Batter names for the same team.

-- Columns in the output:
-- - BattingTeam: The name of the batting team.
-- - Batter: The lexicographically smallest batter name for the team.

USE IPL2021_2023;

SELECT DISTINCT x.BattingTeam, x.Batter
FROM batsummary x
WHERE x.Batter <= ALL (
    SELECT y.Batter
    FROM batsummary y
    WHERE x.BattingTeam = y.BattingTeam
)
ORDER BY x.Batter;

--Note: If the dataset is large, the ALL operator can be computationally expensive as it requires comparisons for each team.
--      In such cases, it is better to use MIN() with GROUP BY. Here, I have just tried to introduce ALL operator.

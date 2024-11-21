-- ------------------------------------------------------
-- File: boundaries_stats.sql
-- Date: 2024-11-21
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Step 1: Query to show the number of boundaries(_4s and _6s) scored by each batter.
--         Groups results by the 'Batter' column(batter's name)
--         The results are sorted in descending order of:
--         1. Sixes hit (highest six hitter appears first).
--         2. Fours hit (for players with the same Sixes hit, the higher Fours hitter comes first).

USE IPL2021_2023;

SELECT batter,
       SUM(_4s) AS Fours,
       SUM(_6s) AS Sixes
FROM batsummary
GROUP BY batter
ORDER BY Sixes DESC, Fours DESC;
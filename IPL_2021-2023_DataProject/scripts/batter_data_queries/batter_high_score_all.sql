-- ------------------------------------------------------
-- File: batter_high_score_all.sql
-- Date: 2024-11-28
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Query to identify the top scorer (Batter) for each team along with their total runs.
-- The query uses the `ALL` operator to compare each batter's runs with all other batters in the same team.
-- Output includes:
--   - BattingTeam: The name or identifier of the team.
--   - Batter: The top-scoring batter for the team.
--   - Runs_Scored: The total runs scored by the top batter.
-- Results are sorted in descending order of `Runs_Scored`.

USE IPL2021_2023;

SELECT x.BattingTeam, 
       x.Batter, 
       x.Runs_Scored 
FROM batsummary x
WHERE x.Runs_Scored >= ALL (
          -- Subquery to find the maximum runs scored by any batter in the same team.
          SELECT y.Runs_Scored 
          FROM batsummary y
          WHERE x.BattingTeam = y.BattingTeam
      )
-- Sorting results to display the highest runs first.
ORDER BY x.Runs_Scored DESC;


--Note: If the dataset is large, the ALL operator can be computationally expensive as it requires comparisons for each team.
--      In such cases, it is better to use MAX() with GROUP BY. Here, I have just tried to introduce ALL operator.
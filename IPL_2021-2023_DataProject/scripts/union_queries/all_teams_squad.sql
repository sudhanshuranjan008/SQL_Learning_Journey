-- ------------------------------------------------------
-- File: all_teams_squad.sql
-- Date: 2024-11-29
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Query to list all teams and their respective players (both batters and bowlers).
-- The query combines data from the batting and bowling summaries using the UNION operator.
-- This ensures that duplicate records are removed, providing a distinct list of teams and players.

-- The first part of the query:
-- - Selects the batting team and batter from the batting summary table.
-- The UNION operator combines the results of the two SELECT statements.
-- It ensures that only unique rows from both queries are included in the final result.
-- The second part of the query:
-- - Selects the bowling team and bowler from the bowling summary table.

USE IPL2021_2023;

SELECT BattingTeam AS Team,
       Batter AS Player
FROM batsummary
UNION
SELECT BowlingTeam AS Team,
       Bowler AS Player
FROM bowlsummary;

--Note: The UNION operator removes duplicate rows from the combined result set, while UNION ALL includes all rows, allowing duplicates.

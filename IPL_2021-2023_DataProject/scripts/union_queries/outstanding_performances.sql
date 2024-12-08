-- ------------------------------------------------------
-- File: outstanding_performances.sql
-- Date: 2024-11-29
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Query to combine performances of batters and bowlers based on specific criteria.
-- The query is structured as follows:
-- 1. Select batters who have scored 100 or more runs in an innings.
--    - The `CONCAT` function is used to append ' runs' to the Runs_Scored value for better readability.
-- 2. Select bowlers who have taken 5 or more wickets in an innings.
--    - The `CONCAT` function is used to append ' wickets' to the Wickets value for better readability.
-- 3. Use the `UNION ALL` operator to combine both result sets without removing duplicates.

-- Columns in the output:
-- - First column: BattingTeam (for batters) or BowlingTeam (for bowlers) as Team to better specify the column.
-- - Second column: Batter or Bowler name as Player.
-- - Third column: Performance (e.g., '100 runs' or '5 wickets').

USE IPL2021_2023;

SELECT BattingTeam AS Team, 
       Batter AS Player, 
       CONCAT(Runs_Scored, ' runs') AS Performance 
FROM batsummary
WHERE Runs_Scored >= 100
UNION ALL
SELECT BowlingTeam AS Team, 
       Bowler AS Player, 
       CONCAT(Wickets, ' wickets') AS Performance 
FROM bowlsummary
WHERE Wickets >= 5;

--Note: The UNION operator removes duplicate rows from the combined result set, while UNION ALL includes all rows, allowing duplicates.



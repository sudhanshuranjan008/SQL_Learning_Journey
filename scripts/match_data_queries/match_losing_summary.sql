-- ------------------------------------------------------
-- File: match_losing_summary.sql
-- Date: 2024-11-27
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Query Description:
-- The query extracts key match details from the `matchsummary` table, focusing on:
-- - Identifying the losing team.
-- - Renaming `Won_by` as `Lost_by` to clarify the result.
-- - Displaying the match losing margin and the year of the match.

USE IPL2021_2023;

SELECT Match_ID, 
       Team1, 
       Team2, 
       CASE
            -- If Team1 is the winner, then Team2 is the loser. Else, Team1 is the loser.
            WHEN Winner = Team1 THEN Team2
            ELSE Team1
       END AS Loser,  -- Calculating the Loser
       Margin,         -- The margin by which the match has won is also the loss margin
       Won_by AS Lost_by,  -- Renaming `Won_by` to `Lost_by` for clarity, indicating the team that lost
       Year            -- The year of the match
FROM matchsummary;

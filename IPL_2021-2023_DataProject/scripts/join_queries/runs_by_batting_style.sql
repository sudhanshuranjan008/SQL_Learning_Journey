-- ------------------------------------------------------
-- File: runs_by_batting_style.sql
-- Date: 2024-12-07
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Calculate total runs scored by players grouped by batting style.
-- The query performs the following operations:
-- 1. Joins 'teamsummary' and 'batsummary' tables on PlayerName and Batter columns.
-- 2. Groups the data by BattingStyle to aggregate runs scored for each style.
-- 3. Uses the HAVING clause to filter batting styles with total runs greater than zero.
-- 4. Orders the result in descending order of total runs scored.

USE IPL2021_2023;

SELECT BattingStyle,
       SUM(batsummary.Runs_Scored) AS Total_Runs_Scored
FROM teamsummary
JOIN batsummary
ON teamsummary.PlayerName = batsummary.Batter
GROUP BY BattingStyle
HAVING SUM(batsummary.Runs_Scored) > 0
ORDER BY Total_Runs_Scored DESC;

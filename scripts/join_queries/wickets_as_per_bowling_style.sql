-- ------------------------------------------------------
-- File: wickets_as_per_bowling_style.sql
-- Date: 2024-12-07
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- This query calculates the total number of wickets taken by players categorized by their bowling style.
-- The query performs the following:
-- 1. Joins the `teamsummary` table with the `bowlsummary` table based on matching player names.
-- 2. Groups the results by `BowlingStyle` to aggregate the data for each style.
-- 3. Filters the results to include only bowling styles with a positive sum of wickets using the HAVING clause.
-- 4. Orders the results in descending order of total wickets taken.

USE IPL2021_2023;

SELECT BowlingStyle,
       SUM(bowlsummary.Wickets) AS Total_Wickets_Taken
FROM teamsummary
JOIN bowlsummary
ON teamsummary.PlayerName = bowlsummary.Bowler
GROUP BY BowlingStyle
HAVING SUM(bowlsummary.Wickets) > 0
ORDER BY Total_Wickets_Taken DESC;

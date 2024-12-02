-- ------------------------------------------------------
-- File: team_runs_scored_year_wise.sql
-- Date: 2024-12-02
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- This query calculates the total runs scored by each batting team in the years 2021, 2022, and 2023.
-- The inner query joins the batsummary and matchsummary tables on the Match_ID and retrieves the BattingTeam, Runs_Scored, and Year.
-- The PIVOT function is used to convert the years (2021, 2022, 2023) into columns and sum the runs scored for each year.
-- The final result will display the runs scored by each batting team in 2021, 2022, and 2023.
-- The query orders the result by the total runs scored in all three years combined (2021 + 2022 + 2023) in descending order.

USE IPL2021_2023;

SELECT battingteam,
       [2021] AS Runs_Scored_2021,
       [2022] AS Runs_Scored_2022,
       [2023] AS Runs_Scored_2023
FROM
(
    SELECT batsummary.BattingTeam, batsummary.Runs_Scored, matchsummary.Year 
    FROM batsummary
    JOIN matchsummary ON batsummary.Match_ID = matchsummary.Match_ID
) AS src
PIVOT
(
    SUM(runs_scored) 
    FOR year IN ([2021], [2022], [2023])
) AS pvt
ORDER BY ([2021] + [2022] + [2023]) DESC;

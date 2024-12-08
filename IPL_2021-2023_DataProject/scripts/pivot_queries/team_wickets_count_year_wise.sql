-- ------------------------------------------------------
-- File: team_wickets_count_year_wise.sql
-- Date: 2024-12-03
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- This query generates a summary table showing the total wickets taken by each bowling team across the years 2021, 2022, and 2023.
-- It uses the PIVOT operator to transform Year values into columns, aggregating the total wickets for each year.
-- The query first combines bowling data with match year information by joining the bowlsummary and matchsummary tables on Match_ID.
-- Then, it applies the PIVOT operator to create separate columns for each year (2021, 2022, 2023), summing up the wickets.
-- Finally, the output is sorted in descending order based on the total wickets taken across all three years.

USE IPL2021_2023;

SELECT BowlingTeam, 
       [2021], [2022], [2023] 
FROM (
    SELECT bowlsummary.BowlingTeam, 
           bowlsummary.Wickets, 
           matchsummary.Year  
    FROM bowlsummary
    JOIN matchsummary ON bowlsummary.Match_ID = matchsummary.Match_ID
) AS src
PIVOT (
    SUM(Wickets) FOR Year IN ([2021], [2022], [2023])
) AS pvt
ORDER BY ([2021] + [2022] + [2023]) DESC;

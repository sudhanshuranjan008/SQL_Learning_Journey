-- ------------------------------------------------------
-- File: win_count_year_wise.sql
-- Date: 2024-12-02
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- This query counts the number of matches won by each team for the years 2021, 2022, and 2023.
-- We are using the PIVOT function to convert year-wise data into separate columns for each year.
-- The inner query selects the Winner, Year, and Match_ID from the matchsummary table.
-- The PIVOT function counts the number of Match_IDs for each winner and year, converting rows into columns for the years 2021, 2022, and 2023.

USE IPL2021_2023;

SELECT winner, [2021], [2022], [2023] 
FROM 
(
    SELECT Winner, year, Match_ID 
    FROM matchsummary
) AS src
PIVOT
(
    COUNT(match_id) 
    FOR year IN ([2021], [2022], [2023])
) AS pvt;

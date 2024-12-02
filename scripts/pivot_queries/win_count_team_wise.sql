-- ------------------------------------------------------
-- File: win_count_team_wise.sql
-- Date: 2024-12-02
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- This query counts the number of matches won by each team (CSK, KKR, DC, MI, PK, RCB, RR, SRH, GT, LSG) for each year.
-- The inner query retrieves the winner, year, and Match_ID from the matchsummary table.
-- The PIVOT function is used to convert the rows (team wins) into columns for each team (CSK, KKR, etc.).
-- The result shows the count of matches won by each team across the specified years.

USE IPL2021_2023;

SELECT year, [CSK], [KKR], [DC], [MI], [PK], [RCB], [RR], [SRH], [GT], [LSG] 
FROM
(
    SELECT winner, year, Match_ID 
    FROM matchsummary
) AS src
PIVOT
(
    COUNT(match_id) 
    FOR winner IN ([CSK], [KKR], [DC], [MI], [PK], [RCB], [RR], [SRH], [GT], [LSG])
) AS pvt;

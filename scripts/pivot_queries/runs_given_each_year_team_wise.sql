-- ------------------------------------------------------
-- File: runs_given_each_year_team_wise.sql
-- Date: 2024-12-03
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- This query generates a summary table displaying the total runs conceded by each bowling team across different years.
-- It utilizes the PIVOT operator to transform the BowlingTeam values into columns, summing up the runs given by each team per year.
-- The query first joins the bowlsummary and matchsummary tables on Match_ID to associate bowling data with match years.
-- Then, it applies the PIVOT operator to create columns for each team (CSK, MI, KKR, SRH, RR, GT, DC, LSG, PK, RCB) based on the sum of runs given.
-- The output provides a year-wise breakdown of runs conceded by each team.

USE IPL2021_2023;

SELECT Year, 
       [CSK], [MI], [KKR], [SRH], [RR], [GT], [DC], [LSG], [PK], [RCB] 
FROM (
    SELECT bowlsummary.BowlingTeam,
           bowlsummary.Runs_Given,
           matchsummary.Year
    FROM bowlsummary
    JOIN matchsummary ON bowlsummary.Match_ID = matchsummary.Match_ID
) AS src
PIVOT (
    SUM(Runs_Given) FOR BowlingTeam IN ([CSK], [MI], [KKR], [SRH], [RR], [GT], [DC], [LSG], [PK], [RCB])
) AS pvt;

-- ------------------------------------------------------
-- File: USP_total_runs.sql
-- Date: 2024-12-04
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- This stored procedure calculates the total runs scored by each batter
-- It sums the runs scored where runs_scored is greater than 0
-- The results are grouped by batter and ordered in descending order based on the total runs scored

CREATE PROC USP_Total_Runs AS
BEGIN
    SELECT Batter,
           SUM(Runs_Scored) AS Total_Runs
    FROM batsummary
    WHERE Runs_Scored > 0
    GROUP BY Batter
    ORDER BY Total_Runs DESC
END;

-- Execute the stored procedure to display the result
EXEC USP_Total_Runs;

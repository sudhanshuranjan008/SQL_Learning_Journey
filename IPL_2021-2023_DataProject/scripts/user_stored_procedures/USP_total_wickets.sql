-- ------------------------------------------------------
-- File: USP_total_wickets.sql
-- Date: 2024-12-04
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- This stored procedure calculates the total wickets taken by each bowler
-- It sums the wickets taken where wickets is greater than 0
-- The results are grouped by bowler and ordered in descending order based on the total wickets taken

CREATE PROCEDURE USP_Total_Wickets AS
BEGIN
	SELECT Bowler,
           SUM(wickets) AS Total_Wickets
    FROM bowlsummary
	WHERE Wickets>0
	GROUP BY Bowler
	ORDER BY Total_Wickets DESC
END;

-- Execute the stored procedure to display the result
EXECUTE USP_Total_Wickets;
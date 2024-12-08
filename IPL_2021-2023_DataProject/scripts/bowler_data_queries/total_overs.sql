-- ------------------------------------------------------
-- File: total_overs.sql
-- Date: 2024-11-23
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Step 1: Query to calculate the total number of overs bowled by each bowler.
--         The results are grouped by the 'bowler' column.
--         The HAVING clause ensures that bowlers who have bowled are included.
--         The results are sorted in descending order of total_overs bowled.

USE IPL2021_2023;

SELECT Bowler,
       SUM(overs) AS Total_Overs
FROM bowlsummary
GROUP BY Bowler
HAVING SUM(overs)>0
ORDER BY Total_Overs DESC;
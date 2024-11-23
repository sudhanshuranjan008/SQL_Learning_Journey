-- ------------------------------------------------------
-- File: maiden_overs.sql
-- Date: 2024-11-23
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Step 1: Query to calculate the total number of maiden overs(over conceding 0 run) bowled by each bowler.
--         The results are grouped by the 'bowler' column.
--         The HAVING clause ensures that bowlers who have bowled atleast 1 maiden over are included.
--         The results are sorted in descending order of total maiden overs bowled.

USE IPL2021_2023;

SELECT Bowler,
       SUM(maiden) AS [Total Maiden]        --Using [square brackets] for aliases with space characters
FROM bowlsummary
GROUP BY Bowler
HAVING SUM(maiden)>0
ORDER BY [Total Maiden] DESC;
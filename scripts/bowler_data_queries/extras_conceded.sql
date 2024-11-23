-- ------------------------------------------------------
-- File: extras_conceded.sql
-- Date: 2024-11-23
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Step 1: Query to calculate the total number of extras(wides & no balls) bowled by each bowler.
--         The results are grouped by the 'bowler' column.
--         The HAVING clause ensures that bowlers who have bowled atleast 1 extra are included.
--         The results are sorted in descending order of extras conceded.

USE IPL2021_2023;

SELECT Bowler,
       SUM(wides + noballs) AS Extras_Given
FROM bowlsummary
GROUP BY Bowler
HAVING sum(wides + noballs)>0
ORDER BY Extras_Given DESC;
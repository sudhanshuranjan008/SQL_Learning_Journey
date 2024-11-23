-- ------------------------------------------------------
-- File: average_economy.sql
-- Date: 2024-11-23
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Step 1: Query to calculate the average economy of bowler having bowled atleast 30 overs in total.
--         The results are grouped by the 'bowler' column.
--         The HAVING clause ensures that bowlers who have bowled 30 overs or more are included.
--         The results are sorted in ascending order of average economy.

USE IPL2021_2023;

SELECT Bowler,
       AVG(economy) AS AVG_ECO
FROM bowlsummary
GROUP BY Bowler
HAVING SUM(overs)>=30
ORDER BY AVG_ECO;
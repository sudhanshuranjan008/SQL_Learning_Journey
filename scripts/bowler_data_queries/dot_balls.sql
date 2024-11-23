-- ------------------------------------------------------
-- File: dot_balls.sql
-- Date: 2024-11-23
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Step 1: Query to calculate the total number of dot balls(ball conceding 0 run) bowled by each bowler.
--         The results are grouped by the 'bowler' column.
--         The HAVING clause ensures that bowlers who have bowled atleast 1 dot ball are included.
--         The results are sorted in descending order of total dot balls bowled.

USE IPL2021_2023;

SELECT Bowler,
       SUM(_0s) AS [Total dot balls]
FROM bowlsummary
GROUP BY Bowler
HAVING SUM(_0s)>0
ORDER BY [Total dot balls] DESC;
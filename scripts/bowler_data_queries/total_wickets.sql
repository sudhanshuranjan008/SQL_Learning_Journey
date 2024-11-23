-- ------------------------------------------------------
-- File: total_wickets.sql
-- Date: 2024-11-23
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Step 1: Query to calculate the total number of wickets taken by each bowler.
--         The results are grouped by the 'bowler' column.
--         The HAVING clause ensures that bowlers who have taken 0 wickets are not included.
--         The results are sorted in descending order of total_wickets taken.

USE IPL2021_2023;

SELECT Bowler, 
       SUM(wickets) AS total_wickets
FROM bowlsummary
GROUP BY Bowler
HAVING NOT SUM(wickets)=0
ORDER BY total_wickets DESC;

--Note:The HAVING clause was added to SQL because the WHERE keyword cannot be used with aggregate functions.
--     Here I have used NOT with HAVING on purpose just to show use cases, alternative can be 'HAVING SUM(wickets) > 0'
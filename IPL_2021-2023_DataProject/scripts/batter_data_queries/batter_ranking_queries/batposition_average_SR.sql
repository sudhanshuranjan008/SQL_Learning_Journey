-- ------------------------------------------------------
-- File: batposition_average_SR.sql
-- Date: 2024-11-24
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Query to find the batter with the highest average strike rate (AVG_SR) for each batting position.
-- The query is structured as follows:
-- 1. A subquery calculates the average strike rate and assigns ranks to batters within each position.
--    - The `ROW_NUMBER()` function is used to rank batters based on descending AVG_SR within each batting position.
--    - The `GROUP BY` ensures we calculate AVG_SR for each batter and batting position combination.
--    - The `HAVING` clause filters out batters who faced fewer than 120 balls.
-- 2. The main query retrieves only the top-ranked batter (rank = 1) for each batting position.
--    - Includes columns: Batter name, Batting Position, and Average Strike Rate (SR).

USE IPL2021_2023;

SELECT batter,
       batposition, 
       AVG_SR
FROM (
    SELECT batter, 
           batposition, 
           AVG(SR) AS AVG_SR, 
           ROW_NUMBER() OVER (
               PARTITION BY batposition 
               ORDER BY AVG(SR) DESC
           ) AS ranking
    FROM batsummary
    GROUP BY batter, batposition
    HAVING SUM(balls_faced) >= 120
) AS rank_list
WHERE ranking = 1;

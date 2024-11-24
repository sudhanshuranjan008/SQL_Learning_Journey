-- ------------------------------------------------------
-- File: batposition_total_runs.sql
-- Date: 2024-11-24
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Query to find the top-performing batter by total runs scored for each batting position.
-- The query is divided into two parts:
-- 1. A Common Table Expression (CTE) named 'batter_runs' calculates rankings for batters within each batting position:
--    - Uses the ROW_NUMBER() function to assign a rank based on descending total runs_scored for each 'BatPosition'.
--    - The `GROUP BY` ensures we calculate Total_Runs for each batter and batting position combination.
-- 2. The main query retrieves batters ranked #1 (highest total runs_scored) for each batting position:
--    - Includes columns: Batter name, Batting Position and Total Runs Scored

USE IPL2021_2023;

WITH batter_runs AS (
    SELECT batter,
           batposition,
           SUM(Runs_Scored) AS Total_Runs,
           ROW_NUMBER() OVER(
                PARTITION BY batposition
                ORDER BY SUM(runs_scored) DESC
            ) AS ranking
    FROM batsummary
    GROUP BY batter, BatPosition
)
SELECT Batter, BatPosition, Total_Runs FROM batter_runs
WHERE ranking=1;
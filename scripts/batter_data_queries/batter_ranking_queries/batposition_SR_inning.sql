-- ------------------------------------------------------
-- File: batposition_SR_inning.sql
-- Date: 2024-11-24
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Query to find the top-performing batter by strike rate (SR) for each batting position in an inning.
-- The query is divided into two parts:
-- 1. A Common Table Expression (CTE) named 'rank_list' calculates rankings for batters within each batting position:
--    - Uses the ROW_NUMBER() function to assign a rank based on descending SR for each 'BatPosition'.
--    - Filters batters who faced at least 10 balls ('Balls_Faced >= 10').
-- 2. The main query retrieves batters ranked #1 (highest SR) for each batting position:
--    - Includes columns: Batter name, Batting Position, Runs Scored, and Strike Rate (SR).

USE IPL2021_2023;

WITH rank_list AS (
    SELECT batter, 
           BatPosition, 
           Runs_Scored, 
           SR, 
           ROW_NUMBER() OVER (PARTITION BY BatPosition ORDER BY SR DESC) AS ranking
    FROM batsummary
    WHERE Balls_Faced >= 10
)
SELECT Batter, 
       BatPosition, 
       Runs_Scored, 
       SR 
FROM rank_list
WHERE ranking = 1;

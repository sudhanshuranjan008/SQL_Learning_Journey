-- ------------------------------------------------------
-- File: total_balls_faced.sql
-- Date: 2024-11-21
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Step 1: Query to calculate the total number of balls faced by each batter.
--         Groups results by the 'Batter' column(batter's name) and sorts in descending order by the total number of 'Balls_Faced'.

USE IPL2021_2023;                                       --Selects the desired database

SELECT Batter,
       SUM(Balls_Faced) AS Total_Balls_Faced            --SUM() is an aggregate function for adding row's values
FROM batsummary
GROUP BY batter
ORDER BY Total_Balls_Faced DESC;
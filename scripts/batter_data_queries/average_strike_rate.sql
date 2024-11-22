-- ------------------------------------------------------
-- File: average_strike_rate.sql
-- Date: 2024-11-22
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Step 1: Query to calculate average batting strike rate for batters who have faced at least 120 balls.
--         This query retrieves the average strike rate (using AVG on the 'SR' column).
--         The results are grouped by the 'batter' column.
--         The HAVING clause ensures that only players who have faced 120 or more balls are included.
--         The results are sorted in descending order of Average Strike Rate


USE IPL2021_2023;

SELECT batter,
       ROUND(AVG(SR),2) AS AVG_SR   --The ROUND() function rounds a number to a specified number of decimal places. Here 2 decimal places
FROM batsummary
GROUP BY batter
HAVING SUM(balls_faced)>=120
ORDER BY AVG_SR DESC;
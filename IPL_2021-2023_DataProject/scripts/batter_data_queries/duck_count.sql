-- ------------------------------------------------------
-- File: duck_count.sql
-- Date: 2024-11-22
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Step 1: Query to calculate the number of ducks(0s) scored by each batter.(Ducks are counted only when batter gets out on 0)
--         Groups results by the 'Batter' column(batter's name) and sorts in descending order by the number of ducks scored.

USE IPL2021_2023;

SELECT batter, 
       COUNT(runs_scored) AS No_of_Ducks
FROM batsummary
WHERE Runs_Scored=0 AND OUT_or_NOTOUT='out'
GROUP BY Batter
ORDER BY No_of_Ducks DESC;
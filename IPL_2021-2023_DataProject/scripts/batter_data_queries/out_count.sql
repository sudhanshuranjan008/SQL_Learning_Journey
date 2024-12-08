-- ------------------------------------------------------
-- File: out_count.sql
-- Date: 2024-11-22
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Step 1: Query to calculate the number of times each batter got OUT.
--         Groups results by the 'Batter' column(batter's name) and sorts in descending order by the OUT Count.

USE IPL2021_2023;

SELECT batter,
       COUNT(out_or_notout) AS OUT_Count
FROM batsummary
WHERE OUT_or_NOTOUT='out'
GROUP BY batter
ORDER BY OUT_Count DESC;
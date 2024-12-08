-- ------------------------------------------------------
-- File: notout_count.sql
-- Date: 2024-11-22
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Step 1: Query to calculate the number of times each batter remained NOTOUT.
--         Groups results by the 'Batter' column(batter's name) and sorts in descending order by the NOTOUT Count.

USE IPL2021_2023;

SELECT Batter,
       COUNT(out_or_notout) AS NOTOUT_Count
FROM batsummary
WHERE OUT_or_NOTOUT='not_out'
GROUP BY batter
ORDER BY NOTOUT_Count DESC;
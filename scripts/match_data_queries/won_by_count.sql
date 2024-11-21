-- ------------------------------------------------------
-- File: won_by_count.sql
-- Date: 2024-11-21
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Step 1: Query to calculate the number of matches won by runs and wickets.
--         'Won_by' indicates the mode of victory: 'run' for defending successfully, 'wicket' for chasing successfully.

USE IPL2021_2023;                                   --Selects the desired database

SELECT won_by, COUNT(won_by) AS No_of_Matches       --Count() is an aggregate function used for counting rows in a set
FROM matchsummary                                   -- AS keyword is used to give an alias name here the count column as No_of_Matches
GROUP BY won_by;                                    --The GROUP BY statement groups rows that have the same values into summary rows


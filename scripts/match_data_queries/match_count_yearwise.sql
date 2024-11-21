-- ------------------------------------------------------
-- File: match_count_yearwise.sql
-- Date: 2024-11-21
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Step 1: Query to calculate the number of matches played each year.
-- Aggregates the total number of matches based on the 'year' column.

USE IPL2021_2023;                                   --Selects the desired database

SELECT year, COUNT(match_id) AS No_of_Matches       --Count() is an aggregate function used for counting rows in a set
FROM matchsummary                                   --AS keyword is used to give an alias name here the count column as No_of_Matches
GROUP BY year;                                      --The GROUP BY statement groups rows that have the same values into summary rows

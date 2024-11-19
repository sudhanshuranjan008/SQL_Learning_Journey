-- ------------------------------------------------------
-- File: order_by_batter.sql
-- Description: This script uses 'ORDER BY' keyword to order the data in ascending or descending.
-- Date: 2024-11-19
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Step 1: Select batter and runs_scored from 'batsummary' table and order by runs_scored ascending
USE IPL2021_2023                                    --Switch to desired database

SELECT Batter, Runs_Scored FROM batsummary             
ORDER BY Runs_Scored;                                --Orders by runs_scored column in asc by default
                                                     --Alternatively, use 'ORDER BY runs_scored ASC;'

-- Step 2: Select batter and runs_scored from 'batsummary' table and order by batter descending
SELECT Batter, Runs_Scored FROM batsummary
ORDER BY Batter DESC;                               --Orders by batter column in desc order

-- Step 3: Select batter, runs_scored and battingteam from 'batsummary' and order by runs_scored and batter both
SELECT Batter, Runs_Scored, BattingTeam FROM batsummary
ORDER BY Runs_Scored DESC, Batter;                   --Primary sort is done by runs_scored column, then secondary sort is done by batter
                                                     --Secondary sort is used to break the tie if any


-- Note: These queries are helpful in sorting the table as per demand.
--       Conditions can also be inserted using CASE expression in ORDER BY, it will be covered in advanced queries.
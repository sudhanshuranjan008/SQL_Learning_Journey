-- ------------------------------------------------------
-- File: order_by_bowler.sql
-- Description: This script uses 'ORDER BY' keyword to order the data in ascending or descending.
-- Date: 2024-11-19
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Step 1: Select bowler and overs from 'bowlsummary' table and order by overs ascending
USE IPL2021_2023                                    --Switch to desired database

SELECT Bowler, Overs FROM bowlsummary             
ORDER BY Overs;                                     --Orders by overs column in asc by default
                                                    --Alternatively, use 'ORDER BY Overs ASC;'

-- Step 2: Select bowler and wickets from 'bowlsummary' table and order by wickets descending
SELECT Bowler, Wickets FROM bowlsummary
ORDER BY Wickets DESC;                               --Orders by wickets column in desc order

-- Step 3: Select bowler and wickets from 'bowlsummary' and order by wickets and bowler both
SELECT Bowler, Wickets, BowlingTeam FROM bowlsummary
ORDER BY Wickets DESC, Bowler;                       --Primary sort is done by wickets column, then secondary sort is done by bowler
                                                     --Secondary sort is used to break the tie if any


-- Note: These queries are helpful in sorting the table as per demand.
--       Conditions can also be inserted using CASE expression in ORDER BY, it will be covered in advanced queries.
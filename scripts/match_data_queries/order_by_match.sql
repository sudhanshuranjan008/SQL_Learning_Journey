-- ------------------------------------------------------
-- File: order_by_match.sql
-- Description: This script uses 'ORDER BY' keyword to order the data in ascending or descending.
-- Date: 2024-11-19
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Step 1: Select winner team and win margin from 'matchsummary' table and order by margin ascending
USE IPL2021_2023                                    --Switch to desired database

SELECT Winner, Margin FROM matchsummary             
ORDER BY Margin;                                    --Orders by margin column in asc by default
                                                    --Alternatively, use 'ORDER BY Margin ASC;'

-- Step 2: Select winner, margin and won_by from 'matchsummary' table and order by winner descending
SELECT Winner, Margin, Won_by FROM matchsummary
ORDER BY Winner DESC;                               --Orders by winner column in desc order

-- Step 3: Select winner, margin and won_by from 'matchsummary' and order by margin and won_by both
SELECT Winner, Margin, Won_by FROM matchsummary
ORDER BY Margin DESC, Won_by;                       --Primary sort is done by margin column, then secondary sort is done by won_by
                                                    --Secondary sort is used to break the tie if any


-- Note: These queries are helpful in sorting the table as per demand.
--       Conditions can also be inserted using CASE expression in ORDER BY, it will be covered in advanced queries.
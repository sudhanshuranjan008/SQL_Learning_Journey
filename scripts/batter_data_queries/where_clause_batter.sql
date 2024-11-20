-- ------------------------------------------------------
-- File: where_clause_batter.sql
-- Description: Below scripts introduces 'WHERE' clause. It is helpful in filtering data
--              by introducing conditions.
-- Date: 2024-11-20
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Step 1: Select the batter details when batter is ViratKohli
USE IPL2021_2023;                       --Selects the desired database

SELECT * FROM batsummary                --'*' selects all columns in the table
WHERE Batter = 'ViratKohli';            -- where clause ensures only including rows with batter as 'ViratKohli'

-- Step 2: Select all the batter details where runs_scored is greater than 49 and arrange in desc
SELECT * FROM batsummary
WHERE Runs_Scored >= 50
ORDER BY Runs_Scored DESC;                   --Where clause will always precede order by in a select statement

-- Note: WHERE clause is used with many operators like 'IN', 'LIKE', wildcards(%, _) etc.
--       All these operators will be used in advanced queries.
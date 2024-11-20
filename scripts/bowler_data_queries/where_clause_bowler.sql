-- ------------------------------------------------------
-- File: where_clause_bowler.sql
-- Description: Below scripts introduces 'WHERE' clause. It is helpful in filtering data
--              by introducing conditions.
-- Date: 2024-11-20
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Step 1: Select the bowler details when bowler is SunilNarine
USE IPL2021_2023;                       --Selects the desired database

SELECT * FROM bowlsummary               --'*' selects all columns in the table
WHERE Bowler = 'SunilNarine';           -- where clause ensures only including rows with bowler as SunilNarine

-- Step 2: Select the bowler details when wickets is greater than 2 and order in desc
SELECT * FROM bowlsummary
WHERE Wickets >= 3
ORDER BY Wickets DESC;                   --Where clause will always precede order by in a select statement

-- Note: WHERE clause is used with many operators like 'IN', 'LIKE', wildcards(%, _) etc.
--       All these operators will be used in advanced queries.
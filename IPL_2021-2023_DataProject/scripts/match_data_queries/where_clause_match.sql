-- ------------------------------------------------------
-- File: where_clause_match.sql
-- Description: Below scripts introduces 'WHERE' clause. It is helpful in filtering data
--              by introducing conditions.
-- Date: 2024-11-20
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Step 1: Select the match details when winner is CSK
USE IPL2021_2023;                       --Selects the desired database

SELECT * FROM matchsummary              --'*' selects all columns in the table
WHERE Winner = 'CSK';                   -- where clause ensures only including rows with winner as CSK

-- Step 2: Select the match details of year 2021 and order all by margin descending
SELECT * FROM matchsummary
WHERE YEAR=2021
ORDER BY Margin DESC;                   --Where clause will always precede order by in a select statement

-- Note: WHERE clause is used with many operators like 'IN', 'LIKE', wildcards(%, _) etc.
--       All these operators will be used in advanced queries.



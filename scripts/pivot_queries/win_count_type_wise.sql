-- ------------------------------------------------------
-- File: win_count_type_wise.sql
-- Date: 2024-12-02
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- This query counts the number of matches won by either 'run' or 'wicket' for each winner.
-- The inner query retrieves the winner, won_by, and match_id from the matchsummary table.
-- The PIVOT function is used to convert the rows (match outcomes 'run' and 'wicket') into columns.
-- The final result will display the count of matches won by 'run' or 'wicket' for each winner.
-- The query orders the result by the total number of wins (run + wicket) in descending order.

USE IPL2021_2023;

SELECT winner, [run], [wicket] 
FROM
(
    SELECT winner, won_by, match_id 
    FROM matchsummary
) AS src
PIVOT
(
    COUNT(match_id) 
    FOR won_by IN ([run], [wicket])
) AS pvt
ORDER BY run + wicket DESC;

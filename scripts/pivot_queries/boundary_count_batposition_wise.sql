-- ------------------------------------------------------
-- File: boundary_count_batposition_wise.sql
-- Date: 2024-12-03
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- This query generates a summary table showing the total boundaries (fours and sixes) hit by each batting position (1 to 11) for all teams.
-- It uses the PIVOT operator to transform BatPosition values into columns, aggregating the total boundaries for each position.
-- The query first calculates total boundaries for each BattingTeam and BatPosition.
-- Then, it applies the PIVOT operator to create separate columns for each batting position (1 to 11).
-- Finally, the output is sorted in descending order based on boundaries scored by each position, starting with position 1.

USE IPL2021_2023;

SELECT BattingTeam, 
       [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11] 
FROM (
    SELECT BattingTeam, 
           BatPosition, 
           SUM(_4s + _6s) AS Boundaries 
    FROM batsummary
    GROUP BY BattingTeam, BatPosition
) AS src
PIVOT (
    SUM(Boundaries) FOR BatPosition IN ([1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11])
) AS pvt
ORDER BY [1] DESC, [2] DESC, [3] DESC, [4] DESC, [5] DESC, 
         [6] DESC, [7] DESC, [8] DESC, [9] DESC, [10] DESC, [11] DESC;

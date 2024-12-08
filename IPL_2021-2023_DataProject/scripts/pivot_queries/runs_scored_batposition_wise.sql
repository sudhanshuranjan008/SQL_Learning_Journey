-- ------------------------------------------------------
-- File: runs_scored_batposition_wise.sql
-- Date: 2024-12-03
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- This query generates a table summarizing the total runs scored by each batting position (1 to 11) for all teams.
-- It uses the PIVOT operator to transform BatPosition values into columns, and aggregates the Runs_Scored for each team.
-- The results are sorted in descending order of runs scored for each batting position, starting with position 1.

USE IPL2021_2023;

SELECT BattingTeam,
       [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11] 
FROM (
    SELECT BattingTeam, 
           BatPosition, 
           Runs_Scored 
    FROM batsummary
) AS src
PIVOT (
    SUM(Runs_Scored) FOR BatPosition IN ([1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11])
) AS pvt
ORDER BY [1] DESC, [2] DESC, [3] DESC, [4] DESC, [5] DESC, 
         [6] DESC, [7] DESC, [8] DESC, [9] DESC, [10] DESC, [11] DESC;

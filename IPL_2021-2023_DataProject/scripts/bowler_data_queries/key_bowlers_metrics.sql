-- ------------------------------------------------------
-- File: key_bowlers_metrics.sql
-- Date: 2024-11-27
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Query to calculate key bowling performance metrics for each bowler in the tournament:
-- 1. Total overs bowled by the bowler.
-- 2. Total number of wickets taken by the bowler.
-- 3. Average economy rate (runs per over).
-- 4. Total maiden overs bowled (overs with no runs).
-- 5. Total dot balls bowled (balls with no runs).
-- 6. Total extras (wides and no-balls) given by the bowler.
-- The query includes the following steps:
--
-- 1. **SUM(overs)**: Calculates the total number of overs bowled by each bowler.
-- 2. **SUM(wickets)**: Sums the total number of wickets taken by the bowler.
-- 3. **AVG(economy)**: Calculates the average economy rate (economy is runs per over).
-- 4. **SUM(maiden)**: Sums the number of maiden overs bowled by the bowler.
-- 5. **SUM(_0s)**: Sums the number of dot balls bowled (balls with no runs).
-- 6. **SUM(wides + noballs)**: Sums the number of extras given by the bowler (wides + no-balls).
-- 7. **GROUP BY Bowler, BowlingTeam**: Groups the results by bowler and bowling team.
-- 8. **HAVING SUM(overs) >= 30**: Only consider bowlers who have bowled at least 30 overs.
-- 9. **ORDER BY Total_Wickets DESC, AVG_ECO, Maidens_Bowled DESC, Dot_Balls DESC, Extras_Given**
--    : Orders the results by total wickets first, then by economy, maidens bowled, dot balls, and extras given.
-- The result will help identify top-performing bowlers based on multiple metrics.

USE IPL2021_2023;

SELECT Bowler, 
       BowlingTeam, 
       SUM(overs) AS Overs_Bowled, -- Total overs bowled by the bowler
       SUM(wickets) AS Total_Wickets, -- Total wickets taken by the bowler
       AVG(economy) AS AVG_ECO, -- Average economy rate (runs per over)
       SUM(maiden) AS Maidens_Bowled, -- Total maiden overs bowled (overs with no runs)
       SUM(_0s) AS Dot_Balls, -- Total dot balls bowled (balls with no runs)
       SUM(wides + noballs) AS Extras_Given -- Total extras given by the bowler (wides + no-balls)
FROM bowlsummary
GROUP BY Bowler, BowlingTeam -- Group by bowler and bowling team
HAVING SUM(overs) >= 30 -- Only consider bowlers who have bowled at least 30 overs
ORDER BY Total_Wickets DESC, AVG_ECO, Maidens_Bowled DESC, Dot_Balls DESC, Extras_Given; -- Sort by total wickets, average economy, maidens bowled, dot balls, and extras given

-- ------------------------------------------------------
-- File: player_of_the_match.sql
-- Date: 2024-11-29
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- This query identifies the "Player of the Match" based on both batting and bowling performances.
-- The query is structured in two parts:
-- 1. The first part (WITH Player_Ranking) combines the batting and bowling data:
--    - From the `batsummary` table, it calculates the `Points` for batters based on their runs scored (with 1 point per run).
--    - From the `bowlsummary` table, it calculates the `Points` for bowlers based on the number of wickets taken (with 25 points per wicket).
--    - The `ROW_NUMBER()` function is used to rank batters and bowlers separately within each match based on their performance (Runs/SR for batters and Wickets/Economy for bowlers).
--    - `UNION ALL` is used to combine the batting and bowling data, ensuring all records are included without eliminating duplicates.
-- 2. The second part selects the top-ranked player (based on points) from the combined dataset:
--    - The inner query further ranks the players based on their points, with a separate ranking for each match.
--    - The outer query filters out the top-ranked player for each match by using `Final_Rank = 1`.
--    - The final result is ordered by `Player_Points` in descending order, ensuring the highest point scorer is listed first.

-- The output includes:
-- - Match_ID: The match identifier.
-- - Team: The team name.
-- - Player: The name of the top-ranked player (either batter or bowler).
-- - Player_Points: The points earned by the player based on their performance.

USE IPL2021_2023;

WITH Player_Ranking AS (
    SELECT Match_ID,
           BattingTeam AS Team,
           Batter AS Player,
           Runs_Scored * 1 AS Points,  -- Batting points based on runs scored
           ROW_NUMBER() OVER(
                PARTITION BY Match_ID ORDER BY Runs_Scored DESC, SR DESC
            ) AS Ranking
    FROM batsummary
    UNION ALL  -- Combining batting and bowling data, retaining all records
    SELECT Match_ID,
           BowlingTeam AS Team,
           Bowler AS Player,
           Wickets * 25 AS Points,  -- Bowling points based on wickets taken (25 points per wicket)
           ROW_NUMBER() OVER(
                PARTITION BY Match_ID ORDER BY Wickets DESC, Economy
            ) AS Ranking
    FROM bowlsummary
)
SELECT Match_ID,
       Team,
       Player,
       Points AS Player_Points  -- Final points for the top player in the match
FROM (
    SELECT Match_ID,
           Team,
           Player,
           Points,
           ROW_NUMBER() OVER(
                PARTITION BY Match_ID ORDER BY Points DESC
            ) AS Final_Rank
    FROM Player_Ranking
    WHERE Ranking = 1  -- Ensuring we only select the top player from each dataset (batting/bowling)
) AS Player_of_the_Match
WHERE Final_Rank = 1  -- Selecting the top player based on points
ORDER BY Player_Points DESC;  -- Sorting by highest points

--Note: This is not the most efficient way to find the player of the match. This just shows how we can make use of UNION ALL operator.

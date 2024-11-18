-- ------------------------------------------------------
-- File: create_table_bowlsummary.sql
-- Description: This script creates the 'bowlsummary' table for tracking IPL bowler statistics
--              from the years 2021 to 2023. The table will contain multiple columns and rows 
-- Date: 2024-11-18
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Step 1: Create a new table for IPL bowler statistics
--Description: This query inserts bowling statistics from the 'Bowling_Summary' table
--              in the 'cricket' database into the 'bowlsummary' table of the current database.
--              This dataset contains player bowling data for the IPL seasons from 2021 to 2023.
--              The source table 'Bowling_Summary' is assumed to have the same structure
--              as the target table 'bowlsummary' but data type and column names have been modified in next steps. 

SELECT * INTO bowlsummary
FROM Cricket.dbo.Bowling_Summary

-- Step 2: Update column names of table 'bowlsummary'
--Description: Updated many column names to better specify the column data.
--             Used SQL stored procedure to rename the columns

EXEC sp_rename 'bowlsummary.match_id', 'Match_ID', 'COLUMN';            --Match ID to distinguish between matches played
EXEC sp_rename 'bowlsummary.match', 'Match', 'COLUMN';                  --Match info like team1 vs team2
EXEC sp_rename 'bowlsummary.bowlingTeam', 'BowlingTeam', 'COLUMN';      --Team to which bowler belongs to
EXEC sp_rename 'bowlsummary.bowlername', 'Bowler', 'COLUMN';            --Bowler's name
EXEC sp_rename 'bowlsummary.overs', 'Overs', 'COLUMN';                  --Overs bowled by a bowler in a match
EXEC sp_rename 'bowlsummary.maiden', 'Maiden', 'column';                --Maiden(0 runs given) overs bowled by bowler in a match
EXEC sp_rename 'bowlsummary.runs', 'Runs_Given', 'column';              --Runs given by bowler while bowling
EXEC sp_rename 'bowlsummary.wickets', 'Wickets', 'column';              --Wickets(getting batter out) taken by a bowler
EXEC sp_rename 'bowlsummary.economy', 'Economy', 'column';              --Economy(Runs_Given by bowler per over) of bowler
EXEC sp_rename 'bowlsummary.wides', 'Wides', 'column';                  --Wide balls(illegal delivery costs 1 run) bowled by bowler
EXEC sp_rename 'bowlsummary.noBalls', 'NoBalls', 'column';              --No balls(illegal delivery costs 1 run and free hit) bowled by bowler

-- Step 3: Update column's data types of table 'bowlsummary'
--Description: Updated data type of many columns as in the older table 'Bowling_Summary'
--             most columns were using nvarchar for integer and float values

ALTER TABLE bowlsummary
ALTER column Overs float;

ALTER TABLE bowlsummary
ALTER column Maiden tinyint;

ALTER TABLE bowlsummary
ALTER column Runs_Given tinyint;

ALTER TABLE bowlsummary
ALTER column Wickets tinyint;

ALTER TABLE bowlsummary
ALTER column Economy float;

ALTER TABLE bowlsummary
ALTER column _0s tinyint;

ALTER TABLE bowlsummary
ALTER column _4s tinyint;

ALTER TABLE bowlsummary
ALTER column _6s tinyint;

ALTER TABLE bowlsummary
ALTER column Wides tinyint;

ALTER TABLE bowlsummary
ALTER column NoBalls tinyint;
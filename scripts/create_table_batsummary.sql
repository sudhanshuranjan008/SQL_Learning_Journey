-- ------------------------------------------------------
-- File: create_table_batsummary.sql
-- Description: This script creates the 'batsummary' table for tracking IPL batter statistics
--              from the years 2021 to 2023. The table will contain multiple columns and rows 
-- Date: 2024-11-18
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Step 1: Create a new table for IPL batter statistics

CREATE TABLE batsummary(
	Match_ID nvarchar(50) NOT NULL,          --Match ID to distinguish between matches played
	Match nvarchar(50) NOT NULL,             --Match info like team1 vs team2
	BattingTeam nvarchar(50) NOT NULL,       --Team to which batter belongs to
	BatPosition tinyint NOT NULL,            --Batting position of the batter, this can be between 1 to 11
	Batter nvarchar(50) NOT NULL,            --Batter's name
	OUT_or_NOTOUT nvarchar(10) NOT NULL,     --Batter info whether he was out or not out in the match
	Runs_Scored tinyint NOT NULL,            --How many runs batter scored
	Balls_Faced tinyint NOT NULL,            --How many balls batter faced
	_4s tinyint NOT NULL,                    --How many Fours(a boundary) batter scored
	_6s tinyint NOT NULL,                    --How many Sixes(a boundary: Maximum) batter scored
	SR float NULL);                          -- Strike Rate of the batter in the match, i.e SR=(runs_scored/balls_faced)*100

--Step 2: Insert data from an existing table in another databse
--Description: This query inserts batting statistics from the 'batting_summary3yearsdataset' table
--              in the 'cricket' database into the 'batsummary' table of the current database.
--              This dataset contains player batting data for the IPL seasons from 2021 to 2023.
--              The source table 'batting_summary3yearsdataset' is assumed to have the same structure
--              as the target table 'batsummary'. 

INSERT INTO batsummary
SELECT * FROM cricket.dbo.batting_summary3yearsdataset;



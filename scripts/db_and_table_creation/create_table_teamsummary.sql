-- ------------------------------------------------------
-- File: create_table_teamsummary.sql
-- Description: This script creates the 'teamsummary' table for tracking IPL team/player details
--              from the years 2021 to 2023. The table will contain multiple columns and rows 
-- Date: 2024-11-30
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Step 1: Create a new table for IPL team details
USE IPL2021_2023;

CREATE TABLE teamsummary(
	[Player Name] NVARCHAR(50) NOT NULL,        -- Name of the Player (using 'sqaure brackets' as there is a 'space' in column name)
	Team NVARCHAR(50) NOT NULL,                 -- Team name of the player
	[Batting Style] NVARCHAR(50) NOT NULL,      -- Batting style of the player
	[Bowling Style] NVARCHAR(50) NOT NULL,      -- Bowling style of the player
	[Playing Role] NVARCHAR(50) NOT NULL);      -- Role of the player in the team


--Step 2: Insert data from an existing table in another databse
--Description: This query inserts team details from the 'Players' table
--              in the 'cricket' database into the 'teamsummary' table of the current database.
--              This dataset contains team data for the IPL seasons from 2021 to 2023.
--              The source table 'Players' is assumed to have the same structure
--              as the target table 'teamsummary'. 

INSERT INTO teamsummary
SELECT * FROM Cricket.dbo.players;
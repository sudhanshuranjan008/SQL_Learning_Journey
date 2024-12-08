-- ------------------------------------------------------
-- File: create_table_matchsummary.sql
-- Description: This script creates the 'matchsummary' table for tracking IPL match statistics
--              from the years 2021 to 2023. The table will contain multiple columns and rows 
-- Date: 2024-11-18
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Step 1: Create a new table for IPL match statistics

CREATE TABLE matchsummary(
	Team1 nvarchar(10) NULL,        --Name of first team
	Team2 nvarchar(10) NULL,        --Name of second team
	Winner nvarchar(10) NULL,       --Name of winning team
	Margin tinyint NULL,            --Margin of the win, this can be by runs(for defending team) or by wicket(for chasing team)
	Won_by nvarchar(10) NULL,       --Type of win, i.e. by run or wicket
	Year int NULL,                  --Year in which match was played
	Match_ID nvarchar(50) NULL);    --Match ID to distinguish between matches played

--Step 2: Insert data from an existing table in another databse
--Description: This query inserts match statistics from the '[MATCH SUMMARY]' table
--              in the 'cricket' database into the 'matchsummary' table of the current database.
--              This dataset contains match data for the IPL seasons from 2021 to 2023.
--              The source table '[MATCH SUMMARY]' is assumed to have the same structure
--              as the target table 'matchsummary'. 

INSERT INTO matchsummary
SELECT * FROM Cricket.dbo.[MATCH SUMMARY];
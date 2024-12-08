-- ------------------------------------------------------
-- File: basic_select_bowler.sql
-- Description: This script uses SELECT statement to retrieve data from 'bowlsummary' table.
-- Date: 2024-11-19
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Step 1: Use SELECT statement to retrieve all data of 'bowlsummary'

USE IPL2021_2023;                           --Switch to the desired database

SELECT * FROM bowlsummary;                 --'*' Selects all data in the table

-- Step 2: List out values from an individual column

SELECT Bowler FROM bowlsummary;            --Selects Bowler column from table

-- Step 3: List two or multiple columns in a table

SELECT BowlingTeam, Bowler, Wickets FROM bowlsummary;    --',' is used to separate column names to list from table    


-- Note: This is basic SELECT query to retrieve column or table data.
--       It is quite helpful when finding about table schemas or type of data table stores.

-- ------------------------------------------------------
-- File: basic_select_batter.sql
-- Description: This script uses SELECT statement to retrieve data from 'batsummary' table.
-- Date: 2024-11-19
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Step 1: Use SELECT statement to retrieve all data of 'batsummary'

USE IPL2021_2023;                           --Switch to the desired database

SELECT * FROM batsummary;                 --'*' Selects all data in the table

-- Step 2: List out values from an individual column

SELECT Batter FROM batsummary;            --Selects Batter column from table

-- Step 3: List two or multiple columns in a table

SELECT Batter , Runs_Scored, Balls_Faced FROM batsummary;    --',' is used to separate column names to list from table    


-- Note: This is basic SELECT query to retrieve column or table data.
--       It is quite helpful when finding about table schemas or type of data table stores.

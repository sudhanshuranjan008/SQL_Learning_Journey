-- ------------------------------------------------------
-- File: basic_select_match.sql
-- Description: This script uses SELECT statement to retrieve data from 'matchsummary' table.
-- Date: 2024-11-19
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Step 1: Use SELECT statement to retrieve all data of 'matchsummary'

USE IPL2021_2023;                           --Switch to the desired database

SELECT * FROM matchsummary;                 --'*' Selects all data in the table

-- Step 2: List out values from an individual column

SELECT Winner FROM matchsummary;            --Selects Winner column from table

-- Step 3: List two or multiple columns in a table

SELECT Winner, Margin FROM matchsummary;    --',' is used to separate column names to list from table    


-- Note: This is basic SELECT query to retrieve column or table data.
--       It is quite helpful when finding about table schemas or type of data table stores.

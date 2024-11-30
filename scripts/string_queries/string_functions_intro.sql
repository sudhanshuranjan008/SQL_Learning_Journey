-- ------------------------------------------------------
-- File: string_functions_intro.sql
-- Date: 2024-11-30
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Description: Demonstrates the use of various SQL string functions on IPL data.

USE IPL2021_2023;

-- 1. Convert batter name to uppercase
SELECT Batter, UPPER(Batter) AS Uppercase_Name
FROM batsummary;

-- 2. Convert bowler name to lowercase
SELECT Bowler, LOWER(Bowler) AS Lowercase_Name
FROM bowlsummary;

-- 3. Reverse the names of batters
SELECT Batter, REVERSE(Batter) AS Reversed_Name
FROM batsummary;

-- 4. Count the characters in bowler names
SELECT Bowler, LEN(Bowler) AS Name_Length
FROM bowlsummary;

-- 5. Select the first 4 characters from batter's name
SELECT Batter, LEFT(Batter, 4) AS First_4_Chars
FROM batsummary;

-- 6. Select the last 4 characters from bowler's name
SELECT Bowler, RIGHT(Bowler, 4) AS Last_4_Chars
FROM bowlsummary;

-- 7. Find the character index of 'a' in batter names
SELECT Batter, CHARINDEX('a', Batter, 1) AS Char_Index
FROM batsummary;

-- 8. Find a substring of length 5 from the end of batter names
SELECT Batter, SUBSTRING(Batter, LEN(Batter) - 4, 5) AS Substring_End_5
FROM batsummary;

-- 9. Find a substring of length 4 from the start of bowler names
SELECT Bowler, SUBSTRING(Bowler, 1, 4) AS Substring_Start_4
FROM bowlsummary;

-- ------------------------------------------------------
-- File: USP_get_match_details.sql
-- Date: 2024-12-05
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- this script creates and demonstrates a stored procedure named usp_get_match_details
-- the procedure:
-- 1. takes the winning team name as an input parameter (@WinningTeam)
-- 2. uses two output parameters:
--    - @Champ: stores the name of the winning team
--    - @windetails: stores the match details, combining the margin and the mode of victory (won_by)
-- the procedure fetches the details of the match for the given winning team from the matchsummary table

-- create the stored procedure
CREATE PROCEDURE USP_Get_Match_Details
@WinningTeam NVARCHAR(50), -- input parameter for the winning team name
@Champ NVARCHAR(50) OUTPUT, -- output parameter for storing the winner name
@WinDetails NVARCHAR(50) OUTPUT -- output parameter for storing the victory details
AS
BEGIN
    -- fetch the winner and victory details for the given team
    SELECT 
        @Champ = Winner, -- assign the winner name to the @Champ variable
        @WinDetails = CONCAT(Margin, ' ', Won_by) -- assign formatted victory details to @windetails
    FROM matchsummary
    WHERE Winner = @WinningTeam; -- filter for the specified winning team
END;

-- demonstrate the execution of the stored procedure
-- declare variables to hold the output parameters
DECLARE @Champion NVARCHAR(50); -- variable to hold the winner name
DECLARE @Details NVARCHAR(50); -- variable to hold the victory details

-- execute the stored procedure with input and capture the output
EXECUTE USP_Get_Match_Details 'CSK', @Champion OUT, @Details OUT;

-- display the results
SELECT @Champion AS WINNING_TEAM, @Details AS VICTORY_DETAILS;

SELECT Winner,
       CONCAT(Margin, ' ', Won_by) AS Details
FROM matchsummary
WHERE Winner = 'CSK'

--Note: The output will be only 1 row as:
--Output Parameters Hold Only the Last Value:
--Output parameters (@champ and @windetails) in this procedure are scalar (single-valued).
--When the query in this procedure executes, it assigns a value to these parameters for every row where the WHERE condition matches.
--However, only the last value assigned to these parameters is retained, as output parameters cannot hold multiple values.
--If the goal is to return all matches for a team, the SELECT query approach is most appropriate.
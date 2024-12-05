-- ------------------------------------------------------
-- File: USP_GetTeamSquad_encrypted.sql
-- Date: 2024-12-05
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- This stored procedure retrieves the unique batters and bowlers of a specific team
-- It takes the team name as an input parameter (@team) and fetches:
-- 1. Unique batters from the batsummary table where the batting team matches the input team
-- 2. Unique bowlers from the bowlsummary table where the bowling team matches the input team
-- Query uses join to create the full squad of the team
-- The procedure is encrypted, preventing its definition from being viewed after creation

ALTER PROCEDURE USP_Get_Team_Squad
@Team NVARCHAR(50)
WITH ENCRYPTION
AS
BEGIN
    -- retrieve unique batters for the given team
    SELECT DISTINCT Batter AS Players 
    FROM batsummary
    WHERE BattingTeam = @Team

    -- combine with unique bowlers for the given team
    UNION

    SELECT DISTINCT Bowler 
    FROM bowlsummary
    WHERE BowlingTeam = @Team
END;

-- Execute the stored procedure to display the result
EXECUTE USP_Get_Team_Squad @Team = 'KKR';

-- Now, if we try to get query details, the message will say it's encrypted and will not show query
sp_helptext USP_Get_Team_Squad;
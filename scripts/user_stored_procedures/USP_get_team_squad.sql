-- ------------------------------------------------------
-- File: USP_get_team_squad.sql
-- Date: 2024-12-04
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- This stored procedure retrieves the unique batters and bowlers of a specific team
-- It takes the team name as an input parameter (@team) and fetches batters from the batsummary table
-- and bowlers from the bowlsummary table who belong to the given team
-- The query combines the distinct batters and bowlers using UNION to make the full squad

CREATE PROCEDURE USP_Get_Team_Squad
@team NVARCHAR(50)
AS
BEGIN
    SELECT DISTINCT Batter AS Players
    FROM batsummary
    WHERE BattingTeam = @team

    UNION

    SELECT DISTINCT Bowler AS Players
    FROM bowlsummary
    WHERE BowlingTeam = @team
END;


-- Execute the stored procedure to display the result
EXEC USP_Get_Team_Squad @team = 'CSK';

--system stored procedure to get query of already created user's stored procedures
--It helps us find the details of any stored procedures unless it's encrypted

sp_helptext USP_Get_Team_Squad;

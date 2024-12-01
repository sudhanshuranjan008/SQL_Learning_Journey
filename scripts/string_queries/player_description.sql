-- ------------------------------------------------------
-- File: player_description.sql
-- Date: 2024-12-01
-- Author: Sudhanshu Ranjan
-- ------------------------------------------------------

-- Create a description for each player by combining various attributes like PlayerName, Team, BattingStyle, BowlingStyle and PlayingRole
-- Replacing 'Not Bowling' with 'wicket-keeper' in BowlingStyle if applicable
-- Ordering the result by PlayerName

USE IPL2021_2023;

SELECT PlayerName,
       CONCAT(
           PlayerName, 
           ' represents ', Team, ' in IPL. ', 
           'He is a ', BattingStyle, ', ',
           REPLACE(BowlingStyle, 'Not Bowling', 'wicket-keeper'),
           '. He plays as ', PlayingRole
       ) AS Player_Description
FROM teamsummary
ORDER BY PlayerName;

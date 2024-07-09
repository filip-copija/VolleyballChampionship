BEGIN TRANSACTION;

DELETE FROM Player_Statistics WHERE player_id IN (SELECT player_id FROM Players);

DELETE FROM Matches WHERE home_team_id IN (SELECT team_id FROM Teams) OR away_team_id IN (SELECT team_id FROM Teams);

DELETE FROM Players WHERE team_id IN (SELECT team_id FROM Teams);

DELETE FROM Teams WHERE team_id IN (SELECT team_id FROM Teams);

DELETE FROM Seasons WHERE season_id IN (SELECT season_id FROM Seasons);

DELETE FROM Referees WHERE referee_id IN (SELECT referee_id FROM Referees);

COMMIT TRANSACTION;

CREATE NONCLUSTERED INDEX idx_team_id_players ON Players (team_id);

CREATE NONCLUSTERED INDEX idx_match_id_player_statistics ON Player_Statistics (match_id);

CREATE NONCLUSTERED INDEX idx_player_id_player_statistics ON Player_Statistics (player_id);

CREATE NONCLUSTERED INDEX idx_home_team_id_matches ON Matches (home_team_id);

CREATE NONCLUSTERED INDEX idx_away_team_id_matches ON Matches (away_team_id);

GO
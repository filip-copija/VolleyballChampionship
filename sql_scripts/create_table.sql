CREATE TABLE Teams (
    team_id INT PRIMARY KEY CLUSTERED,
    team_name VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL
);
GO

CREATE TABLE Players (
    player_id INT PRIMARY KEY CLUSTERED,
    player_name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    position VARCHAR(50) NOT NULL,
    team_id INT FOREIGN KEY REFERENCES Teams(team_id)
);
GO

CREATE TABLE Matches (
    match_id INT PRIMARY KEY CLUSTERED,
    match_date DATE NOT NULL,
    match_location VARCHAR(100) NOT NULL,
    home_team_id INT FOREIGN KEY REFERENCES Teams(team_id),
    away_team_id INT FOREIGN KEY REFERENCES Teams(team_id),
    match_result VARCHAR(50) NOT NULL
);
GO

CREATE TABLE Player_Statistics (
    status_id INT PRIMARY KEY CLUSTERED,
    player_id INT FOREIGN KEY REFERENCES Players(player_id),
    match_id INT FOREIGN KEY REFERENCES Matches(match_id),
    points INT NOT NULL,
    assists INT NOT NULL,
    blocks INT NOT NULL
);
GO

CREATE TABLE Seasons (
    season_id INT PRIMARY KEY CLUSTERED,
    start_year INT NOT NULL,
    end_year INT NOT NULL
);
GO

CREATE TABLE Referees (
    referee_id INT PRIMARY KEY CLUSTERED,
    referee_name VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL
);
GO

-- Table created to monitor ETL process inserts
CREATE TABLE InsertLog (
    log_id INT IDENTITY(1,1) PRIMARY KEY,
    table_name VARCHAR(100),
    insert_count INT,
    insert_time DATETIME DEFAULT GETDATE()
);
GO
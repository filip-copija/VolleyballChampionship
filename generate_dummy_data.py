import pandas as pd
from faker import Faker
import random

fake = Faker()

def generate_teams():
    # Generate data for `Teams` table
    teams = []
    for i in range(1, 101):  # 100 teams 
        teams.append({
            'team_id': i,
            'team_name': fake.company().replace(',', ''),
            'country': fake.country()
        })

    teams_df = pd.DataFrame(teams)
    teams_df.to_csv('dummy_data/teams.csv', index=False)
    return teams_df

def generate_players(teams_df):
    # Generate data for `Players` table
    positions = ['Setter', 'Outside Hitter', 'Middle Blocker', 'Opposite Hitter', 'Libero']
    players = []
    team_ids = teams_df['team_id'].tolist()
    
    player_id = 1
    for team_id in team_ids:
        for _ in range(10):  # 10 players per team
            players.append({
                'player_id': player_id,
                'player_name': fake.name(),
                'date_of_birth': fake.date_of_birth(minimum_age=18, maximum_age=40),
                'position': random.choice(positions),
                'team_id': team_id
            })
            player_id += 1

    players_df = pd.DataFrame(players)
    players_df.to_csv('dummy_data/players.csv', index=False)
    return players_df

def generate_matches(teams_df):
    # Generate data for `Matches` table
    matches = []
    team_ids = teams_df['team_id'].tolist()
    dates = pd.date_range(start='2000-01-01', end='2022-12-31', freq='7D')  # One match per week

    match_id = 1
    for match_date in dates:
        home_team_id, away_team_id = random.sample(team_ids, 2)
        result_options = [(3, 0), (3, 1), (3, 2), (0, 3), (1, 3), (2, 3)]
        match_result = random.choice(result_options)
        result_options = random.choice(result_options)
        matches.append({
            'match_id': match_id,
            'match_date': match_date,
            'match_location': fake.city(),
            'home_team_id': home_team_id,
            'away_team_id': away_team_id,
            'match_result': f"{match_result[0]}:{match_result[1]}"
        })
        match_id += 1

    matches_df = pd.DataFrame(matches)
    matches_df.to_csv('dummy_data/matches.csv', index=False)
    return matches_df

def generate_stats(players_df, matches_df):
    # Generate data for `Player_Statistics` table
    player_statistics = []
    player_ids = players_df['player_id'].tolist()
    match_ids = matches_df['match_id'].tolist()

    for match_id in match_ids:
        home_team_id = matches_df.loc[matches_df['match_id'] == match_id, 'home_team_id'].values[0]
        away_team_id = matches_df.loc[matches_df['match_id'] == match_id, 'away_team_id'].values[0]

        home_players = players_df[players_df['team_id'] == home_team_id].sample(6).to_dict('records')
        away_players = players_df[players_df['team_id'] == away_team_id].sample(6).to_dict('records')

        for player in home_players + away_players:
            player_statistics.append({
                'status_id': len(player_statistics) + 1,
                'player_id': player['player_id'],
                'match_id': match_id,
                'points': random.randint(0, 30),
                'assists': random.randint(0, 20),
                'blocks': random.randint(0, 10)
            })

    player_statistics_df = pd.DataFrame(player_statistics)
    player_statistics_df.to_csv('dummy_data/player_statistics.csv', index=False)

def generate_seasons():
    # Generate data for `Seasons` table
    seasons = []
    for i in range(1, 23):  # From 2000 to 2022
        seasons.append({
            'season_id': i,
            'start_year': 2000 + i - 1,
            'end_year': 2000 + i
        })

    seasons_df = pd.DataFrame(seasons)
    seasons_df.to_csv('dummy_data/seasons.csv', index=False)

def generate_referees():
    # Generate data for `Referees` table
    referees = []
    for i in range(1, 101):  # 100 referees
        referees.append({
            'referee_id': i,
            'referee_name': fake.name(),
            'country': fake.country()
        })

    referees_df = pd.DataFrame(referees)
    referees_df.to_csv('dummy_data/referees.csv', index=False)

# Save
def main():
    teams_df = generate_teams()
    players_df = generate_players(teams_df)
    matches_df = generate_matches(teams_df)
    generate_stats(players_df, matches_df)
    generate_seasons()
    generate_referees()
    print("Dummy data have been generated and successfully saved to CSV files.")

if __name__ == "__main__":
    main()
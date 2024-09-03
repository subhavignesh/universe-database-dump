#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
#!/bin/bash

# Truncate tables
echo "$($PSQL "TRUNCATE TABLE games, teams CASCADE;")"

# Read and process the CSV file
cat games.csv | while IFS="," read -r YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
    # Skip the header line
    if [[ $YEAR != "year" ]]; then
        
        # Handling winner
        WINNER_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
        if [[ -z $WINNER_TEAM_ID ]]; then
            INSERT_TEAM_ID=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER') RETURNING team_id;")
            if [[ $INSERT_TEAM_ID == *"INSERT 0 1"* ]]; then
                echo "Inserted team: $WINNER"
            fi
            WINNER_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
        fi

        # Handling opponent
        OPPONENT_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")
        if [[ -z $OPPONENT_TEAM_ID ]]; then
            INSERT_TEAM_ID=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT') RETURNING team_id;")
            if [[ $INSERT_TEAM_ID == *"INSERT 0 1"* ]]; then
                echo "Inserted team: $OPPONENT"
            fi
            OPPONENT_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")
        fi

        # For filling data in games table
        
            INSERT_GAME_ID=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR,'$ROUND',$WINNER_TEAM_ID,$OPPONENT_TEAM_ID,$WINNER_GOALS,$OPPONENT_GOALS) RETURNING game_id;")
            if [[ $INSERT_GAME_ID == *"INSERT 0 1"* ]]; then
               echo "inserted in games table: $YEAR | $ROUND | $WINNER_TEAM_ID | $OPPONENT_TEAM_ID | $WINNER_GOALS | $OPPONENT_GOALS"
            fi
            

        
    fi
done

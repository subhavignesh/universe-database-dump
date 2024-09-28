#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo -e "\nGuess the number\n"

RANDOM_NUMBER=$((RANDOM % 1000 + 1))
NUMBER_OF_GUESS=0

MAIN_MENU() {
  echo -e "\nEnter your username:\n random number is $RANDOM_NUMBER"
  read USER_NAME_GIVEN
  USER_NAME=$($PSQL "SELECT user_name FROM users WHERE user_name='$USER_NAME_GIVEN'")
  
  if [[ -z $USER_NAME ]]  # New user
  then
      echo "Welcome, $USER_NAME_GIVEN! It looks like this is your first time here."
      UPDATE_USER_NAME=$($PSQL "INSERT INTO users(user_name) VALUES('$USER_NAME_GIVEN')")
      USER_ID=$($PSQL "SELECT user_id FROM users WHERE user_name='$USER_NAME_GIVEN'")
      echo "Guess the secret number between 1 and 1000:"
      CHECK_INPUT $USER_ID  # Start the game with new user
  else  # Existing user
      GET_USER_DETAILS=$($PSQL "SELECT COUNT(DISTINCT(game_id)), MAX(game_id), MIN(game_guess), user_id FROM users WHERE user_name='$USER_NAME' GROUP BY user_id")
      IFS="|" read -r GAMES_PLAYED LAST_GAME_ID BEST_GAME USER_ID <<< "$GET_USER_DETAILS"
      echo "Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
      echo "Guess the secret number between 1 and 1000:"
      CHECK_INPUT $USER_ID  # Start a new game
  fi
}

CHECK_INPUT() {
  USER_ID=$1  # Capture the user ID passed from MAIN_MENU
  if [[ -n $2 ]]
  then
    echo -e "\n$2"
  fi
  
  read USER_INPUT

  if [[ ! $USER_INPUT =~ ^[0-9]+$ ]]
  then
     CHECK_INPUT "$USER_ID" "That is not an integer, guess again:"
     return
  fi
  
  NUMBER_OF_GUESS=$((NUMBER_OF_GUESS + 1))

  if [[ $USER_INPUT -lt $RANDOM_NUMBER ]]
  then
      CHECK_INPUT "$USER_ID" "It's higher than that, guess again:"
  elif [[ $USER_INPUT -gt $RANDOM_NUMBER ]]
  then
      CHECK_INPUT "$USER_ID" "It's lower than that, guess again:"
  else
      # Update the game guess for the current game
      INSERT_GAME_GUESS=$($PSQL "UPDATE users SET game_guess = $NUMBER_OF_GUESS WHERE user_id = $USER_ID AND game_id = (SELECT MAX(game_id) FROM users WHERE user_id = $USER_ID)")
      echo "You guessed it in $NUMBER_OF_GUESS tries. The secret number was $RANDOM_NUMBER. Nice job!"
      return   
  fi
}

MAIN_MENU

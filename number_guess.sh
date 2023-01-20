#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

#random number variable (must initialize at start of script and not change)
RANDOM_NUM=$(( $RANDOM % 1000 + 1 ))

#(needs to be limited to 22 characters? or needs to be altered to allow 22 characters?)
echo -e "Enter your username:"
read USERNAME_ENTERED

#variable to help check if username exists/grab user info
USERNAME_IN_INFO=$($PSQL "SELECT username FROM info WHERE username = '$USERNAME_ENTERED'")

GAMES_PLAYED=$($PSQL "SELECT games_played FROM info WHERE username = '$USERNAME_IN_INFO'")

BEST_GAME=$($PSQL "SELECT best_game FROM info WHERE username = '$USERNAME_IN_INFO'")

PLAY_GAME() {
  GUESS_NUM=0
  GUESS_INCR=0
  
  until [[ $GUESS_NUM -eq $RANDOM_NUM ]]
    do
    read GUESS_NUM
    GUESS_INCR=$((GUESS_INCR + 1))
    if ! [[ $GUESS_NUM =~ ^[0-9]*$ ]]
    then
      echo -e "That is not an integer, guess again:"
    elif [[ $GUESS_NUM > $RANDOM_NUM ]]
    then
      echo -e "It's lower than that, guess again:"
    elif [[ $GUESS_NUM < $RANDOM_NUM ]]
    then
      echo -e "It's higher than that, guess again:"
    elif [[ $GUESS_NUM = $RANDOM_NUM ]]
    then
      echo -e "You guessed it in" $GUESS_INCR "tries. The secret number was" $RANDOM_NUM". Nice job!"
    fi
    done
}

#check if username exists and respond accordingly
if [[ $USERNAME_IN_INFO =~ [a-zA-Z0-9]+ ]]
then
  echo -e "Welcome back," $USERNAME_IN_INFO"! You have played" $GAMES_PLAYED "games, and your best game took" $BEST_GAME "guesses."
else
  INSERT_USERNAME=$($PSQL "INSERT INTO info(username) VALUES('$USERNAME_ENTERED')")
  echo -e "Welcome," $USERNAME_ENTERED"! It looks like this is your first time here."
fi

INSERT_GAME() {
  CURRENT_GP=$((GAMES_PLAYED + 1))
  
  if [[ $BEST_GAME -gt $GUESS_INCR ]] || [[ $BEST_GAME -le 0 ]]
  then
  UPDATE=$($PSQL "UPDATE info SET games_played = $CURRENT_GP, best_game = $GUESS_INCR WHERE username = '$USERNAME_ENTERED'")
  else
  UPDATE=$($PSQL "UPDATE info SET games_played = $CURRENT_GP WHERE username = '$USERNAME_ENTERED'")
  fi
}

echo -e "Guess the secret number between 1 and 1000:"
PLAY_GAME
INSERT_GAME

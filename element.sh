#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"


if [[ ! $1 ]]
then
  echo "Please provide an element as an argument."
else
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    SELECTED_ELEMENT=$($PSQL "SELECT * FROM elements WHERE atomic_number=$1")
  else
    SELECTED_ELEMENT=$($PSQL "SELECT * FROM elements WHERE symbol='$1' OR name='$1'")
  fi

  if [[ -z $SELECTED_ELEMENT ]]
  then
    echo "I could not find that element in the database."
  else
    echo "$SELECTED_ELEMENT" | while IFS="|" read ATOMIC_NUMBER SYMBOL NAME
    do
      echo $ATOMIC_NUMBER $SYMBOL $NAME
    done
  fi
fi
#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"


if [[ ! $1 ]]
then
  echo "Please provide an element as an argument."
else
  SELECTED_ELEMENT=$($PSQL "SELECT * FROM elements WHERE atomic_number=$1")
  if [[ -z $SELECTED_ELEMENT ]]
  then
    echo "I could not find that element in the database."
  else
    echo $SELECTED_ELEMENT
  fi
fi
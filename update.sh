#!/bin/bash
#TEST
echo "Do you want to apply your local changes after updating? (y/n)"
read answer

if [[ $answer == "y" ]]; then
  make down && git stash save && git pull && git stash apply && make build && make up
elif [[ $answer == "n" ]]; then
  make down && git stash && git stash drop && git pull && make build && make up
else
  echo "Invalid input. Please enter 'y' or 'n'."
fi

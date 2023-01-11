#!/bin/bash

# EXERCISE 4: Bash Script - User Processes Sorted
# Extend the previous script to ask for a user input for sorting the processes output either by memory or CPU consumption, and print the sorted list.

#########################################################################################################################################################

# Display option

echo "Choose the sorting option for processes run by the $USER"
echo "1 - Sort by memory conusption"
echo "2 - Sort by CPU consumption"
echo "q - Quit"

# Read option

read option

# Main logic

if [ "$option" == "1" ]
then
 echo "Sorted process by memory consumption for user $USER"
 echo ""
 ps aux | grep $USER | sort -n -k 4
elif [ "$option" == "2" ]
 then
  echo "Sorted process by CPU consumption for user $USER"
  echo ""
  ps aux | grep $USER | sort -n -k 3
elif [ "$option" == "q" ]
 then
  echo "Bye!"
else
 echo "Sorry, wrong option. Try again and choose the option carefully!"
fi

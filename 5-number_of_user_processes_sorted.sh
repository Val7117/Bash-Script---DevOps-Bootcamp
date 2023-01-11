#!/bin/bash

# EXERCISE 5: Bash Script - Number of User Processes Sorted
# Extend the previous script to ask additionally for user input about how many processes to print. Hint: use head program to limit the number of outputs.

#########################################################################################################################################################

# Function to ask for the number of processes

function number_of_processes() {
 read -p "How many processes to print? " num_of_proc
 echo ""
# Check if the entered number is integer
 if ! [[ "$num_of_proc" =~ ^[0-9]+$ ]]
  then
   echo "Sorry integers only"
   exit 127
 fi
}

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
 number_of_processes
 echo "Sorted processes by Memory consumption for user $USER"
 echo ""
 ps aux --sort -rss | grep $USER | head -n $(($num_of_proc))
elif [ "$option" == "2" ]
 then
  number_of_processes
  echo "Sorted by CPU consumption for user $USER"
  echo ""
  ps aux --sort -%cpu | grep $USER | head -n $(($num_of_proc))
elif [ "$option" == "q" ]
 then
  echo "Bye!"
else
 echo "Sorry, wrong option. Try again and choose the option carefully!"
fi

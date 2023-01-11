#!/bin/bash

# EXERCISE 2: Bash Script - Install Java
# Write a bash script using Vim editor that installs the latest java version and checks whether java was installed successfully by executing a java -version command.
# Checks if it was successful and prints a success message, if not prints a failure message.

##############################################################################################################################################################################

# Update repos

sudo apt update

# Install default JRE from OpenJDK

sudo apt install -y default-jre

# Set the latest-java-version available

latest_java_version="11"

# Get java_version (sent stderr and stdout to /dev/null, grepp java or openjdk version, get the version nuber using awk language

java_version=$(java -version 2>&1 >/dev/null | grep "java version\|openjdk version" | awk '{print substr($3,2,2)}')

if [ "$java_version" == "" ]
 then
  echo "No Java has been found. An error ocurred."
 elif [ "$java_version" == "$latest_java_version" ]
 then
   echo "Latest Java version $latest_java_version has been installed."
 else
   echo "Other Java version is installed than Java version $latest_java_version. Please check the Java version you entered or visit Java documentation page."
fi

#!/bin/bash

# EXERCISE 6: Bash Script - Start Node App
# Write a bash script with following logic:

# Install NodeJS and NPM and print out which versions were installed
# Download an artifact file from the URL: https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz 39.
# Hint: use curl or wget
# Unzip the downloaded file
# Set the following needed environment variables: APP_ENV=dev, DB_USER=myuser, DB_PWD=mysecret
# Change into the unzipped package directory
# Run the NodeJS application by executing the following commands: npm install and node server.js
# Notes:

# Make sure to run the application in background so that it doesn’t block the terminal session where you execute the shell script
# If any of the variables is not set, the node app will print error message that env vars is not set and exit
# It will give you a warning about LOG_DIR variable not set. You can ignore it for now.

#########################################################################################################################################################

# Update the repos

echo "Updating the repos..."
sudo apt update

# Install NodeJS and NPM

sudo apt install -y nodejs
sudo apt install -y npm

# Show the version of installed NodeJS and NPM

echo "Installed NodeJS version:"
node -v
echo""
echo "Installed NPM version:"
npm -v
echo ""

# Download an artifact from the URL
echo "Downloading and artifact..." 
curl https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz --output bootcamp-node-envvars-project-1-0-0.tgz

echo "Unzipping the downloaded file"
tar -xvzf bootcamp-node-envvars-project-1-0-0.tgz . 

# Set the environment variables

export APP_ENV=dev, DB_USER=myuser, DB_PWD=mysecret
source ~/.bashrc

# Change to the unzipped package direcorty
cd package

# Run the NodeJS application

echo "Installing NPM dependencies"
npm install
echo ""
echo "Starting NodeJS server in background..."
node server.js &
echo""
echo "Script has been successfully executed."

#!/bin/bash

# EXERCISE 7: Bash Script - Node App Check Status
# Extend the script to check after running the application that the application has successfully started and prints out the application’s running process
# and the port where it’s listening.

#########################################################################################################################################################

# Update the repos

echo "Updating the repos..."
sudo apt update

# Install NodeJS, NPM, curl, net-tools

sudo apt install -y nodejs npm curl net-tools

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
echo ""

# Display that nodejs process is running

ps aux | grep nodejs | grep -v grep

# Display that nodejs is running on port 3000

netstat -ltnp | grep :3000

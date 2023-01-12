#!/bin/bash

# EXERCISE 9: Bash Script - Node App with Service user
# You’ve been running the application with your user. But we need to adjust that and create own service user: myapp for the application to run.
# So extend the script to create the user and then run the application with the service user.

#########################################################################################################################################################

# Set username for the application

app_name=myapp

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

# Ask for a log dir and set the environment variables

echo -n "Set log directory location for the application (absolute path): "
read LOG_DIR
export LOG_DIR="$LOG_DIR"

if [ -d $LOG_DIR ]
then
  echo "$LOG_DIR already exists"
else
  mkdir -p $LOG_DIR
  echo "A new directory $LOG_DIR has been created"
fi

# Check if the user name for the app already exists

user_name=$(cat /etc/passwd | grep "$app_name" | cut -d ":" -f 1)

if [ "$user_name" == "$app_name" ]
 then
  echo "User for name '$app_name' already exists."
 else
  useradd $app_name -m
  echo "User '$app_name' has been created."
fi

# Set the owner for app dir and log dir

chown $app_name -R /home/$app_name
chown $app_name -R $LOG_DIR

# Download an artifact from the URL
echo "Downloading and artifact..." 
runuser -l $app_name -c "curl https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz --output /home/'$app_name'/bootcamp-node-envvars-project-1-0-0.tgz"

echo "Unzipping the downloaded file"
runuser -l $app_name -c "tar -xvzf /home/'$app_name'/bootcamp-node-envvars-project-1-0-0.tgz"

runuser -l $app_name -c "
	export APP_ENV=dev, DB_USER=myuser, DB_PWD=mysecret, LOG_DIR='$LOG_DIR' &&
	cd /home/'$app_name'/package &&
	echo 'Installing NPM dependencies' &&
	npm install &&
	echo '' &&
	echo 'Starting NodeJS server in background...' &&
	node server.js &
	"

# Display that nodejs process is running

ps aux | grep nodejs | grep -v grep

# Display that nodejs is running on port 3000

netstat -ltnp | grep :3000

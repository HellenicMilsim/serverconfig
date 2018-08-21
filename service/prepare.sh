#! /usr/bin/env bash

# Create secrets, mount volumes, start composition

function create_secret {
	name=$1
	if grep --quiet $name docker secret ls; then
		echo "Secret exists: $name"
	else
		openssl rand -base64 32 | docker secret create $name -
	fi
}


#create_secret "db_name"
create_secret "db_user"
create_secret "db_password"


#TODO docker volumes

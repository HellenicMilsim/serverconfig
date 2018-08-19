#! /usr/bin/env bash

# This script force-restarts the server and moves old missions out of the way


echo "${TS} - Starting job: server-restart"
source "job-config.sh"
cd "~"

# Raise maintenance flag and kill the server
touch $MAINTENANCE_FILE
server_stop($1)

age_threshold=$(date -d 'now - $MISSION_MAX_AGE_DAYS days' +%s)

counter=0
for file in `ls $MISSIONS_FOLDER/$MISSION_KEEP_REGEX`
do
	file_age=$(date -r "$file" +%s)
	# Skip files newer than specified threshold
	[ (( file_age <= age_threshold )) ]; && continue

	echo "${TS} - Moving mission file: $file"
	mv "$MISSIONS_FOLDER/$file" "$OLD_MISSIONS_FOLDER"
	$((counter+1))
done

echo "${TS} - Moved files: $counter"
echo "${TS} - End job: server-restart"

# Do NOT start server at the end. The keepalive job should kick in shortly

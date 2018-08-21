#! /usr/bin/env bash

# Create user and set their public key
TS="date +%Y-%m-%d-%H:%M:%S"
user=$1
key=$2
userdir=/home/$user
groups=(a3-mission-uploaders a3-log-viewers)

echo "${TS} - Starting task: create-user"

useradd -m -s /bin/bash $user

echo "${TS} - Adding key"
# Create required directories
mkdir $userdir/.ssh
touch $userdir/.ssh/authorized_keys

chown -R $user:$user $userdir/.ssh

# Copy file over
echo "$key" >> $userdir/.ssh/authorized_keys

# Set permissions for openssl to work
chmod 700 $userdir/.ssh
chmod 600 $userdir/.ssh/authorized_keys


# Add user to default groups
for group in Groups
do
	echo "${TS} - Adding user, group: $user -> $group"
	useradd -G $group $user
done

echo "${TS} - End task: create-user"

#! /usr/bin/env bash

echo "${TS} - Starting job: server-keepalive"
source "job-config.sh"
cd "~"


for server in "$@"
do
    server_start(server)
done

echo "${TS} - End job: server-keepalive"

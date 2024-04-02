#!/bin/bash

# This script is used to replace REPLACE_ME with the current username in devcontainer.json
# NOTE: You can also do this on your own by manually replacing REPLACE_ME with your username in devcontainer.json

# Get current username
USERNAME=$(whoami)
# Specify the JSON file path
FILEPATH="devcontainer.json"

# Replace REPLACE_ME with the current username using the sed utility
sed -i -e "s/REPLACE_ME/$USERNAME/g" $FILEPATH

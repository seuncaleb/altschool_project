#!/bin/bash

# Function to display usage information
usage() {
    echo "Usage: $0 <git_username> <git_email>"
    exit 1
}

# Check if all required arguments are provided
if [ "$#" -ne 2 ]; then
    usage
fi

# Assigning arguments to variables
GIT_USERNAME=$1
GIT_EMAIL=$2

# Install Git
sudo apt-get update
sudo apt-get install -y git

# Configure Git
git config --global user.name "$GIT_USERNAME"
git config --global user.email "$GIT_EMAIL"

echo "Git installed and configured with username '$GIT_USERNAME' and email '$GIT_EMAIL'."

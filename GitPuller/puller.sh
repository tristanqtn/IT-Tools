#!/bin/bash

# Check if a directory path was provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/your/repos"
    exit 1
fi

# Directory containing the git repositories
REPO_DIR="$1"

# Check if the provided path is a directory
if [ ! -d "$REPO_DIR" ]; then
    echo "Error: $REPO_DIR is not a valid directory"
    exit 1
fi

# Change to the directory containing the repos
cd "$REPO_DIR" || exit

# Loop through each subdirectory
for dir in */ ; do
    # Check if the directory is a git repository
    if [ -d "$dir/.git" ]; then
        echo "Pulling latest changes in $dir"
        # Change to the repository directory
        cd "$dir" || continue
        # Pull the latest changes
        git pull
        # Change back to the parent directory
        cd ..
    else
        echo "$dir is not a git repository"
    fi
done

#!/bin/bash

# Bulk folder deletion script
# Lets users enter the name of file of folder they want to bulk delete eg node_moduke or package-lock.json,, and specify the parent location from where deteting should start from eg c:users/me/desktop
# Function to display usage instructions
function usage() {
    echo "Usage: $0 <folder_name> <parent_directory>"
    echo "Example: $0 node_modules /home/user/projects"
    exit 1
}

# Check if sufficient arguments are provided
if [ "$#" -ne 2 ]; then
    usage
fi

FOLDER_NAME=$1
PARENT_DIR=$2

# Check if parent directory exists
if [ ! -d "$PARENT_DIR" ]; then
    echo "Error: Parent directory '$PARENT_DIR' does not exist."
    exit 1
fi

# Confirm action before deleting
echo "You are about to delete all '$FOLDER_NAME' folders inside '$PARENT_DIR'."
read -p "Are you sure? [y/N]: " CONFIRM

if [[ ! "$CONFIRM" =~ ^[Yy]$ ]]; then
    echo "Operation canceled."
    exit 0
fi

# Find and delete the specified folder
echo "Searching and deleting '$FOLDER_NAME' folders inside '$PARENT_DIR'..."
find "$PARENT_DIR" -type d -name "$FOLDER_NAME" -prune -exec rm -rf {} + 2>/dev/null

echo "Deletion complete."

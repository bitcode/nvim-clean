#!/bin/bash

# Check if xclip is installed
if ! command -v xclip >/dev/null 2>&1; then
    echo "xclip not found. Please install it and try again."
    exit 1
fi

# Initialize an empty string to store the concatenated file contents
concatenated_files=""

# Function to concatenate the content of a file
concatenate_file() {
    local file_path="$1"
    local file_name="$(basename "$file_path")"
    
    concatenated_files+="\n\n# File: $file_name\n"
    concatenated_files+="$(cat "$file_path")"
}

# Concatenate the files
concatenate_file "init.lua"
concatenate_file "lua/config/init.lua"
concatenate_file "lua/telescope-config.lua"

# Copy the concatenated files to the clipboard
echo -e "$concatenated_files" | xclip -selection clipboard

echo "All files have been concatenated and copied to the clipboard."bin/bash

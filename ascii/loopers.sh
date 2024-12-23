#!/bin/bash

# Function to clean up and exit
cleanup() {
    # Clear the terminal
    clear
    exit
}

# Trap Ctrl+C to run the cleanup function
trap cleanup SIGINT

# Flag to indicate whether to continue looping
running=true

# Loop until the running flag is false
while $running; do
    for file in *.txt; do

        # Get terminal size
        lines=$(tput lines)
        cols=$(tput cols)

        # Read the ASCII art content into an array
        IFS=$'\n' read -d '' -r -a art < "$file"

        # Calculate position for centering
        start_line=$(( (lines - ${#art[@]}) / 2 ))
        start_col=$(( (cols - ${#art[0]}) / 2 ))

        # Clear the terminal
        clear

        # Display ASCII art with leading spaces for centering
        for line in "${art[@]}"; do
            printf '\e[%s;%sH' "$start_line" "$start_col"
            printf ' %s\n' "$line"
            ((start_line++))
        done

        sleep 0.75
    done
done

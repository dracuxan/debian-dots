#!/bin/bash

tm() {
    # Check for existing sessions
    if [ -z "$(tmux ls 2>/dev/null)" ]; then
        # Prompt for session name
        echo -n "No sessions found. Enter a name for a new session: "
        read -r name
        # Validate input
        if [ -z "$name" ]; then
            echo "Error: Session name cannot be empty." >&2
            exit 1
        fi
        # Create new session
        tmux new-session -s "$name" || {
            echo "Error: Failed to create session '$name'." >&2
            exit 1
        }
    else
        # Attach to the most recent session
        tmux attach || {
            echo "Error: Failed to attach to session." >&2
            exit 1
        }
    fi
}

# Call the tm function
tm

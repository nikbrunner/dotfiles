#!/usr/bin/env bash

# Function to list smug sessions
list_smug_sessions() {
	# Get a list of all smug sessions
	local all_sessions=$(smug list)

	# Get a list of all open tmux sessions
	local open_sessions=$(tmux list-sessions -F "#{session_name}")

	# Filter out open sessions from the list of all smug sessions
	local available_sessions=$all_sessions
	for open_session in $open_sessions; do
		available_sessions=$(echo "$available_sessions" | grep -v "^$open_session$")
	done

	echo "$available_sessions"
}

# Function to start and switch to a smug session
start_smug_session() {
	local session=$1
	smug start "$session" >/dev/null 2>&1 &

	# Display a message in the tmux status line
	tmux display-message "Starting session $session..."

	# Wait a bit to ensure the session has started
	sleep 2

	# Clear the message
	tmux display-message -c

	tmux switch-client -t "$session"
	tmux select-window -t "$session:1"
}

# Get a list of smug sessions
sessions=$(list_smug_sessions)

# Check if there are any sessions
if [[ -z "$sessions" ]]; then
	echo "No smug sessions available."
	exit 1
fi

# Use fzf within a tmux popup to select a session, output to a temp file
temp_file=$(mktemp)
tmux popup -E -d '#{pane_current_path}' "echo \"$sessions\" | fzf --prompt='Start a new preconfigured tmux session:' > $temp_file"

# Read the selected session from the temp file
selected_session=$(cat $temp_file)
rm $temp_file # clean up the temp file

# Check if a session was selected
if [[ -n "$selected_session" ]]; then
	start_smug_session "$selected_session"
fi

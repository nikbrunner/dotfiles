#!/bin/bash

tmux rename-window Source
tmux new-window -n Term \; send-keys "nvm use" Enter \; send-keys "clear" Enter
tmux split-window -v -p 35 \; send-keys "nvm use" Enter \; send-keys "clear" Enter
tmux split-window -h -p 50 \; send-keys "nvm use" Enter \; send-keys "clear" Enter
tmux new-window -n Git "lazygit"
tmux split-window -v -p 25
tmux select-window -t 0 \; send-keys "vim ." Enter

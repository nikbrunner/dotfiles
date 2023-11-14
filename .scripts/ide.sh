#!/bin/bash

tmux send-keys "nvim ." Enter
tmux split-window -v -p 30 \; send-keys "nvm use" Enter \; send-keys "clear" Enter
tmux split-window -h -p 66 \; send-keys "nvm use" Enter \; send-keys "clear" Enter
tmux split-window -h -p 50

#!/bin/bash

display_idx="$1"
window_id="$(yabai -m query --windows --window | jq -r '.id')"
yabai -m window --display "$display_idx" && sleep 0.1 && yabai -m window --focus "$window_id"


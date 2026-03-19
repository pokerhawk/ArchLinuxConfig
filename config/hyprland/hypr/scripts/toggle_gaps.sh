#!/bin/bash

STATE_FILE="/tmp/hypr_gaps_state"

if [ -f "$STATE_FILE" ]; then
    # Restore normal
    hyprctl keyword decoration:rounding 10
    hyprctl keyword general:gaps_in 3
    hyprctl keyword general:gaps_out 10
    rm "$STATE_FILE"
else
    # Minimal / fullscreen look
    hyprctl keyword decoration:rounding 0
    hyprctl keyword general:gaps_in 0
    hyprctl keyword general:gaps_out 0
    touch "$STATE_FILE"
fi

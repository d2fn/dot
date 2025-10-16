#!/usr/bin/env bash

APP="$1"
CLASS="$2"  # optional window class to match

# Try to focus an existing window
if hyprctl clients | grep -qi "$CLASS"; then
    # Focus the existing window (will switch workspace if needed)
    hyprctl dispatch focuswindow "class:$CLASS"
else
    # Launch a new instance
    $APP &
fi


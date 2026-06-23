#!/bin/bash
# Screenshot script - region or full screen
# Usage: screenshot.sh [region|full]

DIR="$HOME/Pictures/screenshots"
FILE="screenshot_$(date +%Y%m%d_%H%M%S).png"

mkdir -p "$DIR"

case "$1" in
    region)
        GRIM_SELECTION=$(slurp) || exit 1
        grim -g "$GRIM_SELECTION" "$DIR/$FILE"
        ;;
    full)
        grim "$DIR/$FILE"
        ;;
esac

if [ $? -eq 0 ]; then
    wl-copy --type image/png < "$DIR/$FILE"
fi

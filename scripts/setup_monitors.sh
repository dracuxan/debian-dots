#!/bin/bash
set -e

POSITION="right" # left | right | above | below
DRY_RUN=false

EXTERNAL_OUTPUT="HDMI-0"
INTERNAL_OUTPUT="eDP-1-0"

run() {
    if $DRY_RUN; then
        echo "[DRY-RUN] xrandr $*"
    else
        xrandr "$@"
    fi
}

# Enable both monitors
run --output "$INTERNAL_OUTPUT" --auto
run --output "$EXTERNAL_OUTPUT" --mode 1920x1080 --rate 180.00 --primary

# Position external monitor
case "$POSITION" in
left)
    run --output "$EXTERNAL_OUTPUT" --left-of "$INTERNAL_OUTPUT"
    ;;
right)
    run --output "$EXTERNAL_OUTPUT" --right-of "$INTERNAL_OUTPUT"
    ;;
above)
    run --output "$EXTERNAL_OUTPUT" --above "$INTERNAL_OUTPUT"
    ;;
below)
    run --output "$EXTERNAL_OUTPUT" --below "$INTERNAL_OUTPUT"
    ;;
*)
    echo "Invalid position"
    exit 1
    ;;
esac

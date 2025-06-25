#!/bin/bash

# Video file in ~/.adsh/video
VIDEO=(
    "2024_carrefour.mp4"
    "2024_croustibat.mp4"
    "2024_fivestar.mp4"
    "2024_pulco.mp4"
    "2025_sfr.mp4"
)

# Get random video
AD="${VIDEO[RANDOM % ${#VIDEO[@]}]}"

# Complete path
VIDEO_PATH="$HOME/.adsh/video/$AD"

# Check if video exist
if [[ -f "$VIDEO_PATH" ]]; then
    # Chance of ad 1/2
    if (( RANDOM % 2 == 0 )); then
        # Block Ctrl+c
        trap '' SIGINT SIGQUIT
        # Play ad
        flatpak run io.mpv.Mpv --vo=tct --vo-tct-256 \
            --term-status-msg="\n\n\n\nVotre commande sera exécutée bientôt" \
            --msg-level=cplayer=no --osc=no --keep-open=no \
            --display-tags=no "$VIDEO_PATH"
        # Reset Ctrl+c
        trap - SIGINT SIGQUIT
    fi
fi

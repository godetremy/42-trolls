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

# Cleanup if ctrl+c
cleanup() {
    kill -SIGTERM "$MPV_PID" 2>/dev/null
    wait "$MPV_PID" 2>/dev/null
    exit 0
}

trap cleanup SIGINT SIGTERM

# Play the ad every other execution (based on RANDOM % 2)
if (( RANDOM % 2 == 0 )); then

    flatpak run io.mpv.Mpv --vo=tct --vo-tct-256 --term-status-msg="\n\n\n\nVotre commande sera exécutée bientôt" --msg-level=cplayer=no --osc=no --keep-open=no --display-tags=no ~/.adsh/video/"$AD" &
    MPV_PID=$!

    wait "$MPV_PID"
fi

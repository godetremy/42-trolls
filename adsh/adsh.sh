#!/bin/bash

# List of video in video folder
VIDEO=(
    "2024_carrefour.mp4"
    "2024_croustibat.mp4"
    "2024_fivestar.mp4"
    "2024_pulco.mp4"
    "2025_sfr.mp4"
)

# Selecy random video in the list
AD="${VIDEO[$RANDOM % ${#VIDEO[@]}]}"

# Play video with mpv
mpv --vo=tct --vo-tct-256 --term-status-msg="\n\n\n\nYour command will be executed shortly" --msg-level=cplayer=no --osc=no --keep-open=no --display-tags=no ~/.adsh/video/$AD

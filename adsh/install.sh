#!/bin/bash

echo ' ▗▄▖    ▐▌ ▗▄▄▖▐▌   '
echo '▐▌ ▐▌   ▐▌▐▌   ▐▌'
echo '▐▛▀▜▌▗▞▀▜▌ ▝▀▚▖▐▛▀▚▖'
echo '▐▌ ▐▌▝▚▄▟▌▗▄▄▞▘▐▌ ▐▌'
echo
echo

echo '[1/5] Prepare for downloads...'

VIDEOS=(
    "2024_carrefour.mp4"
    "2024_croustibat.mp4"
    "2024_fivestar.mp4"
    "2024_pulco.mp4"
    "2025_sfr.mp4"
)

mkdir -p ~/.adsh/video

echo '[2/5] Downloading ads...'
for VIDEO in "${VIDEOS[@]}"; do
    curl -s -L -o "$HOME/.adsh/video/$VIDEO" "https://raw.githubusercontent.com/godetremy/42-trolls/main/adsh/video/$VIDEO" &
done

wait

echo '[3/5] Downloading script...'
curl -s -L -o "$HOME/.adsh/adsh.sh" "https://raw.githubusercontent.com/godetremy/42-trolls/main/adsh/adsh.sh"
echo '[4/5] Checking permission...'
chmod +x "$HOME/.adsh/adsh.sh"

echo '[5/5] Adding to zshrc...'

echo 'preexec () { bash ~/.adsh/adsh.sh }' >> ~/.zshrc

echo "Done. Don't forget to reload zsh before use :"
echo "source ~/.zshrc"

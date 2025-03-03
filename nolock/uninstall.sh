#!/bin/bash

echo "[1/4] Uninstalling extension..."
rm -R ~/.local/share/gnome-shell/extensions/nolock@42network.org

echo "[2/4] Deleting video..."
rm -R "$HOME/.nolock"

echo "[3/4] Enabling lock button..."
gnome-extensions enable lockscreen@42network.org

echo "[4/4] Relaunching Gnome (screen can be unresponsive, don't worrie)..."
killall -3 gnome-shell

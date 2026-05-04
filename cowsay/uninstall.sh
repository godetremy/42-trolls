#!/bin/bash

echo "[1/2] Removing cowsay files..."
rm -rf ~/.cowsay

echo "[2/2] Cleaning .zshrc..."
sed -i '/# === Cowsay troll start ===/,/# === Cowsay troll end ===/d' ~/.zshrc

echo "✅ Cowsay troll removed!"

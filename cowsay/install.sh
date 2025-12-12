#!/bin/bash

echo "[1/2] Installing cowsay troll..."

# Create hidden directory
mkdir -p ~/.cowsay

# Create the cowsay script
cat > ~/.cowsay/cowsay.sh << 'COWSCRIPT'
#!/bin/bash

# Array of sarcastic messages
messages=(
    "Wow, another command. Impressive."
    "You really think that worked?"
    "I'm watching you..."
    "Meuuuuh! 🐄"
    "Have you tried turning it off and on again?"
    "That's what you're going with? Bold choice."
    "Error 404: Skill not found"
    "I've seen better commands from a cat on a keyboard"
    "Congratulations, you pressed Enter!"
    "Are you sure you know what you're doing?"
    "My grandma codes faster than you"
    "Beep boop, human detected"
    "Stop. Hammer time! 🔨"
    "42 is the answer, but what was the question?"
    "Lock your computer next time 😈"
)

# 20% chance to trigger
if [ $((RANDOM % 5)) -eq 0 ]; then
    # Pick random message
    msg="${messages[$RANDOM % ${#messages[@]}]}"
    
    # Cowsay ASCII art
    len=${#msg}
    border=$(printf '%*s' "$((len + 2))" | tr ' ' '-')
    
    echo ""
    echo " $border"
    echo "< $msg >"
    echo " $border"
    echo "        \\   ^__^"
    echo "         \\  (oo)\\_______"
    echo "            (__)\\       )\\/\\"
    echo "                ||----w |"
    echo "                ||     ||"
    echo ""
fi
COWSCRIPT

chmod +x ~/.cowsay/cowsay.sh

echo "[2/2] Injecting into .zshrc..."

# Add to .zshrc
cat >> ~/.zshrc << 'EOF'

# === Cowsay troll start ===
precmd() { source ~/.cowsay/cowsay.sh 2>/dev/null; }
# === Cowsay troll end ===
EOF

echo "✅ Cowsay troll installed! Open a new terminal to enjoy 🐮"

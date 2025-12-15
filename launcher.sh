#!/bin/bash

GUM_VERSION=gum_0.17.0_$(uname -s)_$(uname -m)
GUM_URL="https://github.com/charmbracelet/gum/releases/download/v0.17.0/$GUM_VERSION.tar.gz"
GUM_TMP_PATH=/tmp/gum
GUM_PATH=$GUM_TMP_PATH/$GUM_VERSION
GUM=$GUM_PATH/gum

mkdir -p "$GUM_TMP_PATH"
curl -fsSL "$GUM_URL" -o "$GUM_TMP_PATH/gum.tar.gz"
tar -xzf "$GUM_TMP_PATH/gum.tar.gz" -C "$GUM_TMP_PATH"
chmod +x "$GUM"
export PATH="$GUM:$PATH"

gum_select_category()
{
    echo "$($GUM choose \
        --header="Category / " \
        "🟢 Slightly Annoying" \
        "🟡 Moderately Annoying" \
        "🟠 Very Annoying" \
        "🔴 Ultra Annoying"
    )"
}
gum_select_slightly()
{
    echo "$($GUM choose \
        --header="Category / 🟢 Slightly Annoying" \
        "🔒 Lock your friend's screen" \
        "🎬 Lowcost Matrix" \
        "🐱 Tac or Cat ?" \
        "📖 Where is the fucking manual ?" \
        "🥸 Hieroglyph Title Bar" \
        "🖱️ Cursor Finder" \
        "❌ XXX ?" \
        "🙅 Useless window"
    )"
}

gum_select_moderately()
{
    echo "$($GUM choose \
        --header="Category / 🟡 Moderately Annoying" \
        "📺 AdSh - Ads in your shell" \
        "🍎 FallingKey"
    )"
}

gum_select_annoying()
{
    echo "$($GUM choose \
        --header="Category / 🟠 Very Annoying" \
        "🕺 Rickrolled" \
        "🔑 NoLock" \
        "🎲 Random Mouse" \
        "😇 Be Polite"
    )"
}

gum_select_ultra()
{
    echo "$($GUM choose \
        --header="Category / 🔴 Ultra Annoying" \
        "🗑️ Files? What files?"
    )"
}

select_troll() {
    TROLL=""

    while [ -z "$TROLL" ]; do
        CATEGORY="$(gum_select_category)"

        if [ -z "$CATEGORY" ]; then
           return
        fi

        if [ "$CATEGORY" = "🟢 Slightly Annoying" ]; then
            TROLL="$(gum_select_slightly)"
        fi

        if [ "$CATEGORY" = "🟡 Moderately Annoying" ]; then
            TROLL="$(gum_select_moderately)"
        fi

        if [ "$CATEGORY" = "🟠 Very Annoying" ]; then
            TROLL="$(gum_select_annoying)"
        fi

        if [ "$CATEGORY" = "🔴 Ultra Annoying" ]; then
            TROLL="$(gum_select_ultra)"
        fi

    done;

    echo "$TROLL"
}

launch_troll_slightly_lock(){
    if gum confirm "Are you really sure to install 🔒 Lock your friend's screen"; then
        ft_lock
    fi
}
launch_troll_slightly_matrix(){
    if gum confirm "Are you really sure to install 🎬 Lowcost Matrix"; then
        echo 'cat /dev/urandom' >> ~/.zshrc
    fi
}
launch_troll_slightly_tacorcat(){
    if gum confirm "Are you really sure to install 🐱 Tac or Cat ?"; then
        echo 'alias cat="rev"' >> ~/.zshrc
    fi
}
launch_troll_slightly_manual(){
    if gum confirm "Are you really sure to install 📖 Where is the fucking manual ?"; then
        echo 'man() { echo "No manual entry for $1"; }' >> ~/.zshrc
    fi
}
launch_troll_slightly_hieroglyph(){
    if gum confirm "Are you really sure to install 🥸 Hieroglyph Title Bar"; then
        gsettings set org.gnome.desktop.wm.preferences titlebar-uses-system-font false && gsettings set org.gnome.desktop.wm.preferences titlebar-font 'wasy10 256'
    fi
}
launch_troll_slightly_cursor(){
    if gum confirm "Are you really sure to install 🖱️ Cursor Finder"; then
        gsettings set org.gnome.desktop.interface cursor-size 256
    fi
}
launch_troll_slightly_xxx(){
    if gum confirm "Are you really sure to install ❌ XXX ?"; then
        gsettings set org.gnome.desktop.wm.preferences button-layout ':close,close,close'
    fi
}
launch_troll_slightly_useless(){
    if gum confirm "Are you really sure to install 🙅 Useless window"; then
        gsettings set org.gnome.desktop.wm.preferences button-layout ':'
    fi
}
launch_troll_moderately_adsh(){
    if gum confirm "Are you really sure to install 📺 AdSh - Ads in your shell"; then
        curl https://raw.githubusercontent.com/godetremy/42-trolls/refs/heads/main/adsh/install.sh | bash
    fi
}
launch_troll_moderately_fallingkey(){
    if gum confirm "Are you really sure to install 🍎 FallingKey"; then
        curl https://raw.githubusercontent.com/godetremy/42-trolls/refs/heads/main/fallingkey/run.sh | bash
    fi
}
launch_troll_annoying_rickrolled(){
    if gum confirm "Are you really sure to install 🕺 Rickrolled"; then
        pactl set-sink-mute @DEFAULT_SINK@ false && pactl set-sink-volume @DEFAULT_SINK@ 75% && cvlc https://dn720407.ca.archive.org/0/items/rick-roll/Rick%20Roll.ia.mp4 -f --no-video-title-show --mouse-hide-timeout 0
    fi
}
launch_troll_annoying_nolock(){
    if gum confirm "Are you really sure to install 🔑 NoLock"; then
        curl https://raw.githubusercontent.com/godetremy/42-trolls/refs/heads/main/nolock/install.sh | bash
    fi
}
launch_troll_annoying_randommouse(){
    if gum confirm "Are you really sure to install 🎲 Random Mouse"; then
        while true; do xmodmap -e "pointer = $(shuf -e 1 2 3 | paste -sd ' ')" ; sleep 2; done & disown
    fi
}
launch_troll_annoying_bepolite(){
    if gum confirm "Are you really sure to install 😇 Be Polite"; then
        curl https://raw.githubusercontent.com/godetremy/42-trolls/refs/heads/main/bepolite/install.sh | bash
    fi
}
launch_troll_ultra_reset(){
    if gum confirm "Are you really sure to install 🗑️ Files? What files?"; then
        touch ~/.reset
    fi
}

TROLL=$(select_troll)

if [ "$TROLL" = "🔒 Lock your friend's screen" ]; then
    launch_troll_slightly_lock
    exit
fi

if [ "$TROLL" = "🎬 Lowcost Matrix" ]; then
    launch_troll_slightly_matrix
    exit
fi

if [ "$TROLL" = "🐱 Tac or Cat ?" ]; then
    launch_troll_slightly_tacorcat
    exit
fi

if [ "$TROLL" = "📖 Where is the fucking manual ?" ]; then
    launch_troll_slightly_manual
    exit
fi

if [ "$TROLL" = "🥸 Hieroglyph Title Bar" ]; then
    launch_troll_slightly_hieroglyph
    exit
fi

if [ "$TROLL" = "🖱️ Cursor Finder" ]; then
    launch_troll_slightly_cursor
    exit
fi

if [ "$TROLL" = "❌ XXX ?" ]; then
    launch_troll_slightly_xxx
    exit
fi

if [ "$TROLL" = "🙅 Useless window" ]; then
    launch_troll_slightly_useless
    exit
fi

if [ "$TROLL" = "📺 AdSh - Ads in your shell" ]; then
    launch_troll_moderately_adsh
    exit
fi

if [ "$TROLL" = "🍎 FallingKey" ]; then
    launch_troll_moderately_fallingkey
    exit
fi

if [ "$TROLL" = "🕺 Rickrolled" ]; then
    launch_troll_annoying_rickrolled
    exit
fi

if [ "$TROLL" = "🔑 NoLock" ]; then
    launch_troll_annoying_nolock
    exit
fi

if [ "$TROLL" = "🎲 Random Mouse" ]; then
    launch_troll_annoying_randommouse
    exit
fi

if [ "$TROLL" = "😇 Be Polite" ]; then
    launch_troll_annoying_bepolite
    exit
fi

if [ "$TROLL" = "🗑️ Files? What files?" ]; then
    launch_troll_ultra_reset
    exit
fi


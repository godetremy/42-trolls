<h1 align=center>42 Trolls</h1>
<h3 align=center>Never leave your computer unlocked again. 😈</h3>

Welcome to **42 Trolls**! Here’s the ultimate guide to prank your friends at 42 School.

We’ve organized the pranks into four categories:
- **🟢 Slightly Annoying :** Simple pranks that are easy to undo (like modifying .zshrc)
- **🟡 Moderately Annoying :** A step up! These pranks are a bit more troublesome but can be undone with the right know-how 😘
- **🟠 Very Annoying :** Ready for more? These pranks involve taking control of hardware features… like sound, graphics, and storage!
- **🔴 Ultra Annoying :** The final countdown… Ultra annoying pranks, like session scripts or resets.

## 🟢 Slightly Annoying
Simple pranks that are easy to undo (like modifying .zshrc)

### 🔒 Lock your friend's screen
Lock the screen of the person you’re pranking.
```bash
ft_lock
```

### 🎬 Lowcost Matrix
Always wanted to be an actor in The Matrix? Create a Matrix effect, but without the budget to hire developers.
```bash
echo 'cat /dev/urandom' >> ~/.zshrc
```
<details>
  <summary>🧹 How to remove ?</summary>

Remove the line 'alias cat /dev/urandom' from your ~/.zshrc file to stop the Matrix effect. Or use this command:
```bash
sed -i '/cat /dev/urandom/d' ~/.zshrc
```
</details>

### 🐱 Tac or Cat ?
Replace the `cat` command with `rev`, which prints the file in reverse.
```bash
echo 'alias cat="rev"' >> ~/.zshrc
```
<details>
  <summary>🧹 How to remove ?</summary>

Remove the line 'alias cat="rev"' from your ~/.zshrc file to restore the original `cat` command. Or use this command:
```bash
sed -i '/alias cat="rev"/d' ~/.zshrc
```
</details>

### 📖 Where is the fucking manual ?
Replace the man command with a message saying `No manual entry for {command}`.
```bash
echo 'man() { echo "No manual entry for $1"; }' >> ~/.zshrc
```
<details>
  <summary>🧹 How to remove ?</summary>

Remove the line 'alias man="echo No manual entry for {command}"' from your ~/.zshrc file to restore the original `man` command. Or use this command:
```bash
sed -i '/alias man="echo No manual entry for {command}"/d' ~/.zshrc
```
</details>

### 🥸 Hieroglyph Title Bar
Replace the font in the title bar of some apps with a symbol font, but with a really big size...
```bash
gsettings set org.gnome.desktop.wm.preferences titlebar-uses-system-font false && gsettings set org.gnome.desktop.wm.preferences titlebar-font 'wasy10 256'
```
<details>
  <summary>🧹 How to remove ?</summary>

Restore the title bar font to the system default with this command:
```bash
gsettings set org.gnome.desktop.wm.preferences titlebar-uses-system-font true
```
</details>

### 🖱️ Cursor Finder
This command make the cursor at size of 256px.
>[!NOTE]
> Some cursor are not avaible at a size of 256px. In this case, Gnome will take the larger.
```bash
gsettings set org.gnome.desktop.interface cursor-size 256
```
<details>
  <summary>🧹 How to remove ?</summary>

Use this command :
```bash
gsettings set org.gnome.desktop.interface cursor-size 24
```
</details>

### ❌ XXX ?
Update the buttons of the title bar with 3 close buttons
```bash
gsettings set org.gnome.desktop.wm.preferences button-layout ':close,close,close'
```
<details>
  <summary>🧹 How to remove ?</summary>

Use this command :
```bash
gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'
```
</details>

### 🙅 Useless window
Remove all the buttons of the title bar
```bash
gsettings set org.gnome.desktop.wm.preferences button-layout ':'
```
<details>
  <summary>🧹 How to remove ?</summary>

Use this command :
```bash
gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'
```
</details>

## 🟡 Moderately Annoying
A step up! These pranks are a bit more troublesome but can be undone with the right know-how 😘

### 📺 AdSh - Ads in your shell
Tired of an ad-free terminal? Now you can add ads to pop up when you type commands in your terminal.
```bash
curl https://raw.githubusercontent.com/godetremy/42-trolls/refs/heads/main/adsh/install.sh | bash
```
<details>
  <summary>🧹 How to remove ?</summary>

Remove the line at end of the `.zshrc` file, then delete the folder `.adsh` in your home, or use this command :
```bash
curl https://raw.githubusercontent.com/godetremy/42-trolls/refs/heads/main/adsh/uninstall.sh | bash
```
</details>

<details>
  <summary>🪄 Want to contribute ?</summary>

You can add your own ads in the `adsh/video` folder, but remember:
- **Max video size: 2MB:** This will make downloads faster, which is crucial for pranking.
- **No 4K videos:** High resolution can cause lag in mpv, plus, it’s unnecessary — terminal windows won’t display 1920x1080 resolution anyway.

Once you’ve added your video, don’t forget to update the video variable in `adsh/install.sh` and `adsh/adsh.sh`
</details>

### 🍎 FallingKey
A feeling like Isac Newton, when you type letter are falling from the top of your screen.
```bash
curl https://raw.githubusercontent.com/godetremy/42-trolls/refs/heads/main/fallingkey/run.sh | bash
```
<details>
  <summary>🧹 How to remove ?</summary>

The easy way is to logout, but if you don't want to do this you can find `ft_keyboard` in the sytem monitor.
```bash
pkill -f ft_keyboard
```
</details>

## 🟠 Very Annoying
Ready for more? These pranks involve taking control of hardware features… like sound, graphics, and storage!

### 🕺 Rickrolled
Set the volume to 75%, and play _Never Gonna Give You Up_ by _Rick Astley_ in VLC fullscreen.
```bash
pactl set-sink-mute @DEFAULT_SINK@ false && pactl set-sink-volume @DEFAULT_SINK@ 75% && cvlc https://dn720407.ca.archive.org/0/items/rick-roll/Rick%20Roll.ia.mp4 -f --no-video-title-show --mouse-hide-timeout 0
```

### 🔑 NoLock
Replace the lock button. Now when you lock, Mario say "Non".
```bash
curl https://raw.githubusercontent.com/godetremy/42-trolls/refs/heads/main/nolock/install.sh | bash
```
<details>
  <summary>🧹 How to remove ?</summary>

Use this command :
```bash
curl https://raw.githubusercontent.com/godetremy/42-trolls/refs/heads/main/nolock/uninstall.sh | bash
```
</details>

### 🎲 Random Mouse
The default configuration of mouse is so boring... Why not randomize all the button of your mouse every 2s ?
```bash
while true; do xmodmap -e "pointer = $(shuf -e 1 2 3 | paste -sd ' ')" ; sleep 2; done & disown
```
<details>
  <summary>🧹 How to remove ?</summary>

The simplest method is to disconnect, but we wish you good luck finding the right button... 😘

Then you can use this command to reset the original mapping.
```bash
xmodmap -e "pointer = 1 2 3"
```
</details>

### 😇 Be Polite
Your parents didn’t teach you manners? Neither did the terminal! From now on, you must add the magic word `stp` at the end of every command to execute it.
```bash
curl https://raw.githubusercontent.com/godetremy/42-trolls/refs/heads/main/bepolite/install.sh | bash
```
<details>
  <summary>🧹 How to remove ?</summary>

Find these linse in your `~/.zshrc` then delete the content between.

```bash
# === BePolite start ===
...
# === BePolite end ===
```
</details>

### 🏗️ Falling Steel
Every time a command fails, a metal pipe crashes into the terminal !
```bash
echo 'wget https://www.myinstants.com/media/sounds/metal-pipe-clang.mp3 -O ~/metal_pipe.mp3 -o /dev/null; precmd() { if [[ $? -ne 0 ]]; then pactl set-sink-mute @DEFAULT_SINK@ false && pactl set-sink-volume @DEFAULT_SINK@ 50%; ( ffplay -nodisp -autoexit -loglevel quiet ~/metal_pipe.mp3 >/dev/null 2>&1 & ); fi; }' >> ~/.zshrc
```
<details>
  <summary>🧹 How to remove ?</summary>

Find these linse in your `~/.zshrc` then delete the line.

```bash
wget https://www.myinstants.com/media/sounds/metal-pipe-clang.mp3 -O ~/metal_pipe.mp3 -o /dev/null; precmd() { if [[ $? -ne 0 ]]; then pactl set-sink-mute @DEFAULT_SINK@ false && pactl set-sink-volume @DEFAULT_SINK@ 50%; ( ffplay -nodisp -autoexit -loglevel quiet ~/metal_pipe.mp3 >/dev/null 2>&1 & ); fi; }
```
</details>

### 🔐 You got locked!
Lock the user every random seconds.
```bash
((while true; do sleep $((60 + $RANDOM % 60)) && ft_lock; done) & ) &
```
<details>
  <summary>🧹 How to remove ?</summary>

The easy way is to logout, but if you don't want to do this, find the parent process of sleep using `pstree -p` and kill it using `kill <PID>`.
```bash
pstree -p
kill <PID>
```
</details>

## 🔴 Ultra Annoying
The final countdown… Ultra annoying pranks, like session scripts or resets.

### 💀 Delog
Delog the user after 5 minutes.
```bash
(sleep 300 && loginctl terminate-user \"$USER_SESSION\") &
```

### 🗑️ Files? What files?
Delete all files in the session — this will reset the session completely.
>[!CAUTION]
> This action cannot be undone. This is more than just a troll. All files in the session will be deleted. Make sure you have your friend’s permission before using this.
```bash
touch ~/.reset
```


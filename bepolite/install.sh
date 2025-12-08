#!/bin/bash

echo "Downloading files..."

mkdir -p ~/.bepolite/sources

curl -o ~/.bepolite/sources/main.c https://raw.githubusercontent.com/godetremy/42-trolls/main/bepolite/executable/main.c
curl -o ~/.bepolite/sources/Makefile https://raw.githubusercontent.com/godetremy/42-trolls/main/bepolite/executable/Makefile
mkdir -p ~/.bepolite/sources/frames
curl -o ~/.bepolite/sources/frames/frame00.bmp https://raw.githubusercontent.com/godetremy/42-trolls/main/bepolite/executable/frames/frame00.bmp
curl -o ~/.bepolite/sources/frames/frame01.bmp https://raw.githubusercontent.com/godetremy/42-trolls/main/bepolite/executable/frames/frame01.bmp
curl -o ~/.bepolite/sources/frames/frame02.bmp https://raw.githubusercontent.com/godetremy/42-trolls/main/bepolite/executable/frames/frame02.bmp

echo "Building..."

make -C ~/.bepolite/sources/ > /dev/null 2>&1

echo "Installing..."

cat >> ~/.zshrc << 'EOF'
# === BePolite start ===

stp_keyword() {
	local -a parts
	parts=("${(z)BUFFER}")
	local last="${parts[-1]}"

	if [[ $last == stp ]]; then
  		unset 'parts[-1]'
	else
		echo
		echo "YOU DIDN'T SAY THE MAGIC WORD"
        (cd ~/.bepolite/sources && ./BePolite)
		zle reset-prompt
		return
	fi
	
	BUFFER="${(j: :)parts}"
	CURSOR=${#BUFFER}
	printf " stp"
	zle .accept-line
}

zle -N stp_keyword
bindkey '\r' stp_keyword
bindkey -M viins '\r' stp_keyword
bindkey -M vicmd '\r' stp_keyword

# === BePolite end ===
EOF

echo "BePolite has been installed. Please restart your terminal or run 'source ~/.zshrc' to activate it."
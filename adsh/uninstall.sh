rm -r ~/.adsh

sed -i '' 's/preexec () { bash ~\/.adsh\/adsh.sh }//' ~/.zshrc

echo "Done. You will now have to relaunch all your terminal."

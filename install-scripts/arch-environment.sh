#!env /usr/bin/bash

./arch-dev.sh

echo "Installing enviornment..."

sudo pacman -S sway waybar


echo -e "- Erasing \e[34msway\e[0m"
rm -rf $HOME/.config/sway/
echo -e "└ \e[32mApplying\e[0m "
ln -s $PWD/sway $HOME/.config/sway

echo -e "- Erasing \e[34mwaybar\e[0m"
rm -rf $HOME/.config/waybar/
echo -e "└ \e[32mApplying\e[0m "
ln -s $PWD/waybar $HOME/.config/waybar

#!/usr/bin/bash
echo -e "\e[33m[!] THIS WILL REMOVE OLD CONFIGS\e[0m"
echo -n "Apply config? [y/N]: "
read CONFIRMATION

if [[ $CONFIRMATION != "y" ]] && [[ $CONFIRMATION != "Y" ]]; then
    exit
fi


echo -e "\n- Erasing \e[34mnvim\e[0m"
rm -rf $HOME/.config/nvim
echo -e "└ \e[32mApplying\e[0m "
ln -s $PWD/nvim $HOME/.config/nvim

echo -e "- Erasing \e[34malacritty\e[0m"
rm -rf $HOME/.config/alacritty/
echo -e "└ \e[32mApplying\e[0m "
ln -s $PWD/alacritty $HOME/.config/alacritty


echo -e "\nDone"

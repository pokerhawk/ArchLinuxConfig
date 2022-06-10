#!/bin/bash

echo "installing i3wm and xorg..."
sleep 1

sudo pacman -S xorg xorg-xinit i3
sleep 1

cp ../xinit-myscript/i3/.xinitrc ~/.xinitrc
cp ../xinit-myscript/.myscript.sh ~/.myscript.sh

sudo pacman -S numlockx terminator rofi ranger htop polybar feh leafpad pulseaudio lxappearance picom radeontop ttf-liberation ffmpegthumbnailer gufw arandr
sleep 2

#MOVENDO CONFIG FILES

mv ../config/i3 ~/.config/

mv ../config/polybar ~/.config/

#mv ../fancontrol/fancontrol /etc/

#INSTALANDO ESSAS PACKAGES:

#terminator | rofi | ranger
#htop | polybar | feh
#leafpad | pulseaudio | lxappearance
#picom | radeontop | ttf-liberation
#ffmpegthumbnailer | gufw | arandr
#numlockx

echo && echo && echo && echo && echo && echo
echo "!!See the README file for extra packages!!"
echo && echo && echo && echo && echo && echo
echo "Reboot the system? [Y/n]"
read resposta
if ["$resposta" == "y" || "$resposta" == "Y" || "$resposta" == ""]; then
reboot
else echo "everything is done"
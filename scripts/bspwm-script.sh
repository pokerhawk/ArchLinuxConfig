#!/bin/bash

echo "installing xorg, bspwm and sxhkd..."
sleep 1

sudo pacman -S xorg xorg-xinit bspwm sxhkd
sleep 1

cp ../xinit-myscript/bspwm/.xinitrc ~/.xinitrc
cp ../xinit-myscript/.myscript.sh ~/.myscript.sh

sudo pacman -S numlockx terminator rofi ranger htop polybar feh leafpad pulseaudio lxappearance picom radeontop ttf-liberation ffmpegthumbnailer gufw arandr
sleep 2

#MOVENDO CONFIG FILES

mkdir ~/.config/bspwm
cp /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/
echo "~/.fehbg" >> ~/.config/bspwm/bspwmrc
echo "~/.myscript.sh" >> ~/.config/bspwm/bspwmrc

mkdir ~/.config/sxhkd
mv ../config/sxhkd/sxhkdrc ~/.config/sxhkd

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

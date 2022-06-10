#!/bin/bash

sudo pacman -S xorg xorg-xinit bspwm
sleep 2

#cp/etc/X11/xinit/xinitrc ~/.xinitrc

sudo pacman -S terminator rofi ranger htop polybar feh leafpad pulseaudio lxappearance picom radeontop ttf-liberation ffmpegthumbnailer gufw arandr
sleep 2

#MOVENDO CONFIG FILES

mv ./bspwm ~/.config/
mv ./sxhkd ~/.config/
#mv ./i3 ~/.config/
mv ./polybar ~/.config/
mv ./pk/.myscript.sh ~/
mv ./pk/.xinitrc ~/
#mv ./fancontrol/fancontrol /etc/

#INSTALANDO ESSAS PACKAGES:

#terminator | rofi | ranger
#htop | polybar | feh
#leafpad | pulseaudio | lxappearance
#picom | radeontop | ttf-liberation
#ffmpegthumbnailer | gufw | arandr
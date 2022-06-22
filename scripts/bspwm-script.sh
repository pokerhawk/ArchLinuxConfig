#!/bin/bash

# INSTALANDO WINDOW MANAGER

sudo pacman -Syu
sudo pacman -S xorg xorg-xinit xorg-xsetroot bspwm sxhkd

# INSTALANDO PACKAGES

sudo pacman -S terminator rofi bpytop htop ranger polybar feh leafpad pavucontrol picom ttf-liberation mocp ffmpegthumbnailer maim xclip
sudo pacman -S pulseaudio
sudo pacman -S lxappearance
sudo pacman -S radeontop
sudo pacman -S nautilus
sudo pacman -S pacmanfm gvfs
sudo pacman -S numlockx
sudo pacman -S gufw
sudo pacman -S lolcat

clear
echo "arandr é para configurar posição dos monitores"
sudo pacman -S arandr
sudo pacman -S ntfs-3g
sudo pacman -S firefox
clear
sleep 1

# MOVENDO XINIT

cp ../xinit-myscript/bspwm/.xinitrc ~/.xinitrc

#BSPWM

mkdir ~/.config/bspwm
echo "Copiar arquivo bspwm de /usr/share/doc/bspwm/example? ou utilizar arquivo personalizado? [copia/pers]"
read bspwmconfig
if [ $bspwmconfig == "copia" ]; then
	cp /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/
	echo "~/.fehbg" >> ~/.config/bspwm/bspwmrc
elif [ $bspwmconfig == "pers" ]; then
	cp ../config/bspwm/bspwmrc ~/.config/bspwm
fi

#SXHKD

mkdir ~/.config/sxhkd
mv ../config/sxhkd/sxhkdrc ~/.config/sxhkd

#POLYBAR

mv ../config/polybar ~/.config/

#WALLPAPER E THEME

mkdir ~/Pictures/
mv ../kaylesideansty.jpg ~/Pictures/
feh --bg-fill ~/Pictures/kaylesideansty.jpg
if [[ -f "/home/pk/.moc/config" ]]; then
	echo "XTermTheme = transparent-background" >> ~/.moc/config
fi
sudo cp -r ../Adwaita-dark /usr/share/themes/

#PICOM (blur background)

cp -r ../config/picom ~/.config

#ADICIONANDO IGNORE-CASE

echo "set completion-ignore-case on" >> /etc/inputrc

#BASHRC personalizado

clear
cat ../xinit-bashrc/.bashrc
echo "bashrc personalizado? [Y/n]"
read bashrc
if [ $bashrc == "y" ] | [ $bashrc == "Y" ]; then
cp ../xinit-bashrc/.bashrc ~/
fi

#FIM

echo && echo && echo && echo && echo && echo
echo "!!See the README file for extra packages!!"
echo && echo && echo && echo && echo && echo
echo "Reboot the system? [Y/n]"
read resposta
if [ $resposta == "y" ]||[ $resposta == "Y" ]; then
	reboot
else
	echo "everything is done"
fi

#!/bin/bash

# INSTALANDO WINDOW MANAGER

sudo pacman -Syu
echo "INSTALLING XORG/-XINIT/XSETROOT BSPWM SXHKD"
sudo pacman -S xorg xorg-xinit xorg-xsetroot bspwm sxhkd

# INSTALANDO PACKAGES
echo "INSTALLING TERMINATOR"
sudo pacman -S terminator
sudo pacman -S rofi bpytop htop ranger polybar feh leafpad picom ttf-liberation ffmpegthumbnailer maim xclip
echo "INSTALLING PULSEAUDIO AND PAVUCONTROL"
sudo pacman -S pulseaudio pavucontrol
echo "INSTALLING LXAPPEARANCE"
sudo pacman -S lxappearance
echo "INSTALLING RADEONTOP"
sudo pacman -S radeontop
echo "INSTALLING NAUTILUS"
sudo pacman -S nautilus
echo "INSTALLING PACMANFM AND GVFS"
sudo pacman -S pacmanfm gvfs
echo "INSTALLING NUMLOCKX"
sudo pacman -S numlockx
echo "INSTALLING UFW AND GUFW"
sudo pacman -S ufw gufw
echo "INSTALLING LOLCAT"
sudo pacman -S lolcat

clear
echo "INSTALLING ARAND"
echo "arandr é para configurar posição dos monitores"
sudo pacman -S arandr
echo "INSTALLING NTFS PARA LER WINDOWS FILES"
sudo pacman -S ntfs-3g
echo "INSTALLING FIREFOX"
sudo pacman -S firefox
clear
sleep 1

# MOVENDO XINIT

cp ../xinit-bashrc/bspwm/.xinitrc ~/.xinitrc

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
cp ../config/sxhkd/sxhkdrc ~/.config/sxhkd

#POLYBAR

cp -r ../config/polybar ~/.config/

#WALLPAPER, THEME AND PICOM ON MOCP

mkdir ~/Pictures/
cp ../kaylesideansty.jpg ~/Pictures/
feh --bg-fill ~/Pictures/kaylesideansty.jpg

if [[ -f "/home/pk/.moc/config" ]]; then
	echo "XTermTheme = transparent-background" >> ~/.moc/config
fi
echo "COPIANDO ADWAITA-DARK THEM AND SWEET-CURSORS TO /usr/share/"
sudo cp -r ../Adwaita-dark /usr/share/themes/
sudo cp -r ../Sweet-cursors /usr/share/icons/

#PICOM (blur background)

cp -r ../config/picom ~/.config

#ADICIONANDO IGNORE-CASE

sudo echo "set completion-ignore-case on" >> /etc/inputrc

#BASHRC personalizado

clear
cat ../xinit-bashrc/.bashrc
echo "bashrc personalizado? [Y/n]"
read bashrc
if [ $bashrc == "y" ]||[ $bashrc == "Y" ]; then
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

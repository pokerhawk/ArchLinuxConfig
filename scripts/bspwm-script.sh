#!/bin/bash

# INSTALANDO WINDOW MANAGER

sudo pacman -Syu
echo "INSTALLING XORG/-XINIT/XSETROOT BSPWM SXHKD"
sudo pacman -S xorg xorg-xinit xorg-xsetroot bspwm sxhkd
clear

# INSTALANDO PACKAGES

echo "INSTALLING TERMINATOR"
sudo pacman -S terminator
clear
echo "INSTALANDO PACK DOS ESSENCIAIS"
sudo pacman -S git nano rofi bpytop htop ranger polybar feh leafpad picom ttf-liberation ffmpegthumbnailer maim xclip slock
clear
echo "INSTALLING SYNTAX HIGHLIGHTER(NOT NEEDED)"
sudo pacman -S nano-syntax-highlighting
clear
echo "INSTALLING PULSEAUDIO AND PAVUCONTROL"
sudo pacman -S pulseaudio pavucontrol
clear
echo "INSTALLING LXAPPEARANCE"
sudo pacman -S lxappearance
clear
echo "INSTALLING RADEONTOP"
sudo pacman -S radeontop
clear
echo "INSTALLING NAUTILUS"
sudo pacman -S nautilus
clear
echo "INSTALLING PACMANFM AND GVFS"
sudo pacman -S pacmanfm gvfs
clear
echo "INSTALLING NUMLOCKX"
sudo pacman -S numlockx
clear
echo "INSTALLING UFW AND GUFW"
sudo pacman -S ufw gufw
clear
echo "INSTALLING LOLCAT"
sudo pacman -S lolcat
clear
echo "INSTALLING ARAND"
echo "arandr é para configurar posição dos monitores"
sudo pacman -S arandr
clear
echo "INSTALLING NTFS PARA LER WINDOWS FILES"
sudo pacman -S ntfs-3g
clear
echo "INSTALLING FIREFOX"
sudo pacman -S firefox
clear
sleep 1

# MOVENDO XINIT

cp ../xinit-bashrc/bspwm/.xinitrc ~/.xinitrc

#BSPWM

sudo mkdir ~/.config/bspwm
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
cp -r ../config/sxhkd/sxhkdrc ~/.config/sxhkd

#POLYBAR

mkdir ~/.config/polybar
cp ../config/polybar/config.ini ~/.config/polybar
cp ../config/polybar/launch.sh ~/.config/polybar

#WALLPAPER, THEME AND PICOM ON MOCP

mkdir ~/Pictures/
cp ../kaylesideansty.jpg ~/Pictures/
feh --bg-fill ~/Pictures/kaylesideansty.jpg

echo "MOCP TRANSPARENTE // SÓ FAZ SE MOCP ESTIVER INSTALADO"
if [[ -f "/home/pk/.moc/config" ]]; then
	cp /usr/share/doc/moc/config.example ~/.moc/config
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

#INSTALLING LUTRIS ESSENTIALS

echo "INSTALANDO PACOTES ESSENCIAIS PARA LUTRIS"
sudo pacman -S --needed lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader

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

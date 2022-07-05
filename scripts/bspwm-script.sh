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
echo "INSTALLING ALACRITTY"
sudo pacman -S alacritty
clear
echo "INSTALANDO PACK DOS ESSENCIAIS"
sudo pacman -S git nano rofi bpytop htop ranger polybar feh neofetch leafpad picom ttf-liberation ffmpegthumbnailer maim xclip slock nomacs
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
echo "INSTALLING PCMANFM AND GVFS"
sudo pacman -S pcmanfm gvfs
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

cp -v ../xinit-bashrc/bspwm/.xinitrc ~/.xinitrc

#BSPWM

mkdir ~/.config
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
if [ -f '/usr/bin/terminator' ]; then
	cp -r -v ../config/sxhkd/sxhkdrc ~/.config/sxhkd
fi
if [ -f '/usr/bin/alacritty' ]; then
	cp -r -v ../config/sxhkd_alacritty/sxhkdrc ~/.config/sxhkd
fi

#POLYBAR

mkdir ~/.config/polybar
cp -v ../config/polybar/config.ini ~/.config/polybar
cp -v ../config/polybar/launch.sh ~/.config/polybar

#WALLPAPER, THEME AND PICOM ON MOCP

mkdir ~/Pictures/
cp -v ../kaylesideansty.jpg ~/Pictures/
feh --bg-fill ~/Pictures/kaylesideansty.jpg

echo "MOCP TRANSPARENTE // SÓ FAZ SE MOCP ESTIVER INSTALADO"
if [[ -f "/home/pk/.moc/config" ]]; then
	cp -v ../config/moc/config ~/.moc/
	#cp /usr/share/doc/moc/config.example ~/.moc/config
	#echo "XTermTheme = transparent-background" >> ~/.moc/config
fi
echo "COPIANDO ADWAITA-DARK THEM AND SWEET-CURSORS TO /usr/share/"
sudo cp -r -v ../Adwaita-dark /usr/share/themes/
sudo cp -r -v ../Sweet-cursors /usr/share/icons/

#PICOM (blur background)

cp -r -v ../config/picom ~/.config

#ADICIONANDO IGNORE-CASE				FIX

sudo echo "set completion-ignore-case on" >> /etc/inputrc

#BASHRC personalizado

clear
cat ../xinit-bashrc/.bashrc
echo "bashrc personalizado? [Y/n]"
read bashrc
if [ $bashrc == "y" ]||[ $bashrc == "Y" ]; then
	cp -v ../xinit-bashrc/.bashrc ~/
fi

#TERMINATOR AND ALACRITTY config

if [ -f "/usr/bin/terminator" ]; then
	cp -r -v ../config/terminator ~/.config/
fi
if [ -f "/usr/bin/alacritty" ]; then
	cp -r -v ../config/alacritty ~/.config/
fi

#MOVING EXTRA CONFIG FILES

cp -r -v ../config/extra_config_files/ ~/.config/
chmod +x ~/.config/extra_config_files/bspwm_smart_move

#INSTALLING LUTRIS ESSENTIALS

echo "INSTALANDO PACOTES ESSENCIAIS PARA LUTRIS/AMD DRIVES"
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

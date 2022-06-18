#!/bin/bash

# INSTALANDO WINDOW MANAGER
sudo pacman -Syu
sudo pacman -S xorg xorg-xinit bspwm sxhkd

# MOVENDO XINIT E MYSCRIPT

cp ../xinit-myscript/bspwm/.xinitrc ~/.xinitrc
cat ../xinit-myscript/.myscript.sh
echo "Você quer copiar esse arquivo .myscript.sh para /home? [Y/n] "
read copia
if [ $copia == "y" ] || [ $copia == "Y" ]; then
	cp ../xinit-myscript/.myscript.sh ~/.myscript.sh
fi
mkdir ~/.myscript.sh
chmod +x ~/.myscript.sh
echo "picom &" >> ~/.myscript.sh
echo "polybar" >> ~/.myscript.sh
echo "Você quer adicionar xinput? [Y/n]"
read xinput
if [ $xinput == "y" ]; then
	echo "xinput --set-prop 13 291 -1" >> ~/.myscript.sh
fi
echo "Você quer adicionar numlockx? [Y/n]"
read numlockx
if [ $numlockx == "y" ]; then
	echo "/usr/bin/numlockx on" >> ~/.myscript.sh
fi

# INSTALANDO PACKAGES

sudo pacman -S terminator rofi htop ranger polybar feh leafpad pulseaudio pavucontrol picom ttf-liberation mocp ffmpegthumbnailer maim xclip
sudo pacman -S lxappearance
sudo pacman -S radeontop
sudo pacman -S nautilus
sudo pacman -S pacmanfm gvfs
sudo pacman -S numlockx
sudo pacman -S gufw
sudo pacman -S arandr
sudo pacman -S ntfs-3g
sudo pacman -S firefox
sleep 1

#MOVENDO CONFIG FILES
#BSPWM
mkdir ~/.config/bspwm
echo "Copiar arquivo bspwm de /usr/share/doc/bspwm/example? ou utilizar arquivo personalizado? [copia/pers]"
read bspwmconfig
if [ $bspwmconfig == "copia" ]; then
	cp /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/
	echo "~/.fehbg" >> ~/.config/bspwm/bspwmrc
	echo "~/.myscript.sh" >> ~/.config/bspwm/bspwmrc
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

#mv ../fancontrol/fancontrol /etc/

#INSTALANDO ESSAS PACKAGES:

#terminator | rofi | ranger
#htop | polybar | feh
#leafpad | pulseaudio | lxappearance
#picom | radeontop | ttf-liberation
#ffmpegthumbnailer | gufw | arandr
#numlockx | maim | xclip | mocp

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

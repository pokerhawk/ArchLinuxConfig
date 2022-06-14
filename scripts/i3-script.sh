#!/bin/bash
# DEPRECATED / OUTDATED
sudo pacman -Syu

echo "installing i3wm and xorg..."
sleep 1

sudo pacman -S xorg xorg-xinit i3
sleep 1

cp ../xinit-myscript/i3/.xinitrc ~/.xinitrc
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

sudo pacman -S terminator rofi htop ranger polybar feh mocp leafpad pulseaudio pavucontrol picom ttf-liberation ffmpegthumbnailer maim xclip
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

mv ../config/i3 ~/.config/

mv ../config/polybar ~/.config/

mkdir ~/Pictures/
mv ../kaylesideansty.jpg ~/Pictures/
feh --bg-fill ~/Pictures/kaylesideansty.jpg

sudo cp -r ../Adwaita-dark /usr/share/themes/
if [[ -f "/home/pk/.moc/config" ]]; then
	echo "XTermTheme = transparent-background" >> ~/.moc/config
fi
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

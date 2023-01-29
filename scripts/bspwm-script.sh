#!/bin/bash

# INSTALANDO WINDOW MANAGER

sudo pacman -Syu
echo "INSTALLANDO OS ESSENCIAIS"
sudo pacman -S xorg xorg-xinit xorg-xsetroot bspwm sxhkd nano rofi bpytop htop ranger polybar feh neofetch leafpad picom ffmpegthumbnailer maim xclip slock nomacs ctags gucharmap pulseaudio pavucontrol lxappearance numlockx alacritty xbindkeys polkit dunst
clear
echo "INSTALLING BASE-DEVELS"
sudo pacman -S --needed base-devel
clear
echo "INSTALANDO LIBS/FONTS AND EXTRA SHIT"
sudo pacman -S sndio portaudio wavpack noto-fonts noto-fonts-emoji noto-fonts-extra ttf-liberation adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts noto-fonts-cjk
clear
echo "INSTALLING LOLCAT"
sudo pacman -S lolcat
clear

#IF conditions

echo "passar pelos programas desnecessários? [Y/n]"
read progdesn
if [ $progdesn == "Y" ]||[ $progdesn == "y" ]||[ -z "$progdesn" ]; then
	echo "INSTALLING SYNTAX HIGHLIGHTER(NOT NEEDED)"
	sudo pacman -S nano-syntax-highlighting
	clear
	echo "INSTALLING RADEONTOP"
	sudo pacman -S radeontop
	clear
	echo "INSTALLING UFW AND GUFW"
	sudo pacman -S ufw gufw
	clear
	echo "INSTALLING ARAND"
	echo "arandr é para configurar posição dos monitores"
	sudo pacman -S arandr
	clear
	echo "INSTALLING NTFS PARA LER WINDOWS FILES"
	sudo pacman -S ntfs-3g
	clear
	echo "INSTALLING NVIM"
	sudo pacman -S neovim
	clear
fi

echo " wich file manager? [PCMAN/thunar/nautilus]"
read filemanager
if [ $filemanager == "pcman" ]||[ $filemanager == "PCMAN" ]||[ -z "$filemanager" ]; then
	sudo pacman -S pcmanfm gvfs
elif [ $filemanager == "thunar" ]||[ $filemanager == "THUNAR" ]; then
	sudo pacman -S thunar gvfs
elif [ $filemanager == "nautilus" ]||[ $filemanager == "NAUTILUS" ]; then
	sudo pacman -S nautilus
fi

echo "INSTALLING CHROMIUM"
sudo pacman -S chromium
clear
if [ -f "/usr/bin/chromium" ]; then
	echo "chromium installed"
else
	echo "INSTALLING FIREFOX"
	sudo pacman -S firefox
	clear
fi

#INSTALLING LUTRIS ESSENTIALS

echo "INSTALANDO PACOTES ESSENCIAIS PARA LUTRIS/AMD DRIVES AND ELSE"
sudo pacman -S --needed lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader
clear

##CONFIG FILES

# MOVENDO XINIT

cp -v ../xinit-bashrc/bspwm/.xinitrc ~/.xinitrc

#BSPWM

mkdir ~/.config
sudo mkdir ~/.config/bspwm
echo -e "--BSPWM--\n1.Default config\n2.Your config\n3.Side config"
read bspwmconfig
if [ $bspwmconfig == "1" ]; then
	sudo cp -v /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/
	echo "~/.fehbg" >> ~/.config/bspwm/bspwmrc
elif [ $bspwmconfig == "2" ]; then
	sudo cp -v ../config/bspwm/bspwmrc ~/.config/bspwm/bspwmrc
elif [ $bspwmconfig == "3" ];then
	sudo cp -v ../config/bspwm/bspwmrc_side ~/.config/bspwm/bspwmrc
fi

#SXHKD

mkdir ~/.config/sxhkd
if [ -f '/usr/bin/terminator' ]; then
	cp -r -v ../config/sxhkd/sxhkdrc ~/.config/sxhkd
fi
if [ -f '/usr/bin/alacritty' ]; then
	cp -r -v ../config/sxhkd_alacritty/sxhkdrc ~/.config/sxhkd
fi

#WALLPAPER, THEME AND PICOM ON MOCP

mkdir ~/Pictures/
cp -v ../img/kaylesideansty.jpg ~/Pictures/
cp -v ../img/jap_alphabet.jpg ~/Pictures/
clear
echo -e "--FEH--\nSetting wallpaper:\nExample: feh --bg-fill '~/Pictures/kaylesideansty.jpg' --bg-scale '~/Pictures/jap_alphabet.jpg'\n---\nPictures in Folder:"
ls ~/Pictures/
echo -e "\n\n Type your command to set wallpaper:"
read WALLPAPER_COMMAND
$WALLPAPER_COMMAND
clear

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

#BASHRC personalizado

clear
cat ../xinit-bashrc/.bashrc
echo "bashrc personalizado? [Y/n](Terminal with the colors)"
read bashrc
if [ $bashrc == "y" ]||[ $bashrc == "Y" ]||[ -z "$bashrc" ]; then
	cp -v ../xinit-bashrc/.bashrc ~/
fi

#CONFIG FILES:

mkdir ~/.config/polybar
echo -e "--POLYBAR--\n1.Normal config files\n2.Your PC config files\n--------------[1/2]"
read POLYBAR_ANSWER
if [ $POLYBAR_ANSWER == "1" ];then
	cp -v ../config/polybar/config_side.ini ~/.config/polybar/config.ini
	cp -v ../config/polybar/launch_side.sh ~/.config/polybar/launch.sh
	cp -r -v ../config/nvim/ ~/.config/
	mkdir ~/.config/extra_config_files
	cp -v ../config/extra_config_files/bspwm_smart_move
	cp -v ../config/extra_config_files/bspwm_extra_side
	chmod +x ~/.config/extra_config_files/bspwm_extra_side
elif [ $POLYBAR_ANSWER == '2' ];then
	cp -v ../config/polybar/config.ini ~/.config/polybar
	cp -v ../config/polybar/launch.sh ~/.config/polybar
	cp -r -v ../config/nvim/ ~/.config/
	mkdir ~/.config/extra_config_files
	cp -v ../config/extra_config_files/bspwm_smart_move
	cp -v ../config/extra_config_files/bspwm_extra_exec
	chmod +x ~/.config/extra_config_files/bspwm_smart_move
	chmod +x ~/.config/extra_config_files/bspwm_extra_exec
fi
clear

#TERMINATOR AND ALACRITTY config

if [ -f "/usr/bin/terminator" ]; then
	cp -r -v ../config/terminator ~/.config/
elif [ -f "/usr/bin/alacritty" ]; then 
	cp -r -v ../config/alacritty ~/.config/
fi

#FIM

clear
echo "!!See the README file for extra packages!!"
echo "Reboot the system? [Y/n]"
read resposta
if [ $resposta == "y" ]||[ $resposta == "Y" ]||[ -z "$resposta" ]; then
	reboot
else
	echo "everything is done"
fi

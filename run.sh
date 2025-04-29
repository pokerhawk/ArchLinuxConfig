#!/bin/bash

REPO_DIR=$(sudo find /home/$USER -iname "ArchLinuxConfig" | grep -a1 /)
NUMBER_OF_MONITORS=$(xrandr|grep " connected" | awk '{print $1}' | wc -l)
SECOND_MONITOR=$(xrandr --listactivemonitors | grep -v "Monitors" | cut -d" " -f6 | awk 'NR==2')

# INSTALANDO WINDOW MANAGER
clear
echo -e "\n\n\n"
echo "**************************************************"
echo "Instalando WM(Window Manager) + programas padrões"
echo "**************************************************"
echo -e "\n\n\n"

echo "Este dispositivo é um PC ou notebook? [PC/note]"
read HARDWARE

sudo pacman -S xorg xorg-xinit xorg-xsetroot bspwm sxhkd polybar alacritty
sudo pacman -S nano rofi bpytop htop ranger feh neofetch leafpad picom ffmpegthumbnailer maim xclip slock ctags gucharmap pulseaudio pavucontrol lxappearance numlockx xbindkeys polkit dunst font-manager linux-headers dkms viewnior kolourpaint ntp jq unzip npm pipewire ripgrep go git

if [ $HARDWARE == "PC" ];then
	sudo pacman -Syu
	sudo pacman -S --needed base-devel
	clear
else
	sudo pacman -Syu
	sudo pacman -S xf86-input-synaptics
	sudo pacman -S --needed base-devel
	cp -v $REPO_DIR/config/touchpad/40-synaptics.conf /etc/X11/xorg.conf.d/
	clear
fi


echo -e "\n\n\n"
echo "**************************************************"
echo "Instalando fontes + libs (Recomendado)"
echo "**************************************************"
echo -e "\n\n\n"

sudo pacman -S sndio portaudio wavpack noto-fonts noto-fonts-emoji noto-fonts-extra ttf-liberation adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts noto-fonts-cjk ttf-font-awesome adobe-source-code-pro-fonts
clear

echo -e "\n\n\nNerd Fonts (BIG):\n\n\n"
sudo pacman -S nerd-fonts
clear

echo -e "\n\n\n"
echo "**************************************************"
echo "INSTALLING BLUETOOTH"
echo "**************************************************"
echo -e "\n\n\n"

sudo pacman -S bluez bluez-tools bluez-utils blueman


echo -e "\n\n\n"
echo "**************************************************"
echo "INSTALLING LOLCAT"
echo "**************************************************"
echo -e "\n\n\n"

sudo pacman -S lolcat ruby rubygems
clear

#IF conditions
echo -e "\n\n\n"
echo "**************************************************"
echo -e "nano-syntax-highlighting\nradeontop\nufw & gufw\narandr\nntfs-3g\nneovim"
echo "**************************************************"
echo -e "\n\n\n"
echo "Passar pelos programas? [Y/n]"
read PROGRAMAS_DESNECESSARIOS
if [ $PROGRAMAS_DESNECESSARIOS == "Y" ]||[ $PROGRAMAS_DESNECESSARIOS == "y" ]||[ -z "$PROGRAMAS_DESNECESSARIOS" ]; then
	clear
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

clear
echo -e "\n\n\n"
echo "**************************************************"
echo -e "pcmanfm\nthunar\nnautilus"
echo "**************************************************"
echo -e "Default Value: pcmanfm\n\n\n"
echo "Qual file manager? [pcman/thunar/nautilus]"
read filemanager
if [ $filemanager == "pcman" ]||[ $filemanager == "PCMAN" ]||[ -z "$filemanager" ]; then
	clear
	sudo pacman -S pcmanfm gvfs
elif [ $filemanager == "thunar" ]||[ $filemanager == "THUNAR" ]; then
	clear
	sudo pacman -S thunar gvfs
elif [ $filemanager == "nautilus" ]||[ $filemanager == "NAUTILUS" ]; then
	clear
	sudo pacman -S nautilus
fi

clear
echo -e "\n\n\n"
echo "**************************************************"
echo "Instalando Chromium"
echo "**************************************************"
echo -e "\n\n\n"
sudo pacman -S chromium
if [ -f "/usr/bin/chromium" ]; then
	clear
	echo -e "\n\n\n"
	echo "**************************************************"
	echo "Chromium Installed"
	echo "**************************************************"
	echo -e "\n\n\n"
	sleep 1
	clear
else
	clear
	echo "INSTALLING FIREFOX"
	sudo pacman -S firefox
	clear
fi

#INSTALLING LUTRIS ESSENTIALS
clear
echo -e "\n\n\n"
echo "**************************************************"
echo "Instalando Drivers"
echo "**************************************************"
echo -e "\n\n\n"
echo "Qual placa de Video seu PC tem?"
echo "[AMD/Intel/NVidia]"
read gputype
if [ $gputype == "AMD" ]||[ $gputype == "amd" ];then
	sudo pacman -S --needed lib32-mesa vulkan-radeon lib32-vulkan-radeon lib32-amdvlk vulkan-icd-loader lib32-vulkan-icd-loader
	clear
elif [ $gputype == "Intel" ]||[ $gputype == "intel" ];then
	sudo pacman -S --needed lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader
	clear
elif [ $gputype == "NVidia" ]||[ $gputype == "nvidia" ];then
	sudo pacman -S --needed nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader
	clear
fi

# MOVENDO XINIT
clear
cp -v $REPO_DIR/config/xinit/.xinitrc ~/.xinitrc

#BSPWM
mkdir ~/.config
sudo mkdir ~/.config/bspwm
clear
echo -e "\n\n\n"
echo "**************************************************"
echo "Configurando BSPWM"
echo "**************************************************"
echo -e "\n\n\n"

echo $REPO_DIR
chmod +x $REPO_DIR/config/bspwm/build_bspwm_file.sh
bash $REPO_DIR/config/bspwm/build_bspwm_file.sh
mv -v $REPO_DIR/config/bspwm/bspwmrc ~/.config/bspwm

#SXHKD
clear
mkdir ~/.config/sxhkd
cp -r -v $REPO_DIR/config/sxhkd/sxhkdrc ~/.config/sxhkd
clear

#WALLPAPER, THEME AND PICOM ON MOCP
cp -r -v $REPO_DIR/img/ ~/Pictures/
touch ~/.fehbg
clear

echo -e "\n\n\n"
echo "**************************************************"
echo "Configurando FEH background"
echo "**************************************************"
echo -e "\n\n\n"
echo "Lista das imagens dentro de '~/Pictures'"
echo "--------------------------------------------------"
ls ~/Pictures/
echo "--------------------------------------------------"
echo -e "\n\nExamplo de comando: feh --bg-fill '~/Pictures/kaylesideansty.jpg' --bg-scale '~/Pictures/jap_alphabet.jpg'\n"

if [ $NUMBER_OF_MONITORS -eq 2 ]; then
	echo -e "Escolha um wallpaper para o monitor principal: (Ex.: kaylesideansty.jpg)\n"
	read WALLPAPER_1
	echo -e "Escolha um wallpaper para o monitor secundario: (Ex.: jap_alphabet.jpg)\n"
	read WALLPAPER_2
	echo -e "#!/bin/sh\nfeh --bg-fill '/home/$USER/Pictures/$WALLPAPER_1' '/home/$USER/Pictures/WALLPAPER_2'" >> ~/.fehbg
else
	echo -e "Escolha um wallpaper: (Ex.: kaylesideansty.jpg)\n"
	read WALLPAPER
	echo -e "#!/bin/sh\nfeh --bg-fill /home/$USER/Pictures/$WALLPAPER" >> ~/.fehbg
fi
sudo chmod 754 ~/.fehbg #  4 = r(Read)  //  2 = w(Write)  //  1 = x(eXecute)
clear

# MOCP config yay -S moc
if [[ -f "/home/pk/.moc/config" ]]; then
	cp -v $REPO_DIR/config/moc/config ~/.moc/
	#cp /usr/share/doc/moc/config.example ~/.moc/config
	#echo "XTermTheme = transparent-background" >> ~/.moc/config
fi

clear
echo -e "\n\n\n"
echo "**************************************************"
echo "Adicionando Themes/Icons"
echo "**************************************************"
echo -e "\n\n\n"
sudo cp -r -v $REPO_DIR/Adwaita-dark /usr/share/themes/
sudo cp -r -v $REPO_DIR/Sweet-cursors /usr/share/icons/

#PICOM (blur background)

cp -r -v $REPO_DIR/config/picom ~/.config

#BASHRC personalizado

cp -v $REPO_DIR/config/xinit/.bashrc ~/

#CONFIG FILES:

echo -e "\n\n\n"
echo "**************************************************"
echo -e "Configurando polybar"
echo "**************************************************"
echo -e "\n\n\n"

mkdir $REPO_DIR/config/extra_config_files
cp -r -v $REPO_DIR/config/nvim/ ~/.config/

cp -v $REPO_DIR/config/extra_config_files/bspwm_smart_move ~/.config/extra_config_files/
chmod +x $REPO_DIR/config/extra_config_files/bspwm_extra_side

mkdir ~/.mouse
cp -v $REPO_DIR/config/mouse/xinput_set_mouse_speed.sh ~/.mouse/set_speed.sh
chmod +x ~/.mouse/set_speed.sh

mkdir ~/.config/polybar

if [ $NUMBER_OF_MONITORS -eq 1 ]; then
	cp -v $REPO_DIR/config/polybar/config_side.ini ~/.config/polybar/config.ini
	cp -v $REPO_DIR/config/polybar/launch_side.sh ~/.config/polybar/launch.sh
else
	cp -v $REPO_DIR/config/polybar/config.ini ~/.config/polybar
	cp -v $REPO_DIR/config/polybar/launch.sh ~/.config/polybar
	sed -i "/\[bar\/secondary\]/a monitor = $SECOND_MONITOR" config.ini
fi
clear

#ALACRITTY config

if [ -f "/usr/bin/alacritty" ]; then 
	mkdir /home/$USER/.config/alacritty
	cp -v $REPO_DIR/config/alacritty/alacritty.toml ~/.config/alacritty/
fi
clear

cd /home/$USER
ctags -R --exclude=.git --exclude=node_modules --exclude=build --exclude=dist --exclude=*.min.js .

#FIM
clear
echo -e "\n\n\n"
echo "**************************************************"
echo "!!Fim!!"
echo "Veje shell_setup_after_install para setup extras pós instalação"
echo "**************************************************"
echo -e "\n\n\n"
echo "Reiniciar sistema? [Y/n]"
read REBOOT_SISTEMA
if [ $REBOOT_SISTEMA == "y" ]||[ $REBOOT_SISTEMA == "Y" ]||[ -z "$REBOOT_SISTEMA" ]; then
	clear
	reboot
else
	clear
	echo -e "\nTudo feito!\n"
	sleep 1
	echo "Saindo em 3..."
	sleep 1
	clear
	echo -e "\n\n\nSaindo em 2..."
	sleep 1
	clear
	echo -e "\n\n\nSaindo em 1..."
	sleep 1
	clear
fi

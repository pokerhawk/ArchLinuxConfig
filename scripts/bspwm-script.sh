#!/bin/bash

# INSTALANDO WINDOW MANAGER
clear
echo -e "\n\n\n"
echo "**************************************************"
echo "Instalando WM(Window Manager) + programas padrões"
echo "**************************************************"
echo -e "\n\n\n"

sudo pacman -Syu
sudo pacman -S xorg xorg-xinit xorg-xsetroot bspwm sxhkd nano rofi bpytop htop ranger polybar feh neofetch leafpad picom ffmpegthumbnailer maim xclip slock ctags gucharmap pulseaudio pavucontrol lxappearance numlockx alacritty xbindkeys polkit dunst font-manager linux-headers dkms
sudo pacman -S --needed base-devel
clear

echo -e "\n\n\n"
echo "**************************************************"
echo "Instalando fontes + libs (Recomendado)"
echo "**************************************************"
echo -e "\n\n\n"

sudo pacman -S sndio portaudio wavpack noto-fonts noto-fonts-emoji noto-fonts-extra ttf-liberation adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts noto-fonts-cjk ttf-font-awesome
clear

echo -e "\n\n\n"
echo "**************************************************"
echo "INSTALLING LOLCAT"
echo "**************************************************"
echo -e "\n\n\n"

sudo pacman -S lolcat
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
	sleep 3
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
echo "Instalando drives para lutris/wine/steam"
echo "**************************************************"
echo -e "\n\n\n"
sudo pacman -S --needed lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader
clear

# MOVENDO XINIT
clear
cp -v ../xinit-bashrc/bspwm/.xinitrc ~/.xinitrc

#BSPWM
mkdir ~/.config
sudo mkdir ~/.config/bspwm
clear
echo -e "\n\n\n"
echo "**************************************************"
echo "Configurando BSPWM"
echo "Escolha 1 opção de configuração: (Opção padrão => 1)"
echo -e " 1. Configuração padrão (Recomendada) \n 2. Configuração para seu PC (2 telas) \n 3. Configuração para notbook"
echo "**************************************************"
echo -e "\n\n\n"
echo "Qual opção? [1/2/3]"
read bspwmconfig
if [ $bspwmconfig == "1" ]; then
	sudo cp -v /usr/share/doc/bspwm/examples/bspwmrc ~/.config/bspwm/
	echo "~/.fehbg" >> ~/.config/bspwm/bspwmrc
	clear
elif [ $bspwmconfig == "2" ]; then
	sudo cp -v ../config/bspwm/bspwmrc ~/.config/bspwm/bspwmrc
	clear
elif [ $bspwmconfig == "3" ];then
	sudo cp -v ../config/bspwm/bspwmrc_side ~/.config/bspwm/bspwmrc
	clear
fi

#SXHKD
clear
mkdir ~/.config/sxhkd
cp -r -v ../config/sxhkd/sxhkdrc ~/.config/sxhkd
clear

#WALLPAPER, THEME AND PICOM ON MOCP
cp -r -v ../img/ ~/Pictures/
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
echo -e "Escreva o comando para ser guardado em ~/.fehbg:\n"

read WALLPAPER_COMMAND
echo "$WALLPAPER_COMMAND" >> ~/.fehbg
sudo chmod 754 ~/.fehbg #  4 = r(Read)  //  2 = w(Write)  //  1 = x(eXecute)
clear

if [[ -f "/home/pk/.moc/config" ]]; then
	cp -v ../config/moc/config ~/.moc/
	#cp /usr/share/doc/moc/config.example ~/.moc/config
	#echo "XTermTheme = transparent-background" >> ~/.moc/config
fi

clear
echo -e "\n\n\n"
echo "**************************************************"
echo "Adicionando Themes/Icons"
echo "**************************************************"
echo -e "\n\n\n"
sudo cp -r -v ../Adwaita-dark /usr/share/themes/
sudo cp -r -v ../Sweet-cursors /usr/share/icons/

#PICOM (blur background)

cp -r -v ../config/picom ~/.config

#BASHRC personalizado

clear
echo -e "\n\n\n"
echo "**************************************************"
echo -e "BASHRC personalizado \nTerminal com cores e neofetch/lolcat"
echo "**************************************************"
echo -e "\n\n\n"
echo "bashrc personalizado? [Y/n](Recomendado)"
read bashrc
if [ $bashrc == "y" ]||[ $bashrc == "Y" ]||[ -z "$bashrc" ]; then
	clear
	cp -v ../xinit-bashrc/.bashrc ~/
	clear
fi

#CONFIG FILES:

mkdir ~/.config/polybar
echo -e "\n\n\n"
echo "**************************************************"
echo -e "Configuração para polybar: \n 1. Configuração Padrão(Recomendado) \n 2. Configuração do seu PC (2 telas)"
echo "**************************************************"
echo -e "\n\n\n"
echo -e "Escolha uma opção: [1/2]"
read POLYBAR_ANSWER
if [ $POLYBAR_ANSWER == "1" ];then
	cp -v ../config/polybar/config_side.ini ~/.config/polybar/config.ini
	cp -v ../config/polybar/launch_side.sh ~/.config/polybar/launch.sh
	cp -r -v ../config/nvim/ ~/.config/
	mkdir ~/.config/extra_config_files
	cp -v ../config/extra_config_files/bspwm_smart_move
	cp -v ../config/extra_config_files/bspwm_extra_side
	chmod +x ~/.config/extra_config_files/bspwm_extra_side
elif [ $POLYBAR_ANSWER == "2" ];then
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

#ALACRITTY config

if [ -f "/usr/bin/alacritty" ]; then 
	cp -r -v ../config/alacritty ~/.config/
fi
clear

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

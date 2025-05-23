hasPasswd=$(passwd -S "$USER" | awk -F " " '{print $2}')

if [[ $hasPasswd != "P" ]]; then
	echo "you dont have a password setup, run the command "passwd <newpassword>" to create a password then try again"
	exit 1
fi

echo -e "Type your password:"
read passwd
if [ -z "$passwd" ]; then exit 1; fi
echo "$passwd" | sudo -v -S
ans=$?
if [[ $ans == 1 ]]; then
	echo "Incorrect password provided, exiting"
	exit 1
fi

echo -e "\nDebugging Information:"
echo "----------------------"

#Variables

repo_DIR = sudo find /home/$USER -iname "ArchLinuxConfig"|grep -a1 /
CURRENT_VM_SWAPPINESS=$(sysctl vm.swappiness | awk '{print $3}')

sudo bash -c 'echo "set completion-ignore-case on" >> /etc/inputrc'
echo "completion ignore case ON > inputrc"

clear
echo "Rofi will open, select a rofi theme:"
sleep 3
rofi-theme-selector
echo "Rofi Theme selected"
clear

echo -e "Uncomment:\n#[multilib]\n#Include = /etc/pacman.d/mirrorlist\nthen exit"
sleep 5
sudo nano /etc/pacman.conf
sudo pacman -Sy
clear

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
sleep 7
echo "We will open Nvim, type :PlugInstall then :q!"
nvim
cd ~/.local/share/nvim/plugged/coc.nvim/
sudo npm install -g yarn
sudo pacman -S ripgrep
yarn install
yarn build

echo -e "Currently your swappiness is set to: $CURRENT_VM_SWAPPINESS.\nWhat value do you wish to set it to?\n(Recommended: 10)\nType: 'no' to cancel"
read new_swappiness_value
if [ !$new_swappiness_value == "no" ]; then
    sudo sysctl -w "vm.swappiness=$new_swappiness_value"
    sudo systemctl enable --now fstrim.timer
fi

#Installing packages
sudo pacman -S lib32-libnm lib32-libgudev
sudo pacman -S alsa-utils pulseaudio-alsa nano-syntax-highlighting unrar vlc mpv steam wine winetricks lutris tree
# yay -S moc

#installing yay/vscode

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
rm -rf yay

echo "Want to install VSCode?[Y/n]"
read vscode_answer
if [ $vscode_answer == "Y" ]||[ $vscode_answer == "y" ]||[ -z "$vscode_answer" ]; then
    clear
    yay -S visual-studio-code-bin
fi

#Config Bluetooth

clear
echo -e "\n\n\nUncomment #AutoEnable=true"
sleep 2
sudo nano /etc/bluetooth/main.conf
sudo systemctl enable bluetooth
sudo systemctl start bluetooth

#Moving files:

mkdir ~/.moc
cp -v $repo_DIR/config/moc/config ~/.moc/config
cp -v $repo_DIR/config/monokai_colorscheme/monokai.lua ~/.local/share/nvim/plugged/monokai.nvim/lua/monokai.lua
if [ -f '/home/$USER/.config/Code/' ];then
    echo "{
        "workbench.colorTheme": "Monokai",
        "editor.fontFamily": "Source Code Pro",
        "editor.fontWeight": "bold",
        "editor.fontLigatures": false,
        "workbench.iconTheme": "material-icon-theme",
        "explorer.confirmDelete": false
    }" > /home/$USER/.config/Code/User/settings.json
fi

#Setting time
sudo ntpd -qg
sudo hwclock --systohc

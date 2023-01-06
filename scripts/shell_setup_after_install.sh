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

echo "Select a Rofi Theme"
rofi-theme-selector
echo "Rofi Theme selected"
clear

echo -e "Uncomment:\n#[multilib]\n#Include = /etc/pacman.d/mirrorlist\nthen exit"
sudo nano /etc/pacman.conf
sudo pacman -Sy
clear

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
echo "We will open Nvim, type :PlugInstall then :q!"
nvim
cd ~/.local/share/nvim/plugged/coc.nvim/
sudo npm install -g yarn
yarn install
yarn build

echo -e "Currently your swappiness is set to: $CURRENT_VM_SWAPPINESS.\nWhat value do you wish to set it to? (Recommended: 10)"
read new_swappiness_value
sudo sysctl -w "vm.swappiness=$new_swappiness_value"
sudo systemctl enable --now fstrim.timer

#Installing packages

sudo pacman -S go git moc alsa-utils pulseaudio-alsa nano-syntax-highlighting unrar vlc mpv steam wine winetricks lutris tree

#installing yay/vscode

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay -S visual-studio-code-bin

#Moving files:

mkdir ~/.moc
cp -v $repo_DIR/config/moc/config ~/.moc/config
cp -v $repo_DIR/config/monokai_colorscheme/monokai.lua ~/.local/share/nvim/plugged/monokai.nvim/monokai.lua
echo "{
    "workbench.colorTheme": "Monokai",
    "editor.fontFamily": "Source Code Pro",
    "editor.fontWeight": "bold",
    "editor.fontLigatures": false
}" > ~/.config/Code/User/settings.json
#Checks before configuration beggins

if ! (zenity --question --title="Disclaimer" --text="This script configures ArchLinux the way I have it setup. Do you wish to continue?" --width=600 2> /dev/null); then
    zenity --error --title="Terms Denied" --text="You selected no, cannot proceed" --width=300 2> /dev/null
    exit 1
fi

hasPasswd=$(passwd -S "$USER" | awk -F " " '{print $2}')

if [[ $hasPasswd != "P" ]]; then
    zenity --error --title="Password Error" --text="Password is not set, please set one in the terminal with the <b>passwd</b> command, then run this again." --width=400 2> /dev/null
    exit 1
fi

PASSWD="$(zenity --password --title="Enter Password" --text="Enter User Password." 2>/dev/null)"
if [ -z "$PASSWD" ]; then exit 1; fi
echo "$PASSWD" | sudo -v -S
ans=$?
if [[ $ans == 1 ]]; then
    zenity --error --title="Password Error" --text="Incorrect password provided, please run this command again and provide the correct password." --width=400 2> /dev/null
    exit 1
fi

#Configuration section:

echo -e "\nDebugging Information:"
echo "----------------------"

#Variables:

repo_DIR = sudo find /home/$USER -name "ArchLinuxConfig"|grep -a1 /
CURRENT_VM_SWAPPINESS=$(sysctl vm.swappiness | awk '{print $3}')

sudo bash -c 'echo "set completion-ignore-case on" >> /etc/inputrc'
echo "completion ignore case ON > inputrc"

#Multi-lib Pacman:

text_editor="$(zenity --entry --text="We're about to open a file for you to edit, what text editor or terminal do you use?")"
zenity --info --text="Uncomment:\n#[multilib]\n#Include = /etc/pacman.d/mirrorlist"
sleep 1
sudo $text_editor /etc/pacman.conf

zenity --warning --text="Select a Rofi Theme"
rofi-theme-selector
echo "Rofi Theme selected"

#Nvim setup:

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
zenity --info --text="We will open Nvim, type the command:":PlugInstall" hit enter and save with ":wq"."
nvim
cd ~/.local/share/nvim/plugged/coc.nvim/
sudo npm install -g yarn
yarn install
yarn build

#Swappiness and TRIM

if zenity --question --title="Change Swappiness?" --text="Would you like to change swappiness?\n\nCurrent value: $CURRENT_VM_SWAPPINESS\nRecommended: 1" --width=300 2> /dev/null; then
	SWAPPINESS_ANSWER=$(zenity --list --title "Swappiness Value" --text "What value would you like to use for swappiness? (Default: 60)/(Recommended: 10)" --column="vm.swappiness" "1" "10" "25" "50" "70" "100" --width=100 --height=300 2> /dev/null)
    echo -e "\nSwappiness Debug:"
    echo "-------------------"
    sudo sysctl -w "vm.swappiness=$SWAPPINESS_ANSWER"
    if [ "$SWAPPINESS_ANSWER" -eq "100" ]; then
        sudo rm -f -f /etc/sysctl.d/zzz-custom-swappiness.conf
    else
        echo "vm.swappiness=$SWAPPINESS_ANSWER" | sudo tee /etc/sysctl.d/zzz-custom-swappiness.conf
    fi
fi

sudo systemctl enable --now fstrim.timer

#Installing packages:

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

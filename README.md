# ArchLinuxConfig

```bash
git clone https://github.com/pokerhawk/ArchLinuxConfig.git
```

Se quiser isntalar "bspwm" entra na pasta "scripts" e executa "bspwm-script.sh"
 
Se quiser isntalar "i3" entra na pasta "scripts" e executa "i3-script.sh" // ##DEPRECATED

---

# CONFIGURAÇÕES APOS INSTALAÇÃO

**1.MULTILIB AND DRIVES:**

```bash
sudo pacman -S --needed lib32-mesa vulkan-radeon lib32-vulkan-radeon vulkan-icd-loader lib32-vulkan-icd-loader
```

```bash
sudo nano /etc/inputrc
"set completion-ignore-case on"
```
NOTE: for all drivers https://github.com/lutris/docs/blob/master/InstallingDrivers.md

```bash
sudo nano /etc/pacman.conf
```

then uncomment:

#[multilib]

#Include = /etc/pacman.d/mirrorlist

and run:
```bash
pacman -Syy
```
---
**2.SUDOERS AND ADD USERS**

To create user and set password

```bash
useradd -m -g users -G wheel <user> 
passwd <user>
```

then:

```bash
sudo nano /etc/sudoers
```

Uncomment:

#%wheel ALL=(ALL:ALL) ALL

---
**3.ROFI:**
```bash
rofi-theme-selector
```
---
**4.FANCONTROL:**

Execute the command and reboot:
```bash
sudo systemctl enable fancontrol
```
  
Then you can config it:
```bash
sudo sensors-detect
sudo pwmconfig
```

To manage it:
```bash
sudo systemctl stop fancontrol (enable, start)
watch sensors
```
---
**5.XINPUT (mouse speed and invert-Y):**
```bash
xinput
xinput --list-props <ID>
xinput --set-prop <ID> <key> <value>
xinput set-prop 13 151 1 0 0 0 -1 1 0 0 1
xinput set-prop 13 151 1 0 0 0 1 0 0 0 1
sudo xinput --set-prop 13 299 -0.8 (oq eu uso)
```
---
**6.BPWM MULTIPLAS-TELAS:**
```bash
xrandr #para ver qual é o nome da tela
arandr #para configurar posicionamento
sudo nano ~/.config/bspwm/bspwmrc
xprop #para ver spec de um app
```
**Exemplo:**

bspc monitor HDMI-1 -d I II III IV VI VII

bspc monitor HDMI-2 -d VIII IX X 

---
**7.YAY(AUR) and MOCP INSTALL:**

YAY:
```bash
sudo pacman -S git go
git clone https://aur.archlinux.org/yay.git
makepkg -si
```
if you do "makepkg -s", do "sudo pacman -U file.tar" to install/upgrade

MOCP:
```bash
sudo pacman -S moc
sudo pacman -S alsa-utils pulseaudio-alsa
```
copy the file config file:
```bash
cp ~/Downloads/ArchLinuxConfig/config/moc/config ~/.moc/config
```
if you want MOCP to start on a specific directory:
```bash
nano ~/.moc/config
##uncomment these lines:
#MusicDir = /path/to/music/folder
#StartInMusicDir = no
```
---
**8.NANO AND VIM SYNTAX HIGHLIGHTING:**

nano-syntax-highlighting should be installed, if not do:
```bash
sudo pacman -S nano-syntax-highlighting
```
then you go onto:
```bash
sudo nano /etc/nanorc
```
and uncomment the following line:
```bash
## To include most of the existing syntax definitions, you can do:
# include "/usr/share/nano/*.nanorc"
```
---
**9.VSCODE AND CONFIG:**

Install with yay
```bash
yay -S visual-studio-code-bin
```

Change font on the .json file

```bash
{
    "workbench.colorTheme": "Monokai",
    "editor.fontFamily": "Source Code Pro",
    "editor.fontWeight": "bold",
    "editor.fontLigatures": false
}
```

and change keybind for "terminal toggle".

---

**10.FONTS**
```bash
sudo pacman -S adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts noto-fonts noto-fonts-cjk
yay -S nerd-fonts-complete
```
---

**11.NVIM**

First install vim-plug from https://github.com/junegunn/vim-plug

then open nvim, install the plugins then go to plugged dir and install dep:
```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
:PlugInstall
cd ~/.local/share/nvim/plugged/coc.nvim/
sudo npm install -g yarn
yarn install
yarn build
```

You can change the Monokai colorscheme colors at:
```bash
cd /home/pk/.local/share/nvim/plugged/monokai.nvim/lua/monokai.lua
```

replaces monokai.lua with ArchLinuxConfig/config/monokai_colorscheme/monokai.lua

---

**12.SWAPPINESS and TRIM**

Swap:

```bash
sudo sysctl -w vm.swappiness=10 #(default value is 60)

```

Trim:

```bash
systemctl list-timers | grep fstrim #list if trim is active
sudo systemctl enable --now fstrim.timer #activate trim timer
sudo fstrim -v /home #run trim
```

---

**13.PACKAGES AFTER INSTALL**
```bash
sudo pacman -S unrar vlc mpv steam wine winetricks lutris tree
yay -S cava peaclock alttab-git
```

---

# PACKAGES:
  
terminator ou Alacritty (terminal)

dmenu ou rofi (program launcher)

ranger (file system on terminal)

htop (monitor system on terminal)

bpytop (monitor system on terminal)

MOCP (music on console) /pulseaudio-alsa (dep)

polybar (akela barra de cima e embaixo)

pcmanfm (program for file system like nautilus)

feh and nomacs (background wallpaper/imager viewer)

leafpad > emacs > gedit (editor de texto)

pulseaudio && pavucontrol (controlar audio)

vlc && mpv(music player)

lxappearance (configurar mouse sweet cursor)

picom (old compton - dexa as paradas transparente)

radeontop (display GPU statuses)

ttf-liberation(font)

ffmpegthumbnailer (thumbnail nos videos)

xinput-gui (mouse speed)

gufw (firewall GUI)

arandr (monitor config GUI)

ntfs-3g (to read ntfs files or windows files)

numlockx (activate numlock)

maim && xclip (printar tela)

unrar (for .rar files "unrar x <file>")

cava (audio thingy yay)

peaclock (display time)

openssh && sshfs (to remote access and mount remote-ssh devices)

net-tools && gnu-netcat (tools pra internet) 

# PROGRAMAS:
  
ani-cli

sweet cursor (configura com lxappearance)

Adwaita-dark theme

---

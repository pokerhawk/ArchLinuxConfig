# ARCHLINUXCONFIG

**Uso:**

```bash
git clone https://github.com/pokerhawk/ArchLinuxConfig.git
```

Execute o arquivo bspwm-script.sh dentro da pasta scripts

Após a instalação, caso queira configurar automaticamente, execute o arquivo shell_setup_after_install.sh na mesma pasta

Caso contrário, siga as configurações abaixo:

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
sudo pacman -S adobe-source-han-sans-otc-fonts adobe-source-han-serif-otc-fonts noto-fonts noto-fonts-cjk ttf-font-awesome
yay -S nerd-fonts-meta
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
#wine dep
sudo pacman -S giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo libxcomposite lib32-libxcomposite libxinerama lib32-libxinerama ncurses lib32-ncurses opencl-icd-loader lib32-opencl-icd-loader libxslt lib32-libxslt libva lib32-libva gtk3 lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader cups samba dosbox
yay -S cava peaclock alttab-git polkit-dumb-agent-git
```

---

**14.BASHRC COLORS AND POLYBAR CONFIGS**

Bashrc color numbers:

https://misc.flogisoft.com/bash/tip_colors_and_formatting

Polybar wiki:

https://github.com/polybar/polybar/wiki

---

# EXTRA CONFIGS:

**1.GPU OVERCLOCK**

```bash
sudo nano /etc/default/grub
```

Na linha:

GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet"

Da um espaço e coloca:

amdgpu.ppfeaturemask=0xffffffff

Da update no grup:
```bash
sudo update-grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

Reinicie

Comando para ver se adicionou corretamente:

cat /proc/cmdline

---

**2.READ/WRITE SPEEDS**

WRITE SPEED:

dd if=/dev/zero of=./largefile bs=1M count=1024

CLEAN MEMORY CACHE:

sudo sh -c "sync && echo 3 > /proc/sys/vm/drop_caches"

READ SPEED:

dd if=./largefile of=/dev/null bs=4k

---

**3.MANGOHUD/GOVERLAY(GUI)**

```bash
yay -S mangohud-git lib32-mangohud-git
yay -S goverlay-bin (or goverlay-git)


---

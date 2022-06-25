# ArchLinuxConfig

```bash
git clone https://github.com/pokerhawk/ArchLinuxConfig.git
```

Se quiser isntalar "bspwm" entra na pasta "scripts" e executa "bspwm-script.sh"
 
Se quiser isntalar "i3" entra na pasta "scripts" e executa "i3-script.sh"

---

# CONFIGURAÇÕES APOS INSTALAÇÃO

**1.MULTILIB:**
```bash
sudo nano /etc/pacman.conf
```
uncomment:

#[multilib]

#Include = /etc/pacman.d/mirrorlist

and run:
```bash
pacman -Syu
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

Após configurar copia o arquivo "fancontrol" dentro da pasta fancontrol e cola em /etc/:
```bash
cp </to/folder>/fancontrol/fancontrol /etc/fancontrol
```
  
To config it:
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
```
**Exemplo:**

bspc monitor HDMI-1 -d I II III IV VI VII

bspc monitor HDMI-2 -d VIII IX X 

---
**6.MOCP and YAY(AUR) INSTALL:**

First you need YAY:
```bash
sudo pacman -S git go
git clone https://aur.archlinux.org/yay.git
makepkg -si
sudo pacman -U file.tar
```
then you can install MOCP:
```bash
yay -S moc-pulse
sudo pacman -S alsa-utils
```
config the file to have transparent background with:
```bash
cp /usr/share/doc/moc/config.example ~/.moc/config
echo "XTermTheme = transparent-background" >> ~/.moc/config
```
if you want MOCP to start on a specific directory:
```bash
nano ~/.moc/config
##uncomment these lines:
#MusicDir = /path/to/music/folder
#StartInMusicDir = no
```
---
**6.NANO SYNTAX HIGHLIGHTING:**

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

# PACKAGES:
  
terminator ou Alacritty (terminal)

dmenu ou rofi (program launcher)

ranger (file system on terminal)

htop (monitor system on terminal)

bpytop (monitor system on terminal)

MOCP (music on console) /pulseaudio-alsa (dep)

polybar (akela barra de cima e embaixo)

pcmanfm (program for file system like nautilus)

feh or nitrogen (imager viewer/background wallpaper)

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

cava (audio thingy)

openssh && sshfs (to remote access and mount remote-ssh devices)

net-tools && gnu-netcat (tools pra internet)
  
# PROGRAMAS:
  
ani-cli

sweet cursor (configura com lxappearance)

Adwaita-dark theme

---

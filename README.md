# ArchLinuxConfig

 Se quiser isntalar "bspwm" entra na pasta "scripts" e executa "bspwm-script.sh"
 Se quiser isntalar "i3" entra na pasta "scripts" e executa "i3-script.sh"

Gotta configure fancontrol/terminator/background(feh)/completion-case

!! CONFIGURAÇÔES !!

rofi-theme-selector

# ADD USER AND CONFIG

useradd -m -g users -G wheel <user> 
passwd <user>
sudo nano /etc/sudoers
  
# LXAPPEARANCE
  
install nautilus(maybe) to get Adwaita-dark theme
configure dark theme on lxappearance  
  

# FANCONTROL
  
To config it:

detect sensors
pwmconfig

To manage it:

systemctl stop fancontrol (enable, start)
watch sensors

# SET COMPLETION IGNORE CASE:
  
sudo nano /etc/inputrc
set completion-ignore-case on

# XINPUT (mouse speed):
  
xinput
xinput --list-props <ID>
xinput --set-prop <ID> <key> <value>
sudo xinput --set-prop 13 299 -0.8 (oq eu uso)

# BPWM MULTIPLAS-TELAS:
  
xrandr (para ver qual é o nome da tela)
arandr (para configurar posicionamento)
sudo nano ~/.config/bspwm/bspwmrc
Exemplo:
bspc monitor HDMI-1 -d I II III IV VI VII
bspc monitor HDMI-2 -d VIII IX X

# PACMAN MULTILIB:
  
sudo nano /etc/pacman.conf
uncomment:
#[multilib]
#Include = /etc/pacman.d/mirrorlist

[multilib]
Include = /etc/pacman.d/mirrorlist

pacman -Syu
  
# PACKAGES:
  
terminator (terminal)
dmenu ou rofi (program launcher)
ranger (file system on terminal)
htop (monitor system on terminal)
bpytop (monitor system on terminal)
MOCP (music on console) /pulseaudio-alsa (dep)
polybar (akela barra de cima e embaixo)
pcmanfm (program for file system like nautilus)
feh (imager viewer/background wallpaper)
nitrogen (wallpapager)
leafpad > emacs > gedit (editor de texto)
pulseaudio && pavucontrol (controlar audio)
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
  
# PROGRAMAS:
  
ani-cli
sweet cursor (configura com lxappearance)

# See the script file to know which packages are being installed

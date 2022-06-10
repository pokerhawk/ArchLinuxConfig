# ArchLinuxConfig

Use script.sh after setting up fancontrol files:

To config it:
-------------
detect sensors
pwmconfig

To manage it:
-------------
systemctl stop fancontrol (enable, start)
watch sensors

Set completion case
-------------
sudo nano /etc/inputrc
set completion-ignore-case on

#! See the script file to know which packages are being installed

PACKAGES:
-------------
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
lxappearance (configuração mouse)
compton (dexa as paradas transparente)
radeontop (display GPU statuses)
ttf-liberation(font)
ffmpegthumbnailer (thumbnail nos videos)
xinput-gui (mouse speed)
gufw (firewall GUI)
arandr (monitor config GUI)
ntfs-3g (to read ntfs files or windows files)

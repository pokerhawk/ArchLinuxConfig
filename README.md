# ArchLinuxConfig

```bash
git clone https://github.com/pokerhawk/ArchLinuxConfig.git
```

Se quiser isntalar "bspwm" entra na pasta "scripts" e executa "bspwm-script.sh"
 
Se quiser isntalar "i3" entra na pasta "scripts" e executa "i3-script.sh"

# CONFIGURAÇÕES

Apos a instalação configure algumas coisas:
---
**1.ROFI:**
```bash
rofi-theme-selector
```
---
**2.COMPLETION-CASE:**

/etc/inputrc
```bash
echo "set completion-ignore-case on" >> /etc/inputrc
```
---
**3.MULTILIB:**
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
**4.ADD USER AND CONFIG:**
```bash
useradd -m -g users -G wheel <user> 
passwd <user>
sudo nano /etc/sudoers
```
---
**5.LXAPPEARANCE:**
  
install nautilus(maybe) to get Adwaita-dark theme

configure dark theme on lxappearance  

---
**6.FANCONTROL:**

Após configurar copia o arquivo "fancontrol" dentro da pasta fancontrol e cola em /etc/:
```bash
cp </to/folder>/fancontrol/fancontrol /etc/fancontrol
```
  
To config it:
```bash
detect sensors
pwmconfig
```

To manage it:
```bash
systemctl stop fancontrol (enable, start)
watch sensors
```
---
**7.XINPUT (mouse speed):**
```bash
xinput
xinput --list-props <ID>
xinput --set-prop <ID> <key> <value>
sudo xinput --set-prop 13 299 -0.8 (oq eu uso)
```
---
**8.BPWM MULTIPLAS-TELAS:**
```bash
xrandr #para ver qual é o nome da tela
arandr #para configurar posicionamento
sudo nano ~/.config/bspwm/bspwmrc
```
**Exemplo:**

bspc monitor HDMI-1 -d I II III IV VI VII

bspc monitor HDMI-2 -d VIII IX X
  
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
 
bc (calc)
  
# PROGRAMAS:
  
ani-cli

sweet cursor (configura com lxappearance)

# See the script file to know which packages are being installed
---

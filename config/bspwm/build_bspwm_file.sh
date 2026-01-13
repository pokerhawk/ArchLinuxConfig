## create condition if bspwmrc exists delete it
export DISPLAY=:0
touch ./bspwmrc
echo -e "#!/bin/sh\n" >> bspwmrc
echo -e "pgrep -x sxhkd > /dev/null || sxhkd &\n" >> bspwmrc

# xrandr|grep " connected" | awk '{print $1}' | while read -r line; do
# 	echo $line
# done

## For now only 2 monitors logic

connected_monitors=$(xrandr|grep " connected" | awk '{print $1}')
number_of_lines=$(xrandr|grep " connected" | awk '{print $1}' | wc -l)
index=0

if [ $number_of_lines -eq 2 ]; then
	for line in $connected_monitors; do
		if [ $index -eq 0 ]; then
			echo -e "bspc monitor $line -d I II III IV V VI VII" >> bspwmrc
		else
			echo -e "bspc monitor $line -d VIII IX X" >> bspwmrc
		fi
		((index++))
	done
else
	echo -e "bspc monitor $connected_monitors -d I II III IV V VI VII VIII IX X"
fi

## BULK of config and rules

echo -e "
## BSPC CONFIGS ##

bspc config border_width         2
bspc config window_gap           12
#bspc config top_padding 0
#bspc config bottom_padding 0
bspc config split_ratio          0.5
bspc config border_width         2
bspc config borderless_monocle   true
bspc config gapless_monocle      true
bspc config focus_follows_pointer true
#bspc config auto_alternate true
#bspc config auto_cancel true
bspc config focused_border_color #7a5014
bspc config active_border_color #4d4b48
bspc config normal_border_color #4d4b48
bspc config presel_border_color #9a875f
bspc config urgent_border_color #504339
bspc config focused_locked_border_color #8c644c
#bspc config normal_frame_opacity 0.0
#bspc config focused_frame_opacity 0.1

## BSPC RULES ##
# $ xprop (command to get app name)

bspc rule -a Gimp desktop='^8' state=floating follow=on
bspc rule -a mplayer2 state=floating
bspc rule -a Kupfer.py focus=on
bspc rule -a Screenkey manage=off
bspc rule -a discord desktop='^10' state=floating rectangle=1230x724+1943+148
#bspc rule -a Pcmanfm state=floating
bspc rule -a mpv state=fullscreen
bspc rule -a feh state=floating rectangle=1600x900+100+100
bspc rule -a vlc state=floating
bspc rule -a heroic state=floating
bspc rule -a Lutris state=floating
bspc rule -a Steam state=floating
bspc rule -a zsnes state=fullscreen
bspc rule -a lxappearance desktop='^8'
bspc rule -a Lxappearance desktop='^8'
#bspc rule -a terminator -o desktop='^10' state=floating rectangle 100x100+0+0 sticky=on
" >> bspwmrc

# Extras

echo -e "\n
## ADDED CONFIGS ##
Xcursor.theme: Sweet-cursors &
Xcursor.size: 24 &
sxhkd &
/usr/bin/numlockx on &
/usr/bin/polkit-dumb-agent &
bash /home/$USER/.mouse/set_speed.sh &
bash /home/$USER/.config/polybar/launch.sh &
bash /home/$USER/.screenlayout/monitor-setup.sh &
bash /home/$USER/.fehbg &
picom &
alttab &
discord &
dunst &
" >> bspwmrc

chmod +x bspwmrc

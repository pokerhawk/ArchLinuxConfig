#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar
while pgrep -x polybar >/dev/null; do sleep 1; done
# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log

#polybar bar1 2>&1 | tee -a /tmp/polybar1.log & disown
#polybar bar2 2>&1 | tee -a /tmp/polybar2.log & disown

screens=$(xrandr --listactivemonitors | grep -v "Monitors" | cut -d" " -f6)

if [[ $(xrandr --listactivemonitors | grep -v "Monitors" | cut -d" " -f4 | cut -d"+" -f2- | uniq | wc -l) == 1 ]]; then
  MONITOR=$(polybar --list-monitors | cut -d":" -f1) TRAY_POS=right polybar main &
else
  primary=$(xrandr --query | grep " connected" | cut -d" " -f1 | grep -m1 H)

  for m in $screens; do
    if [[ $primary == $m ]]; then
        MONITOR=$m TRAY_POS=right polybar main &
    else
        MONITOR=$m TRAY_POS=none polybar secondary &
    fi
  done
fi

echo "Bars launched..."

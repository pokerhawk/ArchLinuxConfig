#!/bin/bash

# awk '{print $6}'
mouse_id=$(xinput | grep -m1 "USB OPTICAL MOUSE" | sed -E 's/.*id=([0-9]+).*/\1/')

accel_speed_id=$(xinput list-props $mouse_id | grep -m1 "libinput Accel Speed" | sed -E 's/.*\(([0-9]+)\).*/\1/')

xinput --set-prop $mouse_id $accel_speed_id -0.8

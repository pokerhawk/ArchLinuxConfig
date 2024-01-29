#!/bin/bash
#Test

xinput_id=$(xinput|grep "USB OPTICAL MOUSE" -m 1|awk '{print $6}') #Output (id=X)

IFS='=' #IFS = oq vamos usar para dar split
read -a str_arr <<< "$xinput_id" #read xinput_id, separate using IFS and set the output to str_arr

mouse_id=${str_arr[1]}

xinput_accel_id=$(xinput --list-props $mouse_id|grep "libinput Accel Speed ("|awk '{print $4}')

IFS='()'
read -a str_arr <<< "$xinput_accel_id"

accel_id=${str_arr[1]}

###Final Command
xinput --set-prop $mouse_id $accel_id -1 &

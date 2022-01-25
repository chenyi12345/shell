#! /bin/bash
if [ "$1" = 1 -o "$1" = "" ];then
xdotool mousemove 30 570
xdotool click 1
sleep 1
sony_id=`xdotool getwindowfocus`
echo $sony_id
xdotool mousemove --window $sony_id 210 450
sleep 2
xdotool click 1
sleep 15
sony_id2=`xdotool getwindowfocus`
echo $sony_id2
xdotool type 'Junhong.Chen@sony.com'
sleep 1
xdotool mousemove --window $sony_id2 600 360
xdotool click 1
sleep 3
xdotool type 'Pass20220101'
sleep 1
xdotool mousemove --window $sony_id2 600 400
xdotool click 1
sleep 3
xdotool mousemove --window $sony_id2 500 250
xdotool click 1
else
xdotool mousemove 30 570
xdotool click 1
sleep 1
sony_id=`xdotool getwindowfocus`
xdotool mousemove --window $sony_id 50 16
xdotool click 1
sleep 1
xdotool mousemove --window $sony_id 210 450
xdotool click 1
echo $sony_id
fi

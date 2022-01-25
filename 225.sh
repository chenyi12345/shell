#! /bin/bash
window_id=`cat ~/tmp/window_id/window_sony.txt`
if [ "$1" = "0" ];then
xdotool windowunmap $window_id
else
xdotool windowmap $window_id
xdotool windowsize --usehints $window_id 80 10
xdotool windowmove $window_id 1200 30
fi

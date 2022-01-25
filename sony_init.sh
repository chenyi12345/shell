#! /bin/bash
window_id=`xdotool getwindowfocus`
echo $window_id
if [ "$1" = "bk" ];then
echo $window_id > ~/tmp/window_id/window_sony_bk.txt
xdotool windowsize --usehints $window_id 80 10
xdotool windowmove $window_id 1200 300
xdotool type "init_225 amss bk"
xdotool key Return
xdotool key ctrl+shift+t
xdotool type "init_225 qssi bk"
xdotool key Return
xdotool key ctrl+shift+t
xdotool type "init_225 system bk"
xdotool key Return
xdotool key ctrl+shift+t
xdotool type "init_225 target bk"
xdotool key Return
zenity --info --text "sony_init.sh bk done	"
xdotool windowunmap $window_id
else
echo $window_id > ~/tmp/window_id/window_sony.txt
xdotool windowsize --usehints $window_id 80 10
xdotool windowmove $window_id 1200 30
xdotool type "init_225 amss"
xdotool key Return
xdotool key ctrl+shift+t
xdotool type "init_225 qssi"
xdotool key Return
xdotool key ctrl+shift+t
xdotool type "init_225 system"
xdotool key Return
xdotool key ctrl+shift+t
xdotool type "init_225 target"
xdotool key Return
zenity --info --text "sony_init.sh done	"
xdotool windowunmap $window_id
fi

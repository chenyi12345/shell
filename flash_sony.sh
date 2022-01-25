#! /bin/bash
if [ "$1" = "ftp" ];then
ftp -i -n 192.168.84.230 <<EOF  
user sonytk SonyTK@123 
ls /BlackImages/s-murray/pdx225/65*
EOF
read version
dir=/BlackImages/s-murray/pdx225/$version/pp-pdx225-global-a4/userdebug/
string="_X-FLASH-ALL-F352.zip"
app_name=APP-SW_PDX225_GLOBAL-A4_USERDEBUG_$version$string
app_name2=APP_FTP.zip
ftp -i -n 192.168.84.230 <<EOF  
user sonytk SonyTK@123 
lcd ~/HDD/apk_225
get $dir$app_name $app_name2
EOF
xdotool mousemove 30 640
xdotool click 1
sleep 15
adb reboot edl
sleep 5
window_id=`xdotool getwindowfocus`
echo $window_id
xdotool windowsize $window_id 500 1100
xdotool mousemove --window $window_id 80 340
xdotool click 1
sleep 3
xdotool mousemove --window $window_id 194 163
xdotool click 1
sleep 2
xdotool mousemove --window $window_id 650 450
xdotool click 1
sleep 300
elif [ "$1" = "local_ftp" ];then
xdotool mousemove 30 640
xdotool click 1
sleep 15
adb reboot edl
sleep 5
window_id=`xdotool getwindowfocus`
echo $window_id
xdotool windowsize $window_id 500 1100
xdotool mousemove --window $window_id 80 340
xdotool click 1
sleep 3
xdotool mousemove --window $window_id 194 163
xdotool click 1
sleep 2
xdotool mousemove --window $window_id 650 450
xdotool click 1

elif [ "$1" = "local_apk" ];then
xdotool mousemove 30 640
xdotool click 1
sleep 15
adb reboot edl
sleep 5
window_id=`xdotool getwindowfocus`
echo $window_id
xdotool windowsize $window_id 500 1100
xdotool mousemove --window $window_id 80 340
xdotool click 1
sleep 3
xdotool mousemove --window $window_id 194 143
xdotool click 1
sleep 2
xdotool mousemove --window $window_id 650 450
xdotool click 1

else
echo "input is mistake"
fi

#! /bin/bash
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
zenity --info --text "ftp done!!!"

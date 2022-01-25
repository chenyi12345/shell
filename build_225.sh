#! /bin/bash
echo "**************************************************************"
echo "build_225.sh $1 start"
echo "**************************************************************"

echo "**************************************************************"
echo "build $1 start"
echo "**************************************************************"

if [ "$2" = "bk" ];then
dir_workspace="/home/thundersoft/HDD/workspace"
window_id=`cat ~/tmp/window_id/window_sony_bk.txt`
position="1200 300"
else
dir_workspace="/home/thundersoft/workspace"
window_id=`cat ~/tmp/window_id/window_sony.txt`
position="1200 30"
fi

cd $dir_workspace/$1

echo `pwd`
time=$(date "+%Y.%m.%d_%H:%M:%S")
echo $time
if [ "$1" = "qssi" ];then
source build/envsetup.sh
lunch pdx225-userdebug
./build.sh all-deb | tee ~/tmp/log/build_$1_$time.log
zenity --info --text "build_$1 done!!!"
elif [ "$1" = "target" ];then
source build/envsetup.sh
lunch pdx225-userdebug
./build.sh all-deb | tee ~/tmp/log/build_$1_$time.log
zenity --info --text "build_$1 done!!!"
elif [ "$1" = "system" ];then
source build/envsetup.sh
lunch pdx225-userdebug
./build.sh all-deb | tee ~/tmp/log/build_$1_$time.log
zenity --info --text "build_$1 done!!!"
elif [ "$1" = "amss" ];then
source build/envsetup.sh
lunch murray_r1-userdebug
make all-deb | tee ~/tmp/log/build_$1_$time.log
zenity --info --text "build_$1 done!!!"
else
zenity --info --text "input of build_225.sh is mistake!!!"
exit
fi
xdotool windowmap $window_id
xdotool windowmove $window_id $position

echo "**************************************************************"
echo "build $1 done"
echo "**************************************************************"


echo "**************************************************************"
echo "build_225.sh $1 done"
echo "**************************************************************"

#! /bin/bash
echo "**************************************************************"
echo "init_build_225.sh $1 start"
echo "**************************************************************"

echo "**************************************************************"
echo "init $1 start"
echo "**************************************************************"

dir_HDD="/home/thundersoft/HDD/$1"
if [ "$2" = "bk" ];then
dir_workspace="/home/thundersoft/HDD/workspace"
window_id=`cat ~/tmp/window_id/window_sony_bk.txt`
position="1200 300"
else
dir_workspace="/home/thundersoft/workspace"
window_id=`cat ~/tmp/window_id/window_sony.txt`
position="1200 30"

fi

cd $dir_HDD
echo `pwd`
time=$(date "+%Y.%m.%d_%H:%M:%S")
echo $time

# repo init
if [ "$1" = "qssi" ];then
repo init -u git://review.ptc.sony.co.jp/platform/qssimanifest -b s-qssi-murray
elif [ "$1" = "target" ];then
repo init -u git://review.ptc.sony.co.jp/platform/targetmanifest -b s-murray
elif [ "$1" = "system" ];then
repo init -u git://review.ptc.sony.co.jp/platform/systemmanifest -b s-murray
elif [ "$1" = "amss" ];then
repo init -u git://review.ptc.sony.co.jp/platform/amssmanifest -b murray-sm6375-la2.0
else
zenity --info --text "input of init_225.sh is mistake!!!"
exit
fi

#repo sync -n
repo sync -n --no-tags | tee ~/tmp/log/HDD_init_$1_$time.log

cd $dir_workspace/$1

#repo init --reference
if [ "$1" = "qssi" ];then
repo init -u git://review.ptc.sony.co.jp/platform/qssimanifest -b s-qssi-murray --reference="~/HDD/qssi"
elif [ "$1" = "target" ];then
repo init -u git://review.ptc.sony.co.jp/platform/targetmanifest -b s-murray --reference="~/HDD/target"
elif [ "$1" = "system" ];then
repo init -u git://review.ptc.sony.co.jp/platform/systemmanifest -b s-murray --reference="~/HDD/system"
elif [ "$1" = "amss" ];then
repo init -u git://review.ptc.sony.co.jp/platform/amssmanifest -b murray-sm6375-la2.0 --reference="~/HDD/amss"
else
zenity --info --text "input of init_225.sh is mistake!!!"
exit
fi
#repo sync -c
repo sync -c --no-tags | tee ~/tmp/log/init_$1_$time.log

echo "**************************************************************"
echo "init $1 done"
echo "**************************************************************"

echo "**************************************************************"
echo "build $1 start"
echo "**************************************************************"
#build
if [ "$1" = "qssi" -o "$1" = "target" -o "$1" = "system" ];then
source build/envsetup.sh
lunch pdx225-userdebug
./build.sh all-deb | tee ~/tmp/log/build_$1_$time.log
else
source build/envsetup.sh
lunch murray_r1-userdebug
make all-deb | tee ~/tmp/log/build_$1_$time.log
fi
zenity --info --text "init_build_$1 done"
xdotool windowmap $window_id
xdotool windowmove $window_id $position

echo "**************************************************************"
echo "build $1 done"
echo "**************************************************************"

echo "**************************************************************"
echo "init_build_225.sh $1 done"
echo "**************************************************************"

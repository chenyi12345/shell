#! /bin/bash
echo "**************************************************************"
echo "build_pack_225.sh $1 start"
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
echo qssi
elif [ "$1" = "target" ];then
echo target
elif [ "$1" = "system" ];then
echo system
elif [ "$1" = "amss" ];then
echo amss
else
zenity --info --text "input of build_pack_225.sh is mistake"
exit
fi

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

echo "**************************************************************"
echo "build $1 done"
echo "**************************************************************"

#pack

echo "**************************************************************"
echo "pack $1 start"
echo "**************************************************************"

if [ "$2" = "bk" ];then
version=`cat ~/tmp/version/version.txt`
else
version=`repository latestlabel s-murray`
fi

qssi_deb=$dir_workspace/qssi/out/target/product/qssi/obj/deb
target_deb=$dir_workspace/target/out/target/product/pdx225/obj/deb
system_deb=$dir_workspace/system/out/deb
amss_deb=$dir_workspace/amss/out/murray_r1/obj/deb
echo $version
echo $1
semcpkgtoimg pp-pdx225-global-a4 result-flashable variant-userdebug -src $amss_deb -src $qssi_deb -src $target_deb -src $system_deb -l $version | tee ~/tmp/log/pack_$1_$time.log
mv APP-SW_PDX225_GLOBAL-A4_USERDEBUG_PRIVATE_X-FLASH-ALL-F352.zip ~/HDD/apk_225/APP_LOCAL.zip

xdotool windowmap $window_id
xdotool windowmove $window_id $position

echo "**************************************************************"
echo "pack $1 done"
echo "**************************************************************"

echo "**************************************************************"
echo "build_pack_225.sh $1 done"
echo "**************************************************************"
zenity --info --text "build_pack_$1 done"

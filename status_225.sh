#! /bin/bash
if [ "$1" = "qssi" -o "$1" = "target" -o "$1" = "system" -o "$1" = "amss" ];then
dir="/home/thundersoft/workspace/$1"
cd $dir
repo forall -pc "git status" | tee ~/tmp/log/$1_status.txt
#grep -C 3 love filename  显示filename文件中，love行上下3行内容（含love行）
#grep -A 3 love filename  显示filename文件中，love行下3行内容（含love行）
#grep -B 3 love filename  显示filename文件中，love行上3行内容（含love行）
echo "******************************************************************"
echo "git status"
echo "******************************************************************"
grep -C 3 add ~/tmp/log/$1_status.txt
zenity --info --text "$1_status.sh is done"
else
zenity --info --text "input of pack_225.sh is mistake"
fi

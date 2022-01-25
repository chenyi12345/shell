#! /bin/bash
if [ "$1" = "target" -o "$1" = "qssi" -o "$1" = "amss" -o "$1" = "system" ];then
echo $1
else
zenity --info --text "input of cherry_225.sh is mistake !!!"
exit
fi

project=`echo "$2" | awk -F '29418/' '{print $2}' | awk -F ' ' '{print $1}'`
echo "*****************************************************"
echo "project:$project"
echo "*****************************************************"
if [ "$3" = "bk" ];then
dir_workspace="/home/thundersoft/HDD/workspace"
else
dir_workspace="/home/thundersoft/workspace"
fi
grep_1=`cat $dir_workspace/$1/.repo/manifests/default.xml | grep $project`
if [ "$grep_1" = "" ];then
delete_str=`echo "$project" | awk -F '/' '{printf $NF}'`
delete_str="/$delete_str"
project_2=`echo ${project%$delete_str*}`
grep_2=`cat $dir_workspace/$1/.repo/manifests/default.xml | grep $project_2`
	if [ "$grep_2" = "" ];then
	echo "*****************************************************"
	echo "find project failed"
	echo "*****************************************************"
	zenity --info --text "find project failed"
	else
	echo "*****************************************************"
	echo "find project2 successiful"
	echo "*****************************************************"
	cat $dir_workspace/$1/.repo/manifests/default.xml | grep $project_2
	read -p "Enter patch:" patch
	cd $dir_workspace/$1/$patch
	echo `pwd`
    xdotool type "$2"
    xdotool key Return
	fi
else
echo "*****************************************************"
echo "find project1 successiful"
echo "*****************************************************"
cat $dir_workspace/$1/.repo/manifests/default.xml | grep $project
patch=`echo "$grep_1" | awk -F ' ' '{print $3}' | awk -F '"' '{print $2}'`
cd $dir_workspace/$1/$patch
echo `pwd`
xdotool type "$2"
xdotool key Return
fi

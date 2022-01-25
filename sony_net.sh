#! /bin/bash
cp -rp ~/.gitconfig_bk ~/.gitconfig
if [ "$1" = "196" ];then
sed -i '/junhong.chen@192.168.9.100/s/^/#/' ~/.gitconfig
sed -i '/git@192.168.87.110/s/^/#/' ~/.gitconfig
elif [ "$1" = "100" ];then
sed -i '/semc@192.168.87.196/s/^/#/' ~/.gitconfig
sed -i '/git@192.168.87.110/s/^/#/' ~/.gitconfig
elif [ "$1" = "110" ];then
sed -i '/semc@192.168.87.196/s/^/#/' ~/.gitconfig
sed -i '/junhong.chen@192.168.9.100/s/^/#/' ~/.gitconfig
else
	echo "input of sony_net.sh is mistake"
fi

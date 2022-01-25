#! /bin/bash
passwd="123"
echo "$passwd" | sudo -S apt-get install clamav clamav-freshclam
echo "$passwd" | sudo -S clamscan --max-filesize=3999M --max-scansize=3999M --exclude-dir=/sys/ --exclude-dir=/home/thundersoft/workspace --exclude-dir=/home/thundersoft/HDD/workspace -i -r /

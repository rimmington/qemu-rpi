#!/bin/bash -e
wget -c https://downloads.raspberrypi.org/raspbian_lite/images/raspbian_lite-2016-03-18/2016-03-18-raspbian-jessie-lite.zip -O 2016-03-18-raspbian-jessie-lite.zip
unzip 2016-03-18-raspbian-jessie-lite.zip

mkdir mnt
sudo mount -v -o offset=67108864 -t ext4 2016-03-18-raspbian-jessie-lite.img mnt
sudo sed -i 's/^/#/g' mnt/etc/ld.so.preload
#sudo nano mnt/etc/ld.so.preload
sudo sed -i 's/^\/dev\/mmcblk/#\/dev\/mmcblk/g' mnt/etc/fstab
#sudo nano mnt/etc/fstab
#sudo echo '' >> mnt/etc/apt/sources.list
#sudo echo '' >> mnt/etc/apt/preferences
sudo umount mnt
rmdir mnt

truncate -s 32G outdisk
sudo virt-resize --expand /dev/sda2 2016-03-18-raspbian-jessie-lite.img outdisk
rm 2016-03-18-raspbian-jessie-lite.img

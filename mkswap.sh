#!/bin/bash -eu

rm -rf /dev/shm/qemu-rpi
mkdir /dev/shm/qemu-rpi
ln -sf /dev/shm/qemu-rpi/swap ./swap
qemu-img create -f raw $(readlink ./swap) 1G

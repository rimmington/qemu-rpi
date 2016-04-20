#!/bin/bash
qemu-system-arm -kernel ./kernel-qemu -cpu arm1176 -m 256 -M versatilepb -append "root=/dev/sda2 panic=1 rootfstype=ext4 rw console=ttyAMA0,115200" -hda ./outdisk -hdb ./swap -nographic

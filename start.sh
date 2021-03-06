#!/bin/bash -eu
ARGS=""
if [ -e ./swap ]; then
  ARGS+="-hdb swap"
fi

qemu-system-arm -kernel ./kernel-qemu -cpu arm1176 -m 256 -M versatilepb -append "root=/dev/sda2 panic=1 rootfstype=ext4 rw console=ttyAMA0,115200" -hda ./outdisk -nographic $ARGS

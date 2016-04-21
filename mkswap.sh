#!/bin/bash -eu

if [ -z "${1:-}" ]; then
  echo "Usage: $0 NAME"
  exit 1
fi

mkdir -p /dev/shm/qemu-rpi
ln -sf /dev/shm/qemu-rpi/swap-${1} ./swap
qemu-img create -f raw $(readlink ./swap) 1G

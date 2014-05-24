#!/bin/bash -eux
# set grub timeout to a smaller value to speed up the boot process
if [ -r /boot/grub/menu.lst ]; then
  echo "[grub-speedup] Setting grub timeout to 1 second" && \
  sed -i 's/^timeout .*$/timeout 1/' /boot/grub/menu.lst
fi

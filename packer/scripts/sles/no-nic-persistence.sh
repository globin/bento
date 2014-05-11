#!/bin/bash -eux
# clean up SLES interface persistence
rm -f /etc/udev/rules.d/70-persistent-net.rules
if [ -r /etc/sysconfig/network/ifcfg-eth0 ]; then
  sed -i 's/^HWADDR.*$//' /etc/sysconfig/network/ifcfg-eth0
  sed -i 's/^UUID.*$//' /etc/sysconfig/network/ifcfg-eth0
fi

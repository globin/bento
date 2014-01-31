#!/bin/bash

# Get codename in order to create correct source entry
CODENAME=`lsb_release -s -c`

# fetch pubkey
wget -O /tmp/mptcp-pubkey.gpg http://multipath-tcp.org/mptcp.gpg.key

# import pubkey
apt-key add /tmp/mptcp-pubkey.gpg

# add apt source
echo "deb http://multipath-tcp.org/repos/apt/debian ${CODENAME} main" > /etc/apt/sources.list.d/mptcp.list

# update package lists + install mptcp kernel
apt-get update
apt-get install -y linux-mptcp

# cleanup
rm /tmp/mptcp-pubkey.gpg

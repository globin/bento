#!/bin/bash

# currently the only usable puppet version is 3.4.3-1
# TODO: make puppet version configurable via ENV variable
# this would allow setting the desired version in the packer template
#PUPPETVERSION='=3.4.3-1puppetlabs1'
PUPPETVERSION='=3.4.3-1'

# Get codename in order to fetch correct .deb from Puppetlabs
CODENAME=`lsb_release -s -c`

# fetch .deb + pubkey
wget -O /tmp/puppetlabs-release-${CODENAME}.deb https://apt.puppetlabs.com/puppetlabs-release-${CODENAME}.deb
wget -O /tmp/puppetlabs-pubkey.gpg https://apt.puppetlabs.com/pubkey.gpg

# import puppetlabs pubkey
apt-key add /tmp/puppetlabs-pubkey.gpg
dpkg -i /tmp/puppetlabs-release-${CODENAME}.deb

# update package lists (including new sources from .deb) + install puppet
apt-get update
apt-get install -y puppet${PUPPETVERSION} puppet-common${PUPPETVERSION} facter
apt-get install -y libaugeas-ruby

# enable puppet agent
puppet agent --enable

# cleanup
rm /tmp/puppetlabs-release-${CODENAME}.deb
rm /tmp/puppetlabs-pubkey.gpg

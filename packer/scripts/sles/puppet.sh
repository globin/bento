#!/bin/sh -eux

if [ -f /etc/zypp/locks ]; then
  echo "[bootstrap] Remove locks" && \
    sudo rm /etc/zypp/locks > /dev/null
fi
if ! zypper lr -u | grep mayflower-puppet > /dev/null; then
  echo "[bootstrap] Add zypper home:mayflower:puppet repo" && \
  #sudo zypper addrepo -f --no-gpgcheck http://download.opensuse.org/repositories/home:/mayflower:/puppet/SLE_11_SP3/ mayflower-puppet
  sudo zypper addrepo -f --no-gpgcheck http://download.opensuse.org/repositories/systemsmanagement:/puppet/SLE_11_SP3/ puppet
fi
echo "[bootstrap] Installing git-core" && \
  sudo zypper in -y --force-resolution git-core
echo "[bootstrap] Installing current puppet version" && \
  sudo zypper in -y --force-resolution puppet
echo "[bootstrap] Installing rubygems (prep for next step)" && \
  sudo zypper in -y --force-resolution rubygems
echo "[bootstrap] Installing r10k, rgen and deep_merge for puppet" && \
  sudo gem install r10k rgen deep_merge

#!/bin/bash

username=$USER

for modfile in $(dirname $(modinfo -n vboxdrv))/*.ko; do
  echo "Signing $modfile"
  sudo /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 \
       /home/$username/keys/luiz-dell.priv \
        /home/$username/keys/luiz-dell.der "$modfile"
done

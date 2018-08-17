#!/bin/bash

for modfile in $(dirname $(modinfo -n vboxdrv))/*.ko; do
  echo "Signing $modfile"
  /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 \
                                /home/luiz/keys/luiz-dell.priv \
                                 /home/luiz/keys/luiz-dell.der "$modfile"
done

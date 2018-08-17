#!/bin/bash

for vmnetdev in $(ls -1 /dev/vmnet*); do
  echo "setting permission in $vmnetdev"
  sudo chmod a+rw $vmnetdev
done

#!/usr/bin/bash

7z x '/home/flynn/VirtualBox VMs/Android/Android.vdi' 'android-9.0-r2/data/data/bn.ereader/files/B&N Downloads'
mv 'android-9.0-r2/data/data/bn.ereader/files/B&N Downloads/Books' ./
rm -r android-9.0-r2/

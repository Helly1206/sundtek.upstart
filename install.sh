#!/bin/bash

echo "Install sUndtek upstart script"
echo "Please execute as root (sudo install.sh)

cp ./tvheadend.override /etc/init/
cp ./sundtek.conf /etc/init/
cp ./sundtek /etc/default/


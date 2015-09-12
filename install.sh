#!/bin/bash

echo "Install Sundtek upstart script"

if [ "$EUID" -ne 0 ]
  then echo "Please execute as root (sudo install.sh)"
  exit
fi

ln -s /opt/bin/mediaclient /bin/mediaclient
cp ./tvheadend.override /etc/init/
cp ./attach.sh /opt/bin/
cp ./sundtekwatchdog.sh /opt/bin/
cp ./sundtek.con /etc/

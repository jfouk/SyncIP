#!/bin/bash
#Script to report public IP address change
#By: Ronny L. Bull

#The file that contains the current pubic IP
EXT_IP_FILE="/home/jfouk/test.txt"
#Get the current public IP from whatsmyip.com
CURRENT_IP=$(curl http://ifconfig.me/ip)
#Check file for previous IP address
# grab the last ip address, this file will serve as a log in case one of the iterations is corrupted
if [ -f $EXT_IP_FILE ]; then
    KNOWN_IP=$(tail $EXT_IP_FILE -n 1)
else
    KNOWN_IP=
fi
#See if the IP has changed
if [ "$CURRENT_IP" != "$KNOWN_IP" ]; then
    echo $CURRENT_IP >> $EXT_IP_FILE
fi

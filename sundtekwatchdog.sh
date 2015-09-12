#!/bin/bash
SLEEPTIME=1
logger -t tvheadend "Sundtek: Watchdog started"
while true
do
	sleep $SLEEPTIME	
	ERROR=$(tail -n 1 /var/log/syslog | grep "No input source available for subscription")
	if [ -n "$ERROR" ]
	then
  		logger -t tvheadend "Sundtek: No input, restart sundtek"
  		/bin/mediaclient --shutdown
  		/bin/mediaclient --start
  		#sleep 30 # wait for tvheadend to settle
  		echo shit
	fi
done

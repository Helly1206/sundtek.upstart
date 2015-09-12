#!/bin/bash

#only start tvheadend when not running yet
#restart sundtek after 5 s
#if watchdog not running, start watchdog
RESTART=5
WATCHDOG="sundtekwatchdog"
WATCHDOGLOC="/opt/bin/$WATCHDOG.sh"
SUNDTEKCLIENT="/bin/mediaclient"

TVHPID=$(pidof tvheadend)

if [ -z "$TVHPID" ]; then
	logger -t tvheadend "Sundtek: Starting TVHeadend"
	service tvheadend restart
	#sleep $RESTART
	#logger -t tvheadend "Sundtek: Restarting Sundtek"
	#$SUNDTEKCLIENT --shutdown
	#$SUNDTEKCLIENT --start
fi

WDRUN=$(ps -All|grep $WATCHDOG)

if [ -z "$WDRUN" ]; then
	logger -t tvheadend "Sundtek: Starting Watchdog"
	$WATCHDOGLOC &
fi

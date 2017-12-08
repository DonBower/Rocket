#!/bin/bash
BASEDIR="/mnt/usbstick"
dateStamp=$(date +"%Y-%m-%d_%H-%M-%S")
GPSERRFILE=$BASEDIR/gpserrlog.txt
BATTERRFILE=$BASEDIR/batterrlog.txt
echo -e "$dateStamp Start GPS, Battery Monitor" >> $BASEDIR/startlog.txt
nohup /home/pi/developer/rocket/GPS/rungps.sh > /dev/null 2>$GPSERRFILE &
nohup /home/pi/developer/rocket/Pi/readlpo.sh > /dev/null 2>$BATTERRFILE &
echo "UID        PID  PPID  C STIME TTY          TIME CMD" >> $BASEDIR/startlog.txt
ps -ef | grep rocket | grep -v startup.sh | grep -v grep >> $BASEDIR/startlog.txt

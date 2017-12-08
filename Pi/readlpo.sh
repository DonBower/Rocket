#!/bin/bash
IFS=":"
BASEDIR="/mnt/usbstick"
#BASEDIR="/Users/don/Developer/Eclipse2017"
dateStamp=$(date +"%Y-%m-%d_%H-%M-%S")
LOGFILE=$BASEDIR/batterylog.txt
lpoPin=`gpio -g read 23`
echo $dateStamp "RaspberryPi Booted, Battery Status is " $lpoPin >> $LOGFILE

while [[ true ]]; do
  lpoPin=`gpio -g read 23`
  if [[ lpoPin == "1" ]]; then
    dateStamp=$(date +"%Y-%m-%d_%H-%M-%S")
    echo $dateStamp "RaspberryPi Battery Status is " $lpoPin >> $LOGFILE
    exit 1
  else
    sleep 1s
  fi
done

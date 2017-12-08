#!/bin/bash
IFS=":"
BASEDIR="/mnt/usbstick"
#BASEDIR="/Users/don/Developer/Eclipse2017"
dateStamp=$(date +"%Y-%m-%d_%H-%M-%S")
LOGFILE=$BASEDIR/batterylog.txt
lboPin=`gpio -g read 23`
prvLBO=$lboPin
echo $dateStamp "RaspberryPi Booted, Battery Status is " $lboPin >> $LOGFILE

while [[ true ]]; do
  lboPin=`gpio -g read 23`
  if [[ "$lboPin" == "$prvLBO" ]]; then
    sleep 1s
  else
    dateStamp=$(date +"%Y-%m-%d_%H-%M-%S")
    echo -e "$dateStamp RaspberryPi Battery Status changed from $prvLBO to $lboPin" >> $LOGFILE
    prvLBO=$lboPin
  fi
done

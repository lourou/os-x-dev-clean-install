#!/bin/bash

// Param
if [ "$1" == "" ]; then
  echo "Usage: sudo throttler.sh [process_name]"
  exit 1
fi

// Config
cpuPerc=20

// Main script
hbpid=$(pgrep "$1")
while true
do
  if [ -z "$hbpid" ]
  then
     echo "No BitDefender running! Exit!"
     exit 1
  fi
    thrpid=$(pgrep cputhrottle)
    if [ -z "$thrpid" ]
    then
      echo "Starting cputhrottle..."
      date
      set -e
      cputhrottle $hbpid $cpuPerc || exit 3
      set +e
    else
      echo "Cputhrottle already running. Exit!"
    fi

    sleep 5
done

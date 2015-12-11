#!/bin/sh

while true;
do
  mongo < /rs.initiate.js

  if [ $? -eq 0 ]; then
    echo "Mongo rs intialized"
    break;
  else
    sleep 3
  fi
done

#http://stackoverflow.com/questions/27694818/interrupt-sleep-in-bash-with-a-signal-trap
trap 'echo "Caught SIGUSR1"' SIGUSR1
echo "Sleeping.  Pid=$$"
while :
do
   sleep 1 &
   wait
done
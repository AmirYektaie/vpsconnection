#!/bin/sh
# This is a comment!

#read input

read -p "Enter your choice [start/stop]:" choice

connect_ssh ()
{
    ssh -p 58432 -D 1375 -N -f root@<Your VPS IP>
}

kill_process()
{
    process_id=`/bin/ps -fu $USER| grep "ssh" | grep -v "grep" | awk '{print $2}'`
    echo I wanna kill this fucking process $process_id
    kill $process_id
}

case $choice in
     start)
          echo "Starting to connect, just wait a minute.....! "
          connect_ssh
          echo "Now you connect to your VPS"
          ;;
     stop)
          echo "Ooops, Are you Sure???"
          kill_process
          echo "It's done. Feel free"
          ;;
     *)
          echo "Sorry, invalid input"
          ;;
esac


